// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface ITriCrypto {
    function get_dy(uint256 i, uint256 j, uint256 dx)
        external
        view
        returns (uint256 dy);
    function exchange(
        uint256 i,
        uint256 j,
        uint256 dx,
        uint256 min_dy,
        bool use_eth,
        address receiver
    ) external;
    function add_liquidity(
        uint256[3] calldata amounts,
        uint256 min_lp,
        bool use_eth,
        address receiver
    ) external returns (uint256 lp);
    function remove_liquidity(
        uint256 lp,
        uint256[3] calldata min_amounts,
        bool use_eth,
        address receiver,
        bool claim_admin_fees
    ) external returns (uint256[3] memory);
    function remove_liquidity_one_coin(
        uint256 lp,
        uint256 i,
        uint256 min_amount,
        bool use_eth,
        address receiver
    ) external returns (uint256);
    function balanceOf(address) external view returns (uint256);
}
