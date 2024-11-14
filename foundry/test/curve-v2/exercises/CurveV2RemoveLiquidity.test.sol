// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {ITriCrypto} from "../../../src/interfaces/curve/ITriCrypto.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {
    DAI,
    USDC,
    USDT,
    CURVE_3POOL,
    CURVE_3CRV
} from "../../../src/Constants.sol";

/*
forge test \
--evm-version cancun \
--fork-url $FORK_URL \
--match-test test_remove_liquidity \
--match-path test/curve-v2/exercises/CurveV2RemoveLiquidity.test.sol -vvv
*/

contract CurveV2RemoveLiquidityTest is Test {
    ITriCrypto private constant pool = ITriCrypto(CURVE_3POOL);
    IERC20 private constant lp = IERC20(CURVE_3CRV);
    IERC20 private constant dai = IERC20(DAI);
    IERC20 private constant usdc = IERC20(USDC);
    IERC20 private constant usdt = IERC20(USDT);

    function setUp() public {
        deal(DAI, address(this), 1e6 * 1e18);
        dai.approve(address(pool), type(uint256).max);

        uint256[3] memory amounts = [uint256(1e3 * 1e6), uint256(0), uint256(0)];
        pool.add_liquidity({
            amounts: amounts,
            min_lp: 1,
            use_eth: false,
            receiver: address(this)
        });
    }

    // Exercise 1
    // Call remove_liquidity
    // Get the 3CRV (LP token of 3Pool) balance of this contract and
    // withdraw all LP for 3 stablecoins (DAI, USDC, USDT)
    function test_remove_liquidity() public {
        // Write your code here

        assertEq(lp.balanceOf(address(this)), 0, "3CRV balance > 0");

        uint256 bal = 0;

        bal = dai.balanceOf(address(this));
        assertGt(bal, 0, "DAI balance = 0");
        console2.log("DAI balance %e", bal);

        bal = usdc.balanceOf(address(this));
        assertGt(bal, 0, "USDC balance = 0");
        console2.log("USDC balance %e", bal);

        bal = usdt.balanceOf(address(this));
        assertGt(bal, 0, "USDT balance = 0");
        console2.log("USDT balance %e", bal);
    }

    // Exercise 2
    // Call remove_liquidity_one_coin
    // Get the 3CRV (LP token of 3Pool) balance of this contract and
    // withdraw all LP for a single stablecoin (DAI)
    function test_remove_liquidity_one_coin() public {
        // Write your code here

        uint256 bal = 0;

        bal = dai.balanceOf(address(this));
        assertGt(bal, 0, "DAI balance = 0");
        console2.log("DAI balance %e", bal);

        bal = usdc.balanceOf(address(this));
        assertEq(bal, 0, "USDC balance > 0");
        console2.log("USDC balance %e", bal);

        bal = usdt.balanceOf(address(this));
        assertEq(bal, 0, "USDT balance > 0");
        console2.log("USDT balance %e", bal);
    }
}
