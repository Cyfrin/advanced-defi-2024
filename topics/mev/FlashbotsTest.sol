// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract FlashbotsTest {
    bytes32 public immutable secret;

    receive() external payable {}

    // 0x0d17383814df0d889a76b4bcbf786edcc7ffd0f42c64b3193a52ea26006fa29b
    constructor(bytes32 _secret) payable {
        secret = _secret;
    }

    // phrase = cyfrin
    function unlock(string calldata phrase) external {
        require(keccak256(abi.encode(phrase)) == secret, "incorrect phrase");
        payable(msg.sender).transfer(address(this).balance);
    }
}