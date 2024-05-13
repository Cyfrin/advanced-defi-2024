### Topics

✅

🤔

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
- [x] How does the AMM curve look like for multiple position?
- [x] How many dx and dy to add between price ranges pa and pb?
- [x] How many dx for dy when tokens are swapped in a single position?
- [ ] How to track swap fees for each liquidity provider?
- [ ] TODO: Add liquidity (tick spacing)

- [ ] [Uniswap v3](./topics/amm/uniswap-v3/README.md)
  - [x] Intro
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
      - [x] [Multi positions](https://www.desmos.com/calculator/fyvzeasktd)
      - [x] ETH/USDT liquiduity price graph example
  - [x] Repositories overview
  - [x] Contracts overview
  - [x] Spot price (sqrt price, tick, sqrt x 96)
    - [x] slot0 (tick and sqrtPriceX96)
      - [Code](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L56-L74)
      - [Etherscan WETH/USDT](https://etherscan.io/address/0x4e68Ccd3E89f51C3074ca5072bbAC773960dFa36#code)
    - [x] [Math - tick to price](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
    - [x] [Python code example](./notebook/uniswap_v3_spot_price.ipynb)
    - [x] [Math - sqrtPriceX96 to price](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
    - [x] [Python code example](./notebook/uniswap_v3_spot_price.ipynb)
    - [x] [Math - sqrtPriceX96 to tick](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
    - [x] [Python code example](./notebook/uniswap_v3_spot_price.ipynb)
    - [x] [Solidity exercise](./foundry/test/uniswap-v3/exercises/UniswapV3SpotPrice.test.sol)
    - [x] [Solidity solution](./foundry/test/uniswap-v3/solutions/UniswapV3SpotPrice.test.sol)
  - [x] [Equation for x and y from liquidity and price](./excalidraw/amm/uniswap-v3/uniswap-v3-xy-equations.png)
  - [x] [Curve of real reserves](./excalidraw/amm/uniswap-v3/uniswap-v3-curve-real-reserves.png)
  - [x] [How many token x and y between pa and pb?](./excalidraw/amm/uniswap-v3/uniswap-v3-xy-amounts.png)
  - [ ] Swap
    - [x] Swap algorithm
      - [x] [Single position](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-algo.png)
      - [x] Multi position
        - [x] Liquidity net intro
        - [x] [Liquidity net](./excalidraw/amm/uniswap-v3/uniswap-v3-liquidity-net.png)
        - [x] [Graph - liquidity net](https://www.desmos.com/calculator/mkoyc4wm9t)
    - [x] Swap math
      - [x] [What is the price after +/- dx or dy](./excalidraw/amm/uniswap-v3/uniswap-v3-delta-price.png)
      - [x] [Swap fee](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-fee.png)
    - [x] Code walk swap
    - [x] [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-contract-calls.png)
      - [x] Exact input single
      - [x] Exact input
      - [x] Exact output single
      - [x] Exact output
    - [x] Code walk SwapRouter02
      - [x] Exact input
      - [x] Exact output
    - [x] [Exercise 1 - single pool exact input](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
    - [x] [Solution 1 - single pool exact input](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
    - [x] [Exercise 2 - multi pool exact input](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
    - [x] [Solution 2 - multi pool exact input](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
    - [x] [Exercise 3 - single pool exact output](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
    - [x] [Solution 4 - single pool exact output](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
    - [x] [Exercise 4 - multi pool exact output](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
    - [x] [Solution 4 - multi pool exact output](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
  - [x] Factory
    - [x] [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-factory.png)
    - [x] Code walk
    - [x] [Exercise 1 - get pool](./foundry/test/uniswap-v3/exercises/UniswapV3Factory.test.sol)
    - [x] [Solution 1 - get pool](./foundry/test/uniswap-v3/solutions/UniswapV3Factory.test.sol)
    - [x] [Exercise 2 - create pool](./foundry/test/uniswap-v3/exercises/UniswapV3Factory.test.sol)
    - [x] [Solution 2 - create pool](./foundry/test/uniswap-v3/solutions/UniswapV3Factory.test.sol)
  - [ ] Liquidity
    - [ ] Math
      - [x] Liquidity
      - [x] Liquidity delta
      - [ ] How much fee to receive for providing liquidity?
    - [ ] [Tick spacing](https://www.desmos.com/calculator/nnyoez1bm0)
    - [ ] Contract call
      - [ ] UniswapV3Pool
        - [ ] mint
        - [ ] burn
        - [ ] collect
      - [ ] NonFungiblePositionManager
        - [ ] mint
        - [ ] increaseLiquidity
        - [ ] decreaseLiquidity
        - [ ] burn
    - [ ] Code walk (NFT manager, v3 pool) 🤔
    - [ ] Position manager
      - [ ] Mint
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] Increase liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] Decrease liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
      - [ ] Collect fee and remove liquidity
        - [ ] Exercise 1
        - [ ] Solution 1
  - [ ] Flash
    - [ ] Code walk 🤔
    - [ ] Exercise 1
    - [ ] Solution 1
  - [ ] Flash swap arbitrage 🤔
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
  - Footnotes
    - [ ] [Graph - Constant product AMM liquidity and price impact](https://www.desmos.com/calculator/vs8qodrrl6)

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
