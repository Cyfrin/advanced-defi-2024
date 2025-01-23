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

contract CurveV1RemoveLiquidityTest is Test {
    IStableSwap3Pool private constant pool = IStableSwap3Pool(CURVE_3POOL);
    IERC20 private constant lp = IERC20(CURVE_3CRV);
    IERC20 private constant dai = IERC20(DAI);
    IERC20 private constant usdc = IERC20(USDC);
    IERC20 private constant usdt = IERC20(USDT);

    function setUp() public {
        deal(DAI, address(this), 1e6 * 1e18);
        dai.approve(address(pool), type(uint256).max);

        uint256[3] memory coins = [uint256(1e6 * 1e18), uint256(0), uint256(0)];
        pool.add_liquidity(coins, 1);
    }

    // Exercise 1
    // Call remove_liquidity
    // Get the 3CRV (LP token of 3Pool) balance of this contract and
    // withdraw all LP for 3 stablecoins (DAI, USDC, USDT)
    function test_remove_liquidity() public {
        uint256[3] memory balsBefore = [
            dai.balanceOf(address(this)),
            usdc.balanceOf(address(this)),
            usdt.balanceOf(address(this))
        ];

        // Write your code here

        uint256[3] memory balsAfter = [
            dai.balanceOf(address(this)),
            usdc.balanceOf(address(this)),
            usdt.balanceOf(address(this))
        ];

        assertEq(lp.balanceOf(address(this)), 0, "3CRV balance > 0");

        assertEq(lp.balanceOf(address(this)), 0, "3CRV balance > 0");

        console2.log("DAI balance %e", balsAfter[0]);
        assertGt(balsAfter[0], balsBefore[0], "DAI balance = 0");

        console2.log("USDC balance %e", balsAfter[1]);
        assertGt(balsAfter[1], balsBefore[1], "USDC balance = 0");

        console2.log("USDT balance %e", balsAfter[2]);
        assertGt(balsAfter[2], balsBefore[2], "USDT balance = 0");
    }

    // Exercise 2
    // Call remove_liquidity_one_coin
    // Get the 3CRV (LP token of 3Pool) balance of this contract and
    // withdraw all LP for a single stablecoin (DAI)
    function test_remove_liquidity_one_coin() public {
        uint256[3] memory balsBefore = [
            dai.balanceOf(address(this)),
            usdc.balanceOf(address(this)),
            usdt.balanceOf(address(this))
        ];

        // Write your code here

        uint256[3] memory balsAfter = [
            dai.balanceOf(address(this)),
            usdc.balanceOf(address(this)),
            usdt.balanceOf(address(this))
        ];

        assertEq(lp.balanceOf(address(this)), 0, "3CRV balance > 0");

        console2.log("DAI balance %e", balsAfter[0]);
        assertGt(balsAfter[0], balsBefore[0], "DAI balance before == after");

        console2.log("USDC balance %e", balsAfter[1]);
        assertEq(balsAfter[1], balsBefore[1], "USDC balance before != after");

        console2.log("USDT balance %e", balsAfter[2]);
        assertEq(balsAfter[2], balsBefore[2], "USDT balance before != after");
    }
}
