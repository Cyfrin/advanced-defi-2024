# advanced-defi-2024

## Install

```shell
# Install foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

## Exercises and solutions

```shell
cd foundry
forge build
```

## Topics

TODO: links

- [ ] Syllabus
- [ ] AMM
  - [x] Intro
    - [x] 1. [What is an AMM?](./topics/amm/intro/what_is_amm.md)
    - [x] 2. [AMM vs orderbook](./topics/amm/intro/amm_order_book.md)
    - [x] 3. [Different AMM equations](./topics/amm/intro/amm_equations.md)
  - [x] [Uniswap V2](./topics/amm/uniswap-v2/README.md)
    - [x] 1. Math overview, graph and examples
    - [x] 2 Contracts overview
    - [x] Swap
      - [x] 3. Swap math
      - [x] 4. Swap fee math
      - [x] 5. Contract calls diagram
      - [x] Code walkthrough
        - [x] 6. Periphery and core repositories
        - [x] 7. swapExactTokensForTokens
          - [x] 8. getAmountsOut
          - [x] 9. getAmountsOut fork
          - [x] 10. getAmountsOut example
        - [x] 11. swapTokensForExactTokens
          - [x] 12. getAmountsIn
          - [x] 13. getAmountsIn fork
          - [x] 14. getAmountsIn example
        - [x] 15. pair.swap
      - [x] 16. Code exercise 1
      - [x] 17. Code solution 1
      - [x] 18. Code exercise 2
      - [x] 10. Code solution 2
      - [x] 20. Spot price graph
      - [x] 21. Spot price math
      - [x] 22. Slippage
    - [x] Create pool
      - [x] 23. Code walkthrough
      - [x] 24. Code exercise
      - [x] 25. Code solution
    - [x] Add liquidity
      - [x] 26. Pool shares intro
        - [x] 27. Pool shares mint math
        - [x] 28. Pool shares mint math example
        - [x] 29. Pool shares burn
        - [x] 30. Pool shares burn math
        - [x] 31. Pool shares burn math example
      - [x] 32. Add liquidity graph
      - [x] 33. Add liquidity math
      - [x] 34. Add liquidity pool shares math intro
        - [x] 35. Liquidity functions
        - [x] 36. Liquidity functions - sqrt
        - [x] 37. Liquidity functions - 2x
        - [x] 38. Summary
      - [x] 39. Contract calls diagram
      - [x] Code walkthrough
        - [x] 40. addLiquidity
        - [x] 41. mint
      - [x] 42. Code exercise
      - [x] 43. Code solution
    - [x] Remove liquidity
      - [x] 44. Remove liquidity graph
      - [x] Remove liquidity math
        - [x] 45. How many dx and dy to remove?
        - [x] 46. Pool shares intro
        - [x] 47. Liquidity functions
        - [x] 48. Liquidity delta with liquidity function = sqrt
      - [x] 49. Contract calls diagram
      - [x] Code walkthrough
        - [x] 50. removeLiquidity
        - [x] 51. burn
      - [x] 52. Code exercise
      - [x] 53. Code solution
    - [x] Flash swap
      - [x] 54. Flash swap fee math
      - [x] 55. Contract calls diagram
      - [x] 56. Code walkthrough
      - [x] 57. Code exercise
      - [x] 58. Code solution
    - [x] TWAP
      - [x] 59. Spot price manipulation
      - [x] TWAP math
        - [x] 60. Intro
        - [x] 61. Cumulative price
        - [x] 62. Example
        - [x] 63. TWAP approximation to current time
        - [x] 64. Misconception
      - [x] 65. Code walkthrough
      - [x] 66. Code exercise
      - [x] 67. Code solution
    - [x] Application - Flash swap arbitrage
      - [x] Intro
        - [x] 68. arbitrage, flash swap -> swap -> swap)
        - [x] 69. flash swap -> swap
      - [x] 70. Exercise 1
      - [x] 71. Solution 1
      - [x] 72. Exercise 2
      - [x] 73. Solution 2
      - [x] 74. Optimal amount in math (optional)
  - [ ] Uniswap v3
  - [ ] Curve v1
  - [ ] Curve v2
- [ ] MEV
- [ ] Price oracle - Chainlink
- [ ] Stablecoin - DAI
- [ ] Lending - AAVE v3

## Resources

- https://updraft.cyfrin.io/
- https://defillama.com/
- https://www.youtube.com/@blockchain-web3moocs635/playlists

[Whitepapers](./whitepapers)
