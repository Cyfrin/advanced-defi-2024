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
        bool isZeroForOne;
        uint256 amountIn;
        uint256 amountOut;
        uint256 minProfit;
    }

    function flashSwap(
        address pair0,
        address pair1,
        bool isZeroForOne,
        uint256 amountIn,
        uint256 minProfit
    ) external {
        (uint112 reserve0, uint112 reserve1,) =
            IUniswapV2Pair(pair0).getReserves();

        uint256 amountOut = isZeroForOne
            ? getAmountOut(amountIn, reserve0, reserve1)
            : getAmountOut(amountIn, reserve1, reserve0);

        bytes memory data = abi.encode(
            FlashSwapData({
                caller: msg.sender,
                pair0: pair0,
                pair1: pair1,
                isZeroForOne: isZeroForOne,
                amountIn: amountIn,
                amountOut: amountOut,
                minProfit: minProfit
            })
        );

        IUniswapV2Pair(pair0).swap({
            amount0Out: isZeroForOne ? 0 : amountOut,
            amount1Out: isZeroForOne ? amountOut : 0,
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
        // NOTE - anyone can call

        FlashSwapData memory params = abi.decode(data, (FlashSwapData));

        // Token in and token out from flash swap
        address token0 = IUniswapV2Pair(params.pair0).token0();
        address token1 = IUniswapV2Pair(params.pair0).token1();
        (address tokenIn, address tokenOut) =
            params.isZeroForOne ? (token0, token1) : (token1, token0);

        // 2. pair1.swap
        (uint112 reserve0, uint112 reserve1,) =
            IUniswapV2Pair(params.pair1).getReserves();

        uint256 amountOut = params.isZeroForOne
            ? getAmountOut(params.amountOut, reserve1, reserve0)
            : getAmountOut(params.amountOut, reserve0, reserve1);

        IERC20(tokenOut).transfer(params.pair1, params.amountOut);

        IUniswapV2Pair(params.pair1).swap({
            amount0Out: params.isZeroForOne ? amountOut : 0,
            amount1Out: params.isZeroForOne ? 0 : amountOut,
            to: address(this),
            data: ""
        });

        // 3. Repay pair0
        // TODO: correct fee?
        // uint256 fee = ((params.amountIn * 3) / 997) + 1;
        // uint256 amountToRepay = params.amountIn + fee;
        IERC20(tokenIn).transfer(params.pair0, params.amountIn);

        // 4. Transfer profit to caller
        uint256 profit = amountOut - params.amountIn;
        require(profit >= params.minProfit, "profit < min");
        IERC20(tokenIn).transfer(params.caller, profit);
    }

    // TODO: clean
    function getAmountIn(
        uint256 amountOut,
        uint256 reserveIn,
        uint256 reserveOut
    ) internal pure returns (uint256 amountIn) {
        uint256 numerator = reserveIn * amountOut * 1000;
        uint256 denominator = (reserveOut - amountOut) * 997;
        amountIn = (numerator / denominator) + 1;
    }

    function getAmountOut(
        uint256 amountIn,
        uint256 reserveIn,
        uint256 reserveOut
    ) internal pure returns (uint256 amountOut) {
        uint256 amountInWithFee = amountIn * 997;
        uint256 numerator = amountInWithFee * reserveOut;
        uint256 denominator = reserveIn * 1000 + amountInWithFee;
        amountOut = numerator / denominator;
    }
}
