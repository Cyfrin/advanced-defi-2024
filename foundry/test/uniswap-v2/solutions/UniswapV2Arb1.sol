// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {IUniswapV2Router02} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Router02.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";

error InsufficientProfit();

contract UniswapV2Arb1 {
    struct SwapParams {
        // Router to execute first swap - tokenIn for tokenOut
        address router0;
        // Router to execute second swap - tokenOut for tokenIn
        address router1;
        // Token in of first swap
        address tokenIn;
        // Token out of first swap
        address tokenOut;
        // Amount in for the first swap
        uint256 amountIn;
        // Revert the arbitrage if profit is less than this minimum
        uint256 minProfit;
    }

    function _swap(SwapParams memory params)
        private
        returns (uint256 amountOut)
    {
        // Swap on router 0
        IERC20(params.tokenIn).approve(address(params.router0), params.amountIn);

        address[] memory path = new address[](2);
        path[0] = params.tokenIn;
        path[1] = params.tokenOut;

        uint256[] memory amounts = IUniswapV2Router02(params.router0)
            .swapExactTokensForTokens({
            amountIn: params.amountIn,
            amountOutMin: 0,
            path: path,
            to: address(this),
            deadline: block.timestamp
        });

        // Swap on router 1
        IERC20(params.tokenOut).approve(address(params.router1), amounts[1]);

        path[0] = params.tokenOut;
        path[1] = params.tokenIn;

        amounts = IUniswapV2Router02(params.router1).swapExactTokensForTokens({
            amountIn: amounts[1],
            amountOutMin: params.amountIn,
            path: path,
            to: address(this),
            deadline: block.timestamp
        });

        amountOut = amounts[1];
    }

    // Exercise 1
    // - Execute an arbitrage between router0 and router1
    // - Pull tokenIn from msg.sender
    // - Send amountIn + profit back to msg.sender
    function swap(SwapParams calldata params) external {
        // Write your code here
        // Don’t change any other code
        IERC20(params.tokenIn).transferFrom(
            msg.sender, address(this), params.amountIn
        );
        uint256 amountOut = _swap(params);
        if (amountOut - params.amountIn < params.minProfit) {
            revert InsufficientProfit();
        }
        IERC20(params.tokenIn).transfer(msg.sender, amountOut);
    }

    // Exercise 2
    // - Execute an arbitrage between router0 and router1 using flash swap
    // - Borrow tokenIn with flash swap from pair
    // - Send profit back to msg.sender
    /**
     * @param pair Address of pair contract to flash swap and borrow tokenIn
     * @param isToken0 True if token to borrow is token0 of pair
     * @param params Swap parameters
     */
    function flashSwap(address pair, bool isToken0, SwapParams calldata params)
        external
    {
        // Write your code here
        // Don’t change any other code
        bytes memory data = abi.encode(msg.sender, pair, params);

        IUniswapV2Pair(pair).swap({
            amount0Out: isToken0 ? params.amountIn : 0,
            amount1Out: isToken0 ? 0 : params.amountIn,
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
        // Write your code here
        // Don’t change any other code
        // NOTE anyone can call
        (address caller, address pair, SwapParams memory params) =
            abi.decode(data, (address, address, SwapParams));

        uint256 amountOut = _swap(params);

        uint256 fee = ((params.amountIn * 3) / 997) + 1;
        uint256 amountToRepay = params.amountIn + fee;

        uint256 profit = amountOut - amountToRepay;
        if (profit < params.minProfit) {
            revert InsufficientProfit();
        }
        IERC20(params.tokenIn).transfer(address(pair), amountToRepay);
        IERC20(params.tokenIn).transfer(caller, profit);
    }
}
