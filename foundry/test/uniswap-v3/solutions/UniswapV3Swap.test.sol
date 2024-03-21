// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IWETH} from "../../../src/interfaces/IWETH.sol";
import {ISwapRouter} from "../../../src/interfaces/uniswap-v3/ISwapRouter.sol";
import {
    DAI,
    WETH,
    WBTC,
    UNISWAP_V3_SWAP_ROUTER_02
} from "../../../src/Constants.sol";

contract UniswapV3SwapTest is Test {
    IWETH private weth = IWETH(WETH);
    IERC20 private dai = IERC20(DAI);
    IERC20 private wbtc = IERC20(WBTC);
    ISwapRouter private router = ISwapRouter(UNISWAP_V3_SWAP_ROUTER_02);
    uint24 private constant POOL_FEE = 3000;

    function setUp() public {
        deal(DAI, address(this), 1000 * 1e18);
        dai.approve(address(router), type(uint256).max);
    }

    function test_exactInputSingle() public {
        uint256 amount_out = router.exactInputSingle(
            ISwapRouter.ExactInputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH,
                fee: POOL_FEE,
                recipient: address(this),
                amountIn: 1000 * 1e18,
                amountOutMinimum: 1,
                // NOTE 0 -> (zeroForOne ? TickMath.MIN_SQRT_RATIO + 1 : TickMath.MAX_SQRT_RATIO - 1)
                sqrtPriceLimitX96: 0
            })
        );

        console2.log("Amount out %e", amount_out);
    }

    function test_exactInput() public {
        // DAI -> WETH -> WBTC
        bytes memory path =
            abi.encodePacked(DAI, uint24(3000), WETH, uint24(3000), WBTC);

        uint256 amount_out = router.exactInput(
            ISwapRouter.ExactInputParams({
                path: path,
                recipient: address(this),
                amountIn: 1000 * 1e18,
                amountOutMinimum: 1
            })
        );

        console2.log("Amount out %e", amount_out);
        console2.log("WBTC balance %e", wbtc.balanceOf(address(this)));
    }

    function test_exactOutputSingle() public {
        uint256 amount_in = router.exactOutputSingle(
            ISwapRouter.ExactOutputSingleParams({
                tokenIn: DAI,
                tokenOut: WETH,
                fee: POOL_FEE,
                recipient: address(this),
                amountOut: 0.1 * 1e18,
                amountInMaximum: 1000 * 1e18,
                // NOTE 0 -> (zeroForOne ? TickMath.MIN_SQRT_RATIO + 1 : TickMath.MAX_SQRT_RATIO - 1)
                sqrtPriceLimitX96: 0
            })
        );

        console2.log("Amount in %e", amount_in);
    }

    function test_exactOutput() public {
        // DAI -> WETH -> WBTC
        bytes memory path =
            abi.encodePacked(WBTC, uint24(3000), WETH, uint24(3000), DAI);

        uint256 amount_in = router.exactOutput(
            ISwapRouter.ExactOutputParams({
                path: path,
                recipient: address(this),
                amountOut: 0.01 * 1e8,
                amountInMaximum: 1000 * 1e18
            })
        );

        console2.log("Amount in %e", amount_in);
        console2.log("WBTC balance %e", wbtc.balanceOf(address(this)));
    }
}
