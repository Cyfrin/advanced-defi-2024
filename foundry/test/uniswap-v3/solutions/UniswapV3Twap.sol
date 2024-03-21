// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {TickMath} from "../../../src/uniswap-v3/TickMath.sol";
import {FullMath} from "../../../src/uniswap-v3/FullMath.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";

contract UniswapV3Twap {
    IUniswapV3Pool public immutable pool;
    address public immutable token0;
    address public immutable token1;

    constructor(address _pool) {
        pool = IUniswapV3Pool(_pool);
        token0 = pool.token0();
        token1 = pool.token1();
    }

    function getTwapAmountOut(address tokenIn, uint128 amountIn, uint32 dt)
        external
        view
        returns (uint256 amountOut)
    {
        require(tokenIn == token0 || tokenIn == token1, "invalid token");
        address tokenOut = tokenIn == token0 ? token1 : token0;

        uint32[] memory timeDeltas = new uint32[](2);
        timeDeltas[0] = dt;
        timeDeltas[1] = 0;

        // NOTE int56 since tick * time = int24 * uint32
        (int56[] memory tickCumulatives,) = pool.observe(timeDeltas);
        int56 tickCumulativeDelta = tickCumulatives[1] - tickCumulatives[0];
        // int56 / uint32 = int24
        int24 tick = int24(tickCumulativeDelta / int56(uint56(dt)));
        // Always round to negative infinity
        /*
        int doesn't round down when it is negative

        int56 a = -3
        -3 / 10 = -3.3333... so round down to -4
        but we get
        a / 10 = -3

        so if tickCumulativeDelta < 0 and division has remainder, then round down
        */
        if (
            tickCumulativeDelta < 0
                && (tickCumulativeDelta % int56(uint56(dt)) != 0)
        ) {
            tick--;
        }

        uint160 sqrtRatioX96 = TickMath.getSqrtRatioAtTick(tick);

        // Copied from v3-periphery/libraries/OracleLibrary.sol getQuoteAtTick
        // Calculate amountOut with better precision if it doesn't overflow when multiplied by itself
        if (sqrtRatioX96 <= type(uint128).max) {
            uint256 ratioX192 = uint256(sqrtRatioX96) * sqrtRatioX96;
            amountOut = tokenIn < tokenOut
                ? FullMath.mulDiv(ratioX192, amountIn, 1 << 192)
                : FullMath.mulDiv(1 << 192, amountIn, ratioX192);
        } else {
            uint256 ratioX128 =
                FullMath.mulDiv(sqrtRatioX96, sqrtRatioX96, 1 << 64);
            amountOut = tokenIn < tokenOut
                ? FullMath.mulDiv(ratioX128, amountIn, 1 << 128)
                : FullMath.mulDiv(1 << 128, amountIn, ratioX128);
        }
    }
}
