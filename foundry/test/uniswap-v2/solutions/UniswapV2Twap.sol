// SPDX-License-Identifier: MIT
pragma solidity >= 0.4 < 0.9;

import {IUniswapV2Pair} from
    "../../../src/interfaces/uniswap-v2/IUniswapV2Pair.sol";
import {FixedPoint} from "../../../src/uniswap-v2/FixedPoint.sol";

// Modified from https://github.com/Uniswap/v2-periphery/blob/master/contracts/examples/ExampleOracleSimple.sol
contract UniswapV2Twap {
    using FixedPoint for *;

    uint256 private constant MIN_WAIT = 300;

    IUniswapV2Pair public immutable pair;
    address public immutable token0;
    address public immutable token1;

    uint256 public price0CumulativeLast;
    uint256 public price1CumulativeLast;
    uint32 public updatedAt;

    // NOTE: binary fixed point numbers
    // range: [0, 2**112 - 1]
    // resolution: 1 / 2**112
    FixedPoint.uq112x112 public price0Avg;
    FixedPoint.uq112x112 public price1Avg;

    constructor(address _pair) {
        pair = IUniswapV2Pair(_pair);
        token0 = pair.token0();
        token1 = pair.token1();
        price0CumulativeLast = pair.price0CumulativeLast();
        price1CumulativeLast = pair.price1CumulativeLast();
        (,, updatedAt) = pair.getReserves();
    }

    function _approximateCurrentCumulativePrices()
        internal
        view
        returns (
            uint256 price0Cumulative,
            uint256 price1Cumulative,
            uint32 blockTimestamp
        )
    {
        blockTimestamp = uint32(block.timestamp);
        price0Cumulative = pair.price0CumulativeLast();
        price1Cumulative = pair.price1CumulativeLast();

        // if time has elapsed since the last update on the pair,
        // mock the accumulated price values
        (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) =
            pair.getReserves();
        if (blockTimestampLast != blockTimestamp) {
            uint32 timeElapsed = blockTimestamp - blockTimestampLast;
            // addition overflow is desired
            unchecked {
                price0Cumulative += uint256(
                    FixedPoint.fraction(reserve1, reserve0)._x
                ) * timeElapsed;
                price1Cumulative += uint256(
                    FixedPoint.fraction(reserve0, reserve1)._x
                ) * timeElapsed;
            }
        }
    }

    function update() external {
        (
            uint256 price0Cumulative,
            uint256 price1Cumulative,
            uint32 blockTimestamp
        ) = _approximateCurrentCumulativePrices();
        uint32 dt = blockTimestamp - updatedAt;
        require(dt >= MIN_WAIT, "dt < min wait");

        // overflow is desired, casting never truncates
        unchecked {
            // cumulative price is in (uq112x112 price * seconds) units
            // so we simply wrap it after division by time elapsed
            price0Avg = FixedPoint.uq112x112(
                uint224((price0Cumulative - price0CumulativeLast) / dt)
            );
            price1Avg = FixedPoint.uq112x112(
                uint224((price1Cumulative - price1CumulativeLast) / dt)
            );
        }

        price0CumulativeLast = price0Cumulative;
        price1CumulativeLast = price1Cumulative;
        updatedAt = blockTimestamp;
    }

    function consult(address token, uint256 amountIn)
        external
        view
        returns (uint256 amountOut)
    {
        require(token == token0 || token == token1, "invalid token");

        if (token == token0) {
            // NOTE: decode144 decodes uq144x112 to uint144
            amountOut = FixedPoint.mul(price0Avg, amountIn).decode144();
        } else {
            amountOut = FixedPoint.mul(price1Avg, amountIn).decode144();
        }
    }
}
