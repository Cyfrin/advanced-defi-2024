// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IStableSwap3Pool} from
    "../../../src/interfaces/curve/IStableSwap3Pool.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {
    DAI,
    USDC,
    USDT,
    CURVE_3POOL,
    CURVE_3CRV
} from "../../../src/Constants.sol";

contract CurveV1AddLiquidityTest is Test {
    IStableSwap3Pool private constant pool = IStableSwap3Pool(CURVE_3POOL);
    IERC20 private constant lp = IERC20(CURVE_3CRV);
    IERC20 private constant dai = IERC20(DAI);
    IERC20 private constant usdc = IERC20(USDC);
    IERC20 private constant usdt = IERC20(USDT);

    function setUp() public {
        deal(DAI, address(this), 1e6 * 1e18);
        dai.approve(address(pool), type(uint256).max);
    }

    // Exercise 1
    // Call add_liquidity
    // Add 1,000,000 DAI of liquidity to the pool contract
    function test_add_liquidity() public {
        // Write your code here

        uint256 lpBal = lp.balanceOf(address(this));
        assertGt(lpBal, 0);
    }
}
