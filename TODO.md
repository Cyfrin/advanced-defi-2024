### Topics

✅

🤔

TODO: split concepts and math - math is optional

#### Concepts and terminologies

- [x] concentrated liquidity
- [x] real and virtual reserves
- [x] position
- [x] tick
- [x] sqrt price x 96
- [x] liquidity price graph
- [x] slot0
- [ ] fee growth

- [x] How to get the spot price?
- [ ] How does the AMM curve look like for multiple position?
- [ ] How many dx and dy to add between price ranges pa and pb?
- [ ] How many dx for dy when tokens are swapped in a single position?
- [ ] How to track swap fees for each liquidity provider?

TODO: embed link to resources

- [ ] Uniswap v3
  - [ ] Intro
    - [x] [Concentrated liquidity](./excalidraw/amm/uniswap-v3/uniswap-v3-intro.png)
      - [x] Example - DAI/USDC
      - [x] Virtual reserve and real reserve (concept)
      - [x] Concentrated liquidity (concept)
    - [x] [Difference between v2 and v3](./excalidraw/amm/uniswap-v3/uniswap-v2-v3-diff.png)
    - [x] Graph
      - [x] [Concentrated liquidity](https://www.desmos.com/calculator/b2jllbh8xk)
      - [x] [Tick](https://www.desmos.com/calculator/i0jaqanhen)
      - [x] [Tick on constant product curve](https://www.desmos.com/calculator/3xpagfgcl2)
      - [x] [Single position](https://www.desmos.com/calculator/afw6llbs8z)
      - [x] [Multi positions](https://www.desmos.com/calculator/cunvngnzqx)
      - [x] ETH/USDT liquiduity price graph example
  - [ ] Spot price (sqrt price, tick, sqrt x 96)
    - [ ] slot0 (tick and sqrtPriceX96)
      - [Code](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L56-L74)
      - [Etherscan WETH/USDT](https://etherscan.io/address/0x4e68Ccd3E89f51C3074ca5072bbAC773960dFa36#code)
    - [ ] Math - tick to price
    - [ ] [Python code example](./notebook/uniswap_v3_spot_price.ipynb)
    - [ ] Math - sprtPriceX96 to price
    - [ ] [Python code example](./notebook/uniswap_v3_spot_price.ipynb)
    - [ ] [Solidity exercise](./foundry/tests/uniswap-v3/exercises/UniswapV3SpotPrice.test.sol)
    - [ ] [Solidity solution](./foundry/tests/uniswap-v3/solutions/UniswapV3SpotPrice.test.sol)
  - [ ] Real and virtual reserves 🤔
  - [ ] tick spacing 🤔
  - [ ] Math
    - [ ] X and Y in terms of L and P
    - [ ] Curve of real reserves
    - [ ] Real reserve amounts
  - [ ] Contracts overview
  - [ ] Swap
    - [ ] Swap math
      - [ ] How much token out for a swap?,
      - [ ] How much token in for a swap?,
      - [ ] How much token x and y in a position?
    - [ ] Swap algorithm?
    - [ ] Contract call
    - [ ] Code walk 🤔
    - [ ] Exercise 1 - single pool input
    - [ ] Solution 1 - single pool input
    - [ ] Exercise 2 - single pool output
    - [ ] Solution 2 - single pool output
    - [ ] Exercise 3 - multi pool input
    - [ ] Solution 3 - multi pool input
    - [ ] Exercise 4 - multi pool output
    - [ ] Solution 4 - multi pool output
  - [ ] Factory
    - [ ] Code walk 🤔
    - [ ] Exercise 1
    - [ ] Solution 1
  - [ ] Liquidity
    - [ ] Liquidity math
      - [ ] How much tokens to add liquidity?
      - [ ] How much token to receive from remove liquidity?
    - [ ] Contract call
    - [ ] Code walk 🤔
    - [ ] Position manager
      - [ ] pool address, key, id
      - [ ] Mint
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] increase liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] decrease liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] Collect fee and remove liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
        - [ ] Exercise 2
        - [ ] Solution 2
      - [ ] Burn
        - [ ] Exercise 1
        - [ ] Solution 1
  - [ ] Flash
    - [ ] Code walk 🤔
    - [ ] Exercise 1
    - [ ] Solution 1
  - [ ] Flash swap arbitrage
    - [ ] Contract call
    - [ ] Exercise 1
    - [ ] Solution 1
  - [ ] TWAP Price oracle
    - [ ] TWAP math
    - [ ] Code walk 🤔
    - [ ] Exercise 1
    - [ ] Solution 1
  - [ ] Tick bitmap algorithm
  - [ ] Fee algorithm
  - [ ] TODO: Final project 🤔
  - [ ] JIT liquidity 🤔
  - [ ] panoptics 🤔

### uni v3 resource

- https://github.com/Sabnock01/uniswap-resources
- https://uniswapv3book.com/

### TODOs

- [ ] Curve v1
  - [ ] Math
  - [ ] Swap
  - [ ] Add / remove liquidity
  - [ ] TWAP🤔
- [ ] Curve v2🤔
  - [ ] Math
- [ ] dy / dx = dfdx / dfdy 🤔
- [ ] Summary
- [ ] MEV
  - [ ] Front run, back run and sandwich examples
  - [ ] Flashbots RPC example
  - [ ] MEV sandwicsh uni v2 🤔
  - [ ] Summary
- [ ] Price oracle ✅
  - [ ] Chainlink
- [ ] Stablecoin ✅
  - [ ] DAI
    - [ ] Overview
    - [ ] CDP and vaults
    - [ ] Math (wad, ray, rad)
    - [ ] Debt math
    - [ ] Contract overview
    - [ ] Add collateral
    - [ ] Borrow
    - [ ] Repay
    - [ ] Liquidation, math and auction
    - [ ] Debt auction
    - [ ] Surplus auction
    - [ ] DSR (math)
    - [ ] PSM
    - [ ] Flash
    - [ ] Flash mint DAI -> Sell DAI for USDC on Uniswap -> Sell USDC to PSM -> Repay flash loan
    - [ ] What can we do with DAI and Maker protocol?🤔
    - [ ] Leverage🤔
    - [ ] Summary
- [ ] Lending
  - [ ] AAVE 🚧
    - [ ] supply
    - [ ] borrow
    - [ ] repay
    - [ ] withdraw
    - [ ] flash loan
    - [ ] liquidation
    - [ ] GHO 🤔
    - [ ] portal 🤔
    - [ ] stake AAVE 🤔
    - [ ] govenance 🤔
    - [ ] apps -> flash loan, farm gov tokens, leverage, short 🤔
  - [ ] Compound 🤔
  - [ ] Flash loan
  - [ ] Rebase tokens
  - [ ] Summary
- [ ] Liquid staking 🚧
  - [ ]Lido
  - [ ]Rocket pool 🤔

## TODOs

- [ ] Compound
- [ ] TWAMM
- [ ] AAVE GHO
- [ ] Curve stablecoin
- [ ] Curve VE gauge🤔 (liquidity -> better price for users -> more trade -> more fee -> more liquidity)?
- [ ] RAI
- [ ] Dex aggregator (CowSwap, ParaSwap)

- How to cover theses topics?
  - Algorithms used in DeFi
    - AMM
    - Vault
    - Staking rewards (discrete and time based)
    - DAI interest rate
    - Dutch auction
    - English and Dutch auction
- DEX agg - cow swap, paraswap?

#### Aave

- [Aave](https://aave.com/)
- [Aave Unleashed](https://calnix.gitbook.io/aave-unleashed/)

- [Curve](https://resources.curve.fi/)

- [Aave V3 Made Crystal Clear](https://www.youtube.com/watch?v=UzuZp3Q3xg0)
