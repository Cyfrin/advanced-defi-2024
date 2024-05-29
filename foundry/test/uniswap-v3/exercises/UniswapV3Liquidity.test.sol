// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IWETH} from "../../../src/interfaces/IWETH.sol";
import {INonfungiblePositionManager} from
    "../../../src/interfaces/uniswap-v3/INonfungiblePositionManager.sol";
import {
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

    // 0.3%
    int24 private constant MIN_TICK = -887272;
    int24 private constant MAX_TICK = 887272;
    // DAI/WETH 3000
    uint24 private constant POOL_FEE = 3000;
    int24 private constant TICK_SPACING = 60;

    function setUp() public {
        deal(DAI, address(this), 3000 * 1e18);
        deal(WETH, address(this), 3 * 1e18);

        weth.approve(address(manager), type(uint256).max);
        dai.approve(address(manager), type(uint256).max);
    }

    function mint() private returns (uint256 tokenId) {
        (tokenId,,,) = manager.mint(
            INonfungiblePositionManager.MintParams({
                token0: DAI,
                token1: WETH,
                fee: POOL_FEE,
                tickLower: MIN_TICK / TICK_SPACING * TICK_SPACING,
                tickUpper: MAX_TICK / TICK_SPACING * TICK_SPACING,
                amount0Desired: 1000 * 1e18,
                amount1Desired: 1e18,
                amount0Min: 0,
                amount1Min: 0,
                recipient: address(this),
                deadline: block.timestamp
            })
        );
    }

    function getPosition(uint256 tokenId)
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
        ) = manager.positions(tokenId);

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

    // Exercise 1
    // Mint a new position by adding liquidity to DAI/WETH pool with 0.3% fee.
    // - You are free to choose the price range
    // - Ticks must be divisible by tick spacing of the pool
    // - This test contract is given 3000 DAI and 3 WETH. Put any amount of tokens
    //   not exceeding this contracts's balance.
    // - Set recipient of NFT (that represents the ownership of this position) to this contract.
    function test_mint() public {
        // Write your code here
        (uint256 tokenId, uint128 liquidity, uint256 amount0, uint256 amount1) =
            (0, 0, 0, 0);

        console2.log("Amount 0 added %e", amount0);
        console2.log("Amount 1 added %e", amount1);

        assertEq(manager.ownerOf(tokenId), address(this));

        Position memory position = getPosition(tokenId);
        assertEq(position.token0, DAI);
        assertEq(position.token1, WETH);
        assertGt(position.liquidity, 0);
    }

    // Exercise 2
    // Increase liquidity for the position with token id = `tokenId`.
    // 3000 DAI and 3 WETH were initially given to this contract.
    // Some of the tokens where used to mint a new position.
    // Use any token amount less than or equal to contract's balance.
    function test_increaseLiquidity() public {
        uint256 tokenId = mint();
        Position memory p0 = getPosition(tokenId);

        // Write your code here
        (uint256 liquidityDelta, uint256 amount0, uint256 amount1) = (0, 0, 0);

        console2.log("Amount 0 added %e", amount0);
        console2.log("Amount 1 added %e", amount1);

        Position memory p1 = getPosition(tokenId);
        assertGt(p1.liquidity, p0.liquidity);
        assertGt(liquidityDelta, 0);
    }

    // Exercise 3
    // Decrease liquidity for the position with token id = `tokenId`.
    // - Amount of liquidity to decrease cannot exceed the position's liquidity.
    function test_decreaseLiquidity() public {
        uint256 tokenId = mint();
        Position memory p0 = getPosition(tokenId);

        // Write your code here
        (uint256 amount0, uint256 amount1) = (0, 0);

        console2.log("Amount 0 decreased %e", amount0);
        console2.log("Amount 1 decreased %e", amount1);

        Position memory p1 = getPosition(tokenId);
        assertEq(p1.liquidity, 0);
        assertGt(p1.tokensOwed0, 0);
        assertGt(p1.tokensOwed1, 0);
    }

    // Exercise 4
    // Remove all liquidity (including fees) from a position by calling collect()
    // - Decrease all liquidity for the position with token id = `tokenId`
    // - Transfer tokens from NonFungiblePositionManager to this contract
    //   by calling collect()
    function test_collect() public {
        uint256 tokenId = mint();
        Position memory p0 = getPosition(tokenId);

        // Write your code here
        (uint256 amount0, uint256 amount1) = (0, 0);

        console2.log("--- collect ---");
        console2.log("Amount 0 collected %e", amount0);
        console2.log("Amount 1 collected %e", amount1);

        Position memory p1 = getPosition(tokenId);

        assertEq(p1.liquidity, 0);
        assertEq(p1.tokensOwed0, 0);
        assertEq(p1.tokensOwed1, 0);
    }
}
