// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IWETH} from "../../../src/interfaces/IWETH.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";
import {ISwapRouter} from "../../../src/interfaces/uniswap-v3/ISwapRouter.sol";
import {UniswapV3FlashSwap} from "./UniswapV3FlashSwap.sol";
import {
    WETH,
    DAI,
    UNISWAP_V3_SWAP_ROUTER_02,
    UNISWAP_V3_POOL_DAI_WETH_3000,
    UNISWAP_V3_POOL_DAI_WETH_500,
    UNISWAP_V3_SWAP_ROUTER_02
} from "../../../src/Constants.sol";

uint24 constant FEE_0 = 3000;
uint24 constant FEE_1 = 500;

contract UniswapV3FlashTest is Test {
    IERC20 private constant dai = IERC20(DAI);
    IWETH private constant weth = IWETH(WETH);
    ISwapRouter private constant router = ISwapRouter(UNISWAP_V3_SWAP_ROUTER_02);
    IUniswapV3Pool private constant pool0 =
        IUniswapV3Pool(UNISWAP_V3_POOL_DAI_WETH_3000);
    IUniswapV3Pool private constant pool1 =
        IUniswapV3Pool(UNISWAP_V3_POOL_DAI_WETH_500);
    UniswapV3FlashSwap private flashSwap;

    uint256 private constant DAI_AMOUNT_IN = 10 * 1e18;

    function setUp() public {
        flashSwap = new UniswapV3FlashSwap();

        // Create an arbitrage opportunity - make WETH cheaper on pool0
        weth.deposit{value: 100 * 1e18}();
        weth.approve(address(router), 100 * 1e18);
        router.exactInputSingle(
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WETH,
                tokenOut: DAI,
                fee: FEE_0,
                recipient: address(0),
                amountIn: 100 * 1e18,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            })
        );
    }

    function test_flashSwap() public {
        uint256 bal0 = dai.balanceOf(address(this));
        flashSwap.flashSwap({
            pool0: address(pool0),
            fee1: FEE_1,
            tokenIn: DAI,
            tokenOut: WETH,
            amountIn: DAI_AMOUNT_IN
        });
        uint256 bal1 = dai.balanceOf(address(this));
        uint256 profit = bal1 - bal0;
        assertGt(profit, 0, "profit = 0");
        console2.log("DAI profit %e", profit);
    }
}
