// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {ITriCrypto} from "../../../src/interfaces/curve/ITriCrypto.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {USDC, WBTC, WETH, CURVE_TRI_CRYPTO} from "../../../src/Constants.sol";

// forge test --evm-version cancun --fork-url $FORK_URL --match-path test/curve-v2/solutions/CurveV2Swap.test.sol -vvv

contract CurveV2SwapTest is Test {
    ITriCrypto private constant pool = ITriCrypto(CURVE_TRI_CRYPTO);
    IERC20 private constant usdc = IERC20(USDC);
    IERC20 private constant wbtc = IERC20(WBTC);
    IERC20 private constant weth = IERC20(WETH);

    function setUp() public {
        deal(WETH, address(this), 1e18);
        weth.approve(address(pool), type(uint256).max);
    }

    // Exercise 1
    // Call get_dy to calculate the amount of USDC for swapping
    // 1 WETH to USDC
    function test_get_dy() public {
        // Calculate swap from WETH to USDC
        uint256 dy = pool.get_dy(2, 0, 1e18);

        console2.log("dy %e", dy);
        assertGt(dy, 0, "dy = 0");
    }

    // Exercise 2
    // Call exchange to swap 1 WETH to USDC
    function test_exchange() public {
        // Swap WETH to USDC
        pool.exchange({
            i: 2,
            j: 0,
            dx: 1e18,
            min_dy: 1,
            use_eth: false,
            receiver: address(this)
        });

        uint256 bal = usdc.balanceOf(address(this));
        console2.log("USDC balance %e", bal);
        assertGt(bal, 0, "USDC balance = 0");
    }
}
