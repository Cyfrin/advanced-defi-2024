// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IUniswapV2Router02} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Router02.sol";
import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {
    DAI,
    WETH,
    UNISWAP_V2_ROUTER_02,
    UNISWAP_V2_PAIR_DAI_WETH
} from "../../../src/Constants.sol";
import {UniswapV2Twap} from "./UniswapV2Twap.sol";

contract UniswapV2TwapTest is Test {
    IERC20 private constant weth = IERC20(WETH);
    IUniswapV2Pair private constant pair =
        IUniswapV2Pair(UNISWAP_V2_PAIR_DAI_WETH);
    IUniswapV2Router02 private constant router =
        IUniswapV2Router02(UNISWAP_V2_ROUTER_02);

    uint256 private constant MIN_WAIT = 300;

    UniswapV2Twap private twap;

    function setUp() public {
        twap = new UniswapV2Twap(address(pair));
    }

    function getSpot() internal view returns (uint256) {
        (uint112 reserve0, uint112 reserve1,) = pair.getReserves();
        // DAI / WETH
        return uint256(reserve0) * 1e18 / uint256(reserve1);
    }

    function swap() internal {
        deal(WETH, address(this), 100 * 1e18);
        weth.approve(address(router), type(uint256).max);

        address[] memory path = new address[](2);
        path[0] = WETH;
        path[1] = DAI;

        // Input token amount and all subsequent output token amounts
        uint256[] memory amounts = router.swapExactTokensForTokens({
            amountIn: 100 * 1e18,
            amountOutMin: 1,
            path: path,
            to: address(this),
            deadline: block.timestamp
        });
    }

    function test_twap_same_price() public {
        skip(MIN_WAIT + 1);
        twap.update();

        uint256 twap0 = twap.consult(WETH, 1e18);

        skip(MIN_WAIT + 1);
        twap.update();

        uint256 twap1 = twap.consult(WETH, 1e18);

        assertApproxEqAbs(twap0, twap1, 1, "ETH TWAP");
    }

    function test_twap_close_to_last_spot() public {
        // Update TWAP
        skip(MIN_WAIT + 1);
        twap.update();

        // Get TWAP
        uint256 twap0 = twap.consult(WETH, 1e18);

        // Swap
        swap();
        uint256 spot = getSpot();
        console2.log("ETH spot price", spot);

        // Update TWAP
        skip(MIN_WAIT + 1);
        twap.update();

        // Get TWAP
        uint256 twap1 = twap.consult(WETH, 1e18);

        console2.log("twap0", twap0);
        console2.log("twap1", twap1);

        // Check TWAP is close to last spot
        assertLt(twap1, twap0, "twap1 >= twap0");
        assertGe(twap1, spot, "twap1 < spot");
    }
}
