// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {IERC20} from "../../../src/interfaces/IERC20.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";

contract UniswapV3Flash {
    struct FlashCallbackData {
        uint256 amount0;
        uint256 amount1;
        address caller;
    }

    IUniswapV3Pool private immutable pool;
    IERC20 private immutable token0;
    IERC20 private immutable token1;

    constructor(address _pool) {
        pool = IUniswapV3Pool(_pool);
        token0 = IERC20(pool.token0());
        token1 = IERC20(pool.token1());
    }

    function flash(uint256 amount0, uint256 amount1) external {
        // Task 1 - ABI encode FlashCallbackData
        // Task 2 - Call IUniswapV3Pool.flash
    }

    function uniswapV3FlashCallback(
        // Pool fee x amount requested
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external {
        // Task 3 - Check msg.sender is pool
        // Task 4 - Decode data into FlashCallbackData
        // Task 5  - Transfer fees from FlashCallbackData.caller
        // Task 6 - Repay pool, amount borrowed + fee
    }
}
