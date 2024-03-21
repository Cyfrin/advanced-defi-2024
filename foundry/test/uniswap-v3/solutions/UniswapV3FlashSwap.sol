// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {ISwapRouter} from "../../../src/interfaces/uniswap-v3/ISwapRouter.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";
import {UNISWAP_V3_SWAP_ROUTER_02} from "../../../src/Constants.sol";

contract UniswapV3FlashSwap {
    ISwapRouter constant router = ISwapRouter(UNISWAP_V3_SWAP_ROUTER_02);

    uint160 internal constant MIN_SQRT_RATIO = 4295128739;
    uint160 internal constant MAX_SQRT_RATIO =
        1461446703485210103287273052203988822378723970342;

    function flashSwap(
        address pool0,
        uint24 fee1,
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    ) external {
        bool zeroForOne = tokenIn < tokenOut;
        uint160 sqrtPriceLimitX96 =
            zeroForOne ? MIN_SQRT_RATIO + 1 : MAX_SQRT_RATIO - 1;
        bytes memory data = abi.encode(
            msg.sender, pool0, fee1, tokenIn, tokenOut, amountIn, zeroForOne
        );

        IUniswapV3Pool(pool0).swap(
            address(this), zeroForOne, int256(amountIn), sqrtPriceLimitX96, data
        );
    }

    function _swap(
        address tokenIn,
        address tokenOut,
        uint24 fee,
        uint256 amountIn,
        uint256 amountOutMin
    ) private returns (uint256 amountOut) {
        IERC20(tokenIn).approve(address(router), amountIn);

        ISwapRouter.ExactInputSingleParams memory params = ISwapRouter
            .ExactInputSingleParams({
            tokenIn: tokenIn,
            tokenOut: tokenOut,
            fee: fee,
            recipient: address(this),
            amountIn: amountIn,
            amountOutMinimum: amountOutMin,
            sqrtPriceLimitX96: 0
        });

        amountOut = router.exactInputSingle(params);
    }

    function uniswapV3SwapCallback(
        int256 amount0,
        int256 amount1,
        bytes calldata data
    ) external {
        (
            address caller,
            address pool0,
            uint24 fee1,
            address tokenIn,
            address tokenOut,
            uint256 amountIn,
            bool zeroForOne
        ) = abi.decode(
            data, (address, address, uint24, address, address, uint256, bool)
        );

        uint256 amountOut = zeroForOne ? uint256(-amount1) : uint256(-amount0);

        uint256 buyBackAmount = _swap({
            tokenIn: tokenOut,
            tokenOut: tokenIn,
            fee: fee1,
            amountIn: amountOut,
            amountOutMin: amountIn
        });

        uint256 profit = buyBackAmount - amountIn;
        require(profit > 0, "0 profit");

        IERC20(tokenIn).transfer(address(pool0), amountIn);
        IERC20(tokenIn).transfer(caller, profit);
    }
}
