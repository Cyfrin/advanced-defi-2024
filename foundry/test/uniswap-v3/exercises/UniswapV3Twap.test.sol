// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {
    WETH,
    USDC,
    UNISWAP_V3_POOL_USDC_WETH_500
} from "../../../src/Constants.sol";
import {UniswapV3Twap} from "./UniswapV3Twap.sol";

contract UniswapV3TwapTest is Test {
    UniswapV3Twap private twap;

    function setUp() public {
        twap = new UniswapV3Twap(UNISWAP_V3_POOL_USDC_WETH_500);
    }

    function test_twap() public {
        uint256 usdcOut =
            twap.getTwapAmountOut({tokenIn: WETH, amountIn: 1e18, dt: 3600});

        console2.log("USDC out %e", usdcOut);
    }
}
