// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IUniswapV3FlashCallback {
    function uniswapV3FlashCallback(
        uint256 fee0,
        uint256 fee1,
        bytes calldata data
    ) external;
}
