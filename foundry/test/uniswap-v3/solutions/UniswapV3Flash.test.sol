// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {
    UNISWAP_V3_POOL_DAI_WETH_3000,
    DAI,
    WETH
} from "../../../src/Constants.sol";
import {UniswapV3Flash} from "./UniswapV3Flash.sol";

contract UniswapV3FlashTest is Test {
    IERC20 private constant weth = IERC20(WETH);
    IERC20 private constant dai = IERC20(DAI);
    UniswapV3Flash private uni;

    function setUp() public {
        uni = new UniswapV3Flash(UNISWAP_V3_POOL_DAI_WETH_3000);

        deal(DAI, address(this), 1e3 * 1e18);
        dai.approve(address(uni), type(uint256).max);
    }

    function test_flash() public {
        uint256 daiBefore = dai.balanceOf(address(this));
        uni.flash(1e3 * 1e18, 0);
        uint256 daiAfter = dai.balanceOf(address(this));

        uint256 fee = daiBefore - daiAfter;
        console2.log("DAI fee", fee);
    }
}
