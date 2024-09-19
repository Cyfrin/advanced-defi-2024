# Uniswap V2

## How to use this

- Check [prerequisites](#prerequisites)
- Install [tools](#tools)
- Watch videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/uniswap-v2)
- Do exercises under [topics](#topics)
- Ask questions on [GitHub discussions](https://github.com/Cyfrin/advanced-defi-2024/discussions)

## Prerequisites

- Intermediate Solidity
- Experience with Foundry

## Tools

- [Foundry](https://github.com/foundry-rs/foundry/tree/master)

## Topics

Check out the videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/uniswap-v2) for each lesson.

### Section 1 - overview

- [Uniswap V2](./topics/amm/uniswap-v2/README.md)
- [Graph](https://www.desmos.com/calculator/z7z2donayo)
- [Contracts overview](./excalidraw/amm/uniswap-v2/uniswap_v2.png)

### Section 2 - Swap

- [Swap math](./excalidraw/amm/uniswap-v2/uniswap_v2_math.png)
- [Swap fee math](./excalidraw/amm/uniswap-v2/uniswap_v2_math.png)
- [Contract calls](./excalidraw/amm/uniswap-v2/uniswap_v2.png)
- Code walkthrough periphery and core repositories
- Code walkthrough `swapExactTokensForTokens`
  - `getAmountsOut`
  - [`getAmountsOut` fork](./foundry/test/uniswap-v2/UniswapV2SwapAmounts.test.sol)
  - `getAmountsOut` example
- Code walkthrough `swapTokensForExactTokens`
  - `getAmountsIn`
  - [`getAmountsIn` fork](./foundry/test/uniswap-v2/UniswapV2SwapAmounts.test.sol)
  - `getAmountsIn` example
- Code walkthrough `pair.swap`
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Swap.test.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Swap.test.sol)
- [Exercise 2](./foundry/test/uniswap-v2/exercises/UniswapV2Swap.test.sol)
- [Solution 2](./foundry/test/uniswap-v2/solutions/UniswapV2Swap.test.sol)
- [Spot price graph](https://www.desmos.com/calculator/z7z2donayo)
- [Spot price math](./excalidraw/amm/uniswap-v2/uniswap_v2.png)
- [Slippage](./excalidraw/amm/slippage.png)

### Section 3 - Create pool

- Code walkthrough `createPair`
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Factory.test.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Factory.test.sol)

### Section 4 - Add liquidity

- Pool shares intro
  - Pool shares mint math
  - Pool shares mint math example
  - Pool shares burn
  - Pool shares burn math
  - Pool shares burn math example
- Add liquidity graph
- Add liquidity math
- Add liquidity pool shares math intro
  - Liquidity functions
  - Liquidity functions - sqrt
  - Liquidity functions - 2x
  - Summary
- Contract calls diagram
- Code walkthrough
  - addLiquidity
  - mint
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Liquidity.test.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Liquidity.test.sol)

### Section 5 - Remove liquidity

- Remove liquidity graph
- Remove liquidity math
  - How many dx and dy to remove?
  - Pool shares intro
  - Liquidity functions
  - Liquidity delta with liquidity function = sqrt
- Contract calls diagram
- Code walkthrough
  - removeLiquidity
  - burn
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Liquidity.test.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Liquidity.test.sol)

### Section 6 - Flash swap

- Flash swap fee math
- Contract calls diagram
- Code walkthrough
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2FlashSwap.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2FlashSwap.sol)

### Section 7 - TWAP

- Spot price manipulation
- TWAP math
  - Intro
  - Cumulative price
  - Example
  - TWAP approximation to current time
  - Misconception
- Code walkthrough
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Twap.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Twap.sol)

### Section 8 - Application - Flash swap arbitrage

- Intro
  - arbitrage, flash swap -> swap -> swap)
  - flash swap -> swap
- [Exercise 1](./foundry/test/uniswap-v2/exercises/UniswapV2Arb1.sol)
- [Solution 1](./foundry/test/uniswap-v2/solutions/UniswapV2Arb1.sol)
- [Exercise 2](./foundry/test/uniswap-v2/exercises/UniswapV2Arb2.sol)
- [Solution 2](./foundry/test/uniswap-v2/solutions/UniswapV2Arb2.sol)
- Optimal amount in math (optional)

### Resources

[Uniswap](https://uniswap.org/)

[Uniswap V2 Core](https://github.com/Uniswap/v2-core/)

[Uniswap V2 Periphery](https://github.com/Uniswap/v2-periphery/)

[Uniswap V2 Docs](https://docs.uniswap.org/contracts/v2/overview)

[Uniswap V2 Analytics](https://v2.info.uniswap.org/home)

[What is slippage?](https://support.uniswap.org/hc/en-us/articles/8643879653261-What-is-Price-Slippage)
