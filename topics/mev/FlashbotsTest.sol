// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract FlashbotsTest {
    uint public count;

    function inc() external {
        count += 1;
    }
}