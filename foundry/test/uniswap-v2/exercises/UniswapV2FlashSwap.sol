// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {IERC20} from "../../../src/interfaces/IERC20.sol";

contract UniswapV2FlashSwap {
    IUniswapV2Pair private immutable pair;
    address private immutable token0;
    address private immutable token1;

    constructor(address _pair) {
        pair = IUniswapV2Pair(_pair);
        token0 = pair.token0();
        token1 = pair.token1();
    }

    function flashSwap(address token, uint256 amount) external {
        require(token == token0 || token == token1, "invalid token");

        // Write your code here
        // Don’t change any other code

        // 1. Determine amount0Out and amount1Out
        (uint256 amount0Out, uint256 amount1Out) = (0, 0);

        // 2. Encode token and msg.sender as bytes
        bytes memory data;

        // 3. Call pair.swap
    }

    // Uniswap V2 callback
    function uniswapV2Call(
        address sender,
        uint256 amount0,
        uint256 amount1,
        bytes calldata data
    ) external {
        // Write your code here
        // Don’t change any other code

        // 1. Require msg.sender is pair contract
        // 2. Require sender is this contract
        // Alice -> FlashSwap ---- to = FlashSwap ----> UniswapV2Pair
        //                    <-- sender = FlashSwap --
        // Eve ------------ to = FlashSwap -----------> UniswapV2Pair
        //          FlashSwap <-- sender = Eve --------

        // 3. Decode token and caller from data
        // 4. Determine amount borrowed (only one of them is > 0)
        uint256 amount = 0;

        // 5. Calculate flash swap fee and amount to repay
        // About 0.3% fee, +1 to round up
        uint256 fee = 0;
        uint256 amountToRepay = 0;

        // 6. Get flash swap fee from caller
        // 7. Repay Uniswap V2 pair
    }
}
