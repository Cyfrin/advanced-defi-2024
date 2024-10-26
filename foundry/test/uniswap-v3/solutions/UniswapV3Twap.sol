// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {TickMath} from "../../../src/uniswap-v3/TickMath.sol";
import {FullMath} from "../../../src/uniswap-v3/FullMath.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";

error InvalidToken();

contract UniswapV3Twap {
    IUniswapV3Pool public immutable pool;
    address public immutable token0;
    address public immutable token1;

    constructor(address _pool) {
        pool = IUniswapV3Pool(_pool);
        token0 = pool.token0();
        token1 = pool.token1();
    }

    // Copied from
    // https://github.com/Uniswap/v3-periphery/blob/0.8/contracts/libraries/OracleLibrary.sol
    /// @notice Given a tick and a token amount, calculates the amount of token received in exchange
    function getQuoteAtTick(
        int24 tick,
        uint128 baseAmount,
        address baseToken,
        address quoteToken
    ) internal pure returns (uint256 quoteAmount) {
        uint160 sqrtRatioX96 = TickMath.getSqrtRatioAtTick(tick);

        // Calculate quoteAmount with better precision if it doesn't overflow when multiplied by itself
        if (sqrtRatioX96 <= type(uint128).max) {
            uint256 ratioX192 = uint256(sqrtRatioX96) * sqrtRatioX96;
            quoteAmount = baseToken < quoteToken
                ? FullMath.mulDiv(ratioX192, baseAmount, 1 << 192)
                : FullMath.mulDiv(1 << 192, baseAmount, ratioX192);
        } else {
            uint256 ratioX128 =
                FullMath.mulDiv(sqrtRatioX96, sqrtRatioX96, 1 << 64);
            quoteAmount = baseToken < quoteToken
                ? FullMath.mulDiv(ratioX128, baseAmount, 1 << 128)
                : FullMath.mulDiv(1 << 128, baseAmount, ratioX128);
        }
    }

    function getTwapAmountOut(address tokenIn, uint128 amountIn, uint32 dt)
        external
        view
        returns (uint256 amountOut)
    {
        // Task 1 - Require tokenIn is token0 or token1
        if (tokenIn != token0 && tokenIn != token1) {
            revert InvalidToken();
        } // Task 2 - Assign tokenOut
        address tokenOut = tokenIn == token0 ? token1 : token0;

        // Task 3 - Fill out timeDeltas with dt and 0
        uint32[] memory timeDeltas = new uint32[](2);
        timeDeltas[0] = dt;
        timeDeltas[1] = 0;

        // Task 4 - Call pool.observe
        // NOTE int56 since tick * time = int24 * uint32
        (int56[] memory tickCumulatives,) = pool.observe(timeDeltas);

        // Task 5 - Calculate tickCumulativeDelta
        int56 tickCumulativeDelta = tickCumulatives[1] - tickCumulatives[0];

        // Task 6 - Calculate average tick
        // int56 / uint32 = int24
        int24 tick = int24(tickCumulativeDelta / int56(uint56(dt)));

        // Always round to negative infinity
        if (
            tickCumulativeDelta < 0
                && (tickCumulativeDelta % int56(uint56(dt)) != 0)
        ) {
            tick--;
        }

        // Task 7 - Call getQuoteAtTick
        return getQuoteAtTick(tick, amountIn, tokenIn, tokenOut);
    }
}
