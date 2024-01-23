// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IUniswapV2Router02} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Router02.sol";
import {
    DAI,
    UNISWAP_V2_ROUTER_02,
    UNISWAP_V2_PAIR_DAI_WETH
} from "../../../src/Constants.sol";
import {UniswapV2FlashSwap} from "./UniswapV2FlashSwap.sol";

contract UniswapV2FlashSwapTest is Test {
    IERC20 private constant dai = IERC20(DAI);

    IUniswapV2Router02 private constant router =
        IUniswapV2Router02(UNISWAP_V2_ROUTER_02);
    UniswapV2FlashSwap private flashSwap;

    address private constant user = address(100);

    function setUp() public {
        flashSwap = new UniswapV2FlashSwap(UNISWAP_V2_PAIR_DAI_WETH);

        deal(DAI, user, 10000 * 1e18);
        vm.prank(user);
        dai.approve(address(flashSwap), type(uint256).max);
    }

    function test_flashSwap() public {
        uint256 dai0 = dai.balanceOf(UNISWAP_V2_PAIR_DAI_WETH);
        vm.prank(user);
        flashSwap.flashSwap(DAI, 1e6 * 1e18);
        uint256 dai1 = dai.balanceOf(UNISWAP_V2_PAIR_DAI_WETH);

        console2.log("DAI fee", dai1 - dai0);
        assertGe(dai1, dai0, "DAI balance of pair");
    }
}
