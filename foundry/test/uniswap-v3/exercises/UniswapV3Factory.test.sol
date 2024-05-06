// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {Test, console2} from "forge-std/Test.sol";
import {IUniswapV3Factory} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Factory.sol";
import {IUniswapV3Pool} from
    "../../../src/interfaces/uniswap-v3/IUniswapV3Pool.sol";
import {
    UNISWAP_V3_FACTORY,
    DAI,
    USDC,
    UNISWAP_V3_POOL_DAI_USDC_100
} from "../../../src/Constants.sol";
import {ERC20} from "../../../src/ERC20.sol";

contract UniswapV3FactoryTest is Test {
    IUniswapV3Factory private factory = IUniswapV3Factory(UNISWAP_V3_FACTORY);
    // 3000 = 0.3%
    //  100 = 0.01%
    uint24 private constant POOL_FEE = 100;
    ERC20 private tokenA;
    ERC20 private tokenB;

    function setUp() public {
        tokenA = new ERC20("A", "A", 18);
        tokenB = new ERC20("B", "B", 18);
    }

    // Exercise 1 - Get the address of DAI/USDC (0.1% fee) pool
    function test_getPool() public {
        // Write your code here
        address pool;
        assertEq(pool, UNISWAP_V3_POOL_DAI_USDC_100);
    }

    // Exercise 2 - Deploy a new pool with tokenA and tokenB, 0.1% fee
    function test_createPool() public {
        // Write your code here
        address pool;

        (address token0, address token1) = address(tokenA) <= address(tokenB)
            ? (address(tokenA), address(tokenB))
            : (address(tokenB), address(tokenA));

        assertEq(IUniswapV3Pool(pool).token0(), token0);
        assertEq(IUniswapV3Pool(pool).token1(), token1);
        assertEq(IUniswapV3Pool(pool).fee(), POOL_FEE);
    }
}
