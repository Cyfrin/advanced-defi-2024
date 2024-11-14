// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

interface IStableSwap3Pool {
    function balances(uint256 i) external view returns (uint256);
    function get_dy_underlying(int128 i, int128 j, uint256 dx)
        external
        view
        returns (uint256 dy);
    function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy)
        external;
    function add_liquidity(uint256[3] calldata coins, uint256 min_lp)
        external;
    function remove_liquidity(uint256 lp, uint256[3] calldata min_coins)
        external;
    function remove_liquidity_one_coin(uint256 lp, int128 i, uint256 min_coin)
        external;
    function calc_withdraw_one_coin(uint256 lp, int128 i)
        external
        view
        returns (uint256 coin);
}
