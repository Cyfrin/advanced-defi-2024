// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";

contract UniswapV2Arb2 {
    struct FlashSwapData {
        address caller;
        address pair0;
        address pair1;
    }

    function flash(
        address pair0,
        address pair1,
        bool isTokenZero,
        uint256 amountOut
    ) external {
        bytes memory data;

        IUniswapV2Pair(pair0).swap({
            amount0Out: isTokenZero ? amountOut : 0,
            amount1Out: isTokenZero ? 0 : amountOut,
            to: address(this),
            data: data
        });
    }

    function uniswapV2Call(
        address sender,
        uint256 amount0Out,
        uint256 amount1Out,
        bytes calldata data
    ) external {
        FlashSwapData memory decoded = abi.decode(data, (FlashSwapData));

        require(msg.sender == decoded.pair0, "not authorized");
        require(sender == address(this), "not sender");

        // 2. pair1.swap
        uint256 amount0Out;
        uint256 amount1Out;
        IUniswapV2Pair(decoded.pair1).swap({
            amount0Out: amount0Out,
            amount1Out: amount1Out,
            to: address(this),
            data: ""
        });

        // 3. Repay pair0

        // 4. Transfer profit to caller
    }
}
