pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";
import {UNISWAP_V3_POOL_USDC_WETH_500} from "../../../src/Constants.sol";

contract UniswapV3SwapTest is Test {
    // token0 (X)
    uint256 private constant USDC_DECIMALS = 1e6;
    // token1 (Y)
    uint256 private constant WETH_DECIMALS = 1e18;
    uint256 private constant Q96 = 1 << 96;
    IUniswapV3Pool private immutable pool =
        IUniswapV3Pool(UNISWAP_V3_POOL_USDC_WETH_500);

    function test_spot_price_from_sqrtPriceX96() public {
        // Get price of WETH in terms of USDC normalized to 18 decimals
        // 1e18 = 1 USDC
        uint256 price = 0;
        IUniswapV3Pool.Slot0 memory slot0 = pool.slot0();

        // P = Y / X = WETH / USDC
        //           = price of USDC in terms of WETH
        // P has 1e18 / 1e6 decimals
        // 1 / P has 1e6 / 1e18 decimals
        // sqrtPriceX96 = sqrt(P) * Q96
        // TODO: use muldiv?
        price = slot0.sqrtPriceX96 / Q96 * slot0.sqrtPriceX96 / Q96;
        price = 1e12 * 1e18 / price;

        assertGt(price, 0, "price = 0");
        console2.log("price %e", price);
    }
}
