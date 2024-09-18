# Uniswap V2

### Section 1 - overview

- [Uniswap V2](./topics/amm/uniswap-v2/README.md)
- Math overview, graph and examples
- Contracts overview

### Section 2 - Swap

- Swap math
- Swap fee math
- Contract calls diagram
- Code walkthrough
  - Periphery and core repositories
  - swapExactTokensForTokens
    - getAmountsOut
    - getAmountsOut fork
    - getAmountsOut example
  - swapTokensForExactTokens
    - getAmountsIn
    - getAmountsIn fork
    - getAmountsIn example
  - pair.swap
- Code exercise 1
- Code solution 1
- Code exercise 2
- Code solution 2
- Spot price graph
- Spot price math
- Slippage

### Section 3 - Create pool

- Code walkthrough
- Code exercise
- Code solution

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
- Code exercise
- Code solution

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
- Code exercise
- Code solution

### Section 6 - Flash swap

- Flash swap fee math
- Contract calls diagram
- Code walkthrough
- Code exercise
- Code solution

### Section 7 - TWAP

- Spot price manipulation
- TWAP math
  - Intro
  - Cumulative price
  - Example
  - TWAP approximation to current time
  - Misconception
- Code walkthrough
- Code exercise
- Code solution

### Section 8 - Application - Flash swap arbitrage

- Intro
  - arbitrage, flash swap -> swap -> swap)
  - flash swap -> swap
- Exercise 1
- Solution 1
- Exercise 2
- Solution 2
- Optimal amount in math (optional)
