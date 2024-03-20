// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IWETH} from "../../../src/interfaces/IWETH.sol";
import {INonfungiblePositionManager} from
    "../../../src/interfaces/uniswap-v3/INonfungiblePositionManager.sol";
import {ISwapRouter} from "../../../src/interfaces/uniswap-v3/ISwapRouter.sol";
import {
    UNISWAP_V3_SWAP_ROUTER_02,
    UNISWAP_V3_NONFUNGIBLE_POSITION_MANAGER,
    DAI,
    WETH
} from "../../../src/Constants.sol";

struct Position {
    uint96 nonce;
    address operator;
    address token0;
    address token1;
    uint24 fee;
    int24 tickLower;
    int24 tickUpper;
    uint128 liquidity;
    uint256 feeGrowthInside0LastX128;
    uint256 feeGrowthInside1LastX128;
    uint128 tokensOwed0;
    uint128 tokensOwed1;
}

contract UniswapV3LiquidityTest is Test {
    IWETH private constant weth = IWETH(WETH);
    IERC20 private constant dai = IERC20(DAI);
    INonfungiblePositionManager private constant manager =
        INonfungiblePositionManager(UNISWAP_V3_NONFUNGIBLE_POSITION_MANAGER);
    ISwapRouter private router = ISwapRouter(UNISWAP_V3_SWAP_ROUTER_02);

    // 0.3%
    int24 private constant MIN_TICK = -887272;
    int24 private constant MAX_TICK = 887272;
    // DAI/WETH 3000
    uint24 private constant POOL_FEE = 3000;
    int24 private constant TICK_SPACING = 60;

    address[] private users = [address(11), address(12)];

    function setUp() public {
        deal(DAI, address(this), 3000 * 1e18);
        deal(WETH, address(this), 3 * 1e18);

        weth.approve(address(manager), type(uint256).max);
        dai.approve(address(manager), type(uint256).max);
    }

    function swap() private {
        deal(DAI, users[0], 1000 * 1e18);
        vm.startPrank(users[0]);
        dai.approve(address(router), type(uint256).max);
        router.exactInputSingle(
            ISwapRouter.ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH,
                fee: POOL_FEE,
                recipient: users[0],
                amountIn: 1000 * 1e18,
                amountOutMinimum: 1,
                // NOTE 0 -> (zeroForOne ? TickMath.MIN_SQRT_RATIO + 1 : TickMath.MAX_SQRT_RATIO - 1)
                sqrtPriceLimitX96: 0
            })
        );
        vm.stopPrank();
    }

    function get_position(uint256 token_id)
        private
        view
        returns (Position memory)
    {
        (
            uint96 nonce,
            address operator,
            address token0,
            address token1,
            uint24 fee,
            int24 tickLower,
            int24 tickUpper,
            uint128 liquidity,
            uint256 feeGrowthInside0LastX128,
            uint256 feeGrowthInside1LastX128,
            uint128 tokensOwed0,
            uint128 tokensOwed1
        ) = manager.positions(token_id);

        Position memory position = Position({
            nonce: nonce,
            operator: operator,
            token0: token0,
            token1: token1,
            fee: fee,
            tickLower: tickLower,
            tickUpper: tickUpper,
            liquidity: liquidity,
            feeGrowthInside0LastX128: feeGrowthInside0LastX128,
            feeGrowthInside1LastX128: feeGrowthInside1LastX128,
            tokensOwed0: tokensOwed0,
            tokensOwed1: tokensOwed1
        });

        return position;
    }

    function test_liquidity() public {
        int24 tickLower = MIN_TICK / TICK_SPACING * TICK_SPACING;
        int24 tickUpper = MAX_TICK / TICK_SPACING * TICK_SPACING;

        // Mint
        (uint256 token_id, uint128 liquidity, uint256 amount0, uint256 amount1)
        = manager.mint(
            INonfungiblePositionManager.MintParams({
                token0: DAI,
                token1: WETH,
                fee: POOL_FEE,
                // NOTE - tick must be divisible by tick spacing
                tickLower: tickLower,
                tickUpper: tickUpper,
                amount0Desired: 1000 * 1e18,
                amount1Desired: 1e18,
                amount0Min: 0,
                amount1Min: 0,
                recipient: address(this),
                deadline: block.timestamp
            })
        );

        console2.log("--- mint ---");
        console2.log("Amount 0 added %e", amount0);
        console2.log("Amount 1 added %e", amount1);

        // Increase liquidity
        (liquidity, amount0, amount1) = manager.increaseLiquidity(
            INonfungiblePositionManager.IncreaseLiquidityParams({
                tokenId: token_id,
                amount0Desired: 500 * 1e18,
                amount1Desired: 1e18,
                amount0Min: 0,
                amount1Min: 0,
                deadline: block.timestamp
            })
        );

        console2.log("--- increase ---");
        console2.log("Amount 0 added %e", amount0);
        console2.log("Amount 1 added %e", amount1);

        // Decrease liquidity
        Position memory position = get_position(token_id);

        // (amount0, amount1) = manager.decreaseLiquidity(
        //     INonfungiblePositionManager.DecreaseLiquidityParams({
        //         tokenId: token_id,
        //         liquidity: position.liquidity,
        //         amount0Min: 0,
        //         amount1Min: 0,
        //         deadline: block.timestamp
        //     })
        // );

        // console2.log("--- decrease ---");
        // console2.log("Amount 0 removed %e", amount0);
        // console2.log("Amount 1 removed %e", amount1);

        // position = get_position(token_id);

        // console2.log("Liquidity %e", position.liquidity);
        // console2.log("Amount 0 owed %e", position.tokensOwed0);
        // console2.log("Amount 1 owed %e", position.tokensOwed1);

        // Collect
        swap();

        uint256 dai_bal0 = dai.balanceOf(address(this));
        uint256 weth_bal0 = weth.balanceOf(address(this));

        (amount0, amount1) = manager.collect(
            INonfungiblePositionManager.CollectParams({
                tokenId: token_id,
                recipient: address(this),
                amount0Max: type(uint128).max,
                amount1Max: type(uint128).max
            })
        );

        uint256 dai_bal1 = dai.balanceOf(address(this));
        uint256 weth_bal1 = weth.balanceOf(address(this));

        console2.log("--- collect ---");
        console2.log("Amount 0 collected %e", amount0);
        console2.log("Amount 1 collected %e", amount1);

        console2.log("DAI diff %e", dai_bal1 - dai_bal0);
        console2.log("WETH diff %e", weth_bal1 - weth_bal0);

        position = get_position(token_id);

        console2.log("Liquidity %e", position.liquidity);
        console2.log("Amount 0 owed %e", position.tokensOwed0);
        console2.log("Amount 1 owed %e", position.tokensOwed1);
    }
}
