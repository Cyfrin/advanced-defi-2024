# Uniswap V3

## How to use this

- Check [prerequisites](#prerequisites)
- Install [tools](#tools)
- Watch videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/uniswap-v3)
- Do exercises under [topics](#topics)
- Ask questions on [GitHub discussions](https://github.com/Cyfrin/advanced-defi-2024/discussions)

## Prerequisites

- Advanced Solidity
- Experience with Foundry
- [Uniswap V2](./uniswap-v2.md)

## Tools

- [Foundry](https://github.com/foundry-rs/foundry/tree/master)
- [Python / Jupyter lab](https://jupyter.org/) (optional)

## Topics

Check out the videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/uniswap-v3) for each lesson.

### Section 1 - Intro

> Introduction to Uniswap V3, how is it different from Uniswap V2 and what is concentrated liquidity?

- [Concentrated liquidity](./excalidraw/amm/uniswap-v3/uniswap-v3-intro.png)
- [Difference between v2 and v3](./excalidraw/amm/uniswap-v3/uniswap-v2-v3-diff.png)
- Graph - [concentrated liquidity](https://www.desmos.com/calculator/b2jllbh8xk)
- Graph - [tick](https://www.desmos.com/calculator/i0jaqanhen)
- Graph - [tick on constant product curve](https://www.desmos.com/calculator/3xpagfgcl2)
- Graph - [single position](https://www.desmos.com/calculator/afw6llbs8z)
- Graph - [multi positions](https://www.desmos.com/calculator/fyvzeasktd)
- [ETH/USDT](https://app.uniswap.org/explore/pools/ethereum/0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640) liquiduity price graph example
- Repositories overview
  - [Uniswap V3 core Solidity 0.8](https://github.com/Uniswap/v3-core/tree/0.8)
  - [Uniswap V3 periphery Solidity 0.8](https://github.com/Uniswap/v3-periphery/tree/0.8)
  - [Uniswap swap router contracts](https://github.com/Uniswap/swap-router-contracts)
- [Contracts overview](./excalidraw/amm/uniswap-v3/uniswap-v3-contracts.png)

### Section 2 - Spot price (sqrt price, tick, sqrt x 96)

> Math for spot price and values specific to how Uniswap V3 stores prices (`slot0`, `sqrtPriceX96` and `tick`).

- `slot0` (tick and sqrtPriceX96)
  - [Code](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L56-L74)
  - Etherscan [WETH/USDT](https://etherscan.io/address/0x4e68Ccd3E89f51C3074ca5072bbAC773960dFa36#code)
- Math - [tick to price](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
- Python - [code example](./notebook/uniswap_v3_spot_price.ipynb)
- Math - [sqrtPriceX96 to price](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
- Python - [code example](./notebook/uniswap_v3_spot_price.ipynb)
- Math - [sqrtPriceX96 to tick](./excalidraw/amm/uniswap-v3/uniswap-v3-price-tick.png)
- Python - [code example](./notebook/uniswap_v3_spot_price.ipynb)
- [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3SpotPrice.test.sol)
- [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3SpotPrice.test.sol)

### Section 3 - Math

> How to derive the equations for concentrated liquidity.

- Math - [equation for x and y from liquidity and price](./excalidraw/amm/uniswap-v3/uniswap-v3-xy-equations.png)
- Math - [curve of real reserves](./excalidraw/amm/uniswap-v3/uniswap-v3-curve-real-reserves.png)
- Math - [how many token x and y between pa and pb?](./excalidraw/amm/uniswap-v3/uniswap-v3-xy-amounts.png)

### Section 4 - Swap

> Swap algorithm, math, code and exercises swapping tokens with the router contract.

- Swap algorithm
  - [Single position](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-algo.png)
  - [Multi position](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-algo.png)
    - Liquidity net intro
    - Math - [liquidity net](./excalidraw/amm/uniswap-v3/uniswap-v3-liquidity-net.png)
    - Graph - [liquidity net](https://www.desmos.com/calculator/mkoyc4wm9t)
- Swap math
  - Math - [what is the price after +/- dx or dy](./excalidraw/amm/uniswap-v3/uniswap-v3-delta-price.png)
  - Math - [swap fee](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-fee.png)
- [Code walkthrough swap](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/UniswapV3Pool.sol#L605-L819)
- [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-swap-contract-calls.png)
  - Exact input single
  - Exact input
  - Exact output single
  - Exact output
- Code walkthrough `SwapRouter02`
  - [Exact input](https://github.com/Uniswap/swap-router-contracts/blob/70bc2e40dfca294c1cea9bf67a4036732ee54303/contracts/V3SwapRouter.sol#L132-L168)
  - [Exact output](https://github.com/Uniswap/swap-router-contracts/blob/70bc2e40dfca294c1cea9bf67a4036732ee54303/contracts/V3SwapRouter.sol#L226-L238)
- [Exercise 1 - single pool exact input](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
- [Solution 1 - single pool exact input](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
- [Exercise 2 - multi pool exact input](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
- [Solution 2 - multi pool exact input](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
- [Exercise 3 - single pool exact output](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
- [Solution 4 - single pool exact output](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)
- [Exercise 4 - multi pool exact output](./foundry/test/uniswap-v3/exercises/UniswapV3Swap.test.sol)
- [Solution 4 - multi pool exact output](./foundry/test/uniswap-v3/solutions/UniswapV3Swap.test.sol)

### Section 5 - Factory

> Contract architecture of the factory contract.

- [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-factory.png)
- [Code walkthrough](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Factory.sol#L35-L51)
- [Exercise 1 - get pool](./foundry/test/uniswap-v3/exercises/UniswapV3Factory.test.sol)
- [Solution 1 - get pool](./foundry/test/uniswap-v3/solutions/UniswapV3Factory.test.sol)
- [Exercise 2 - create pool](./foundry/test/uniswap-v3/exercises/UniswapV3Factory.test.sol)
- [Solution 2 - create pool](./foundry/test/uniswap-v3/solutions/UniswapV3Factory.test.sol)

## Section 6 - Liquidity

> Math of how liquidity is calculated followed by code and exercises.

- Math - [Liquidity](./excalidraw/amm/uniswap-v3/uniswap-v3-liquidity.png)
- Math - [Liquidity delta](./excalidraw/amm/uniswap-v3/uniswap-v3-liquidity-delta.png)
- Graph - [Tick spacing](https://www.desmos.com/calculator/x31s77joxw)
- Contract call
  - `UniswapV3Pool`
    - `mint`
      - [Call trace](./excalidraw/amm/uniswap-v3/uniswap-v3-pool-call-trace.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L457-L487)
    - `burn`
      - [Call trace](./excalidraw/amm/uniswap-v3/uniswap-v3-pool-call-trace.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L517-L543)
    - `collect`
      - [Call trace](./excalidraw/amm/uniswap-v3/uniswap-v3-pool-call-trace.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/UniswapV3Pool.sol#L490-L513)
  - `NonFungiblePositionManager`
    - `mint`
      - [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-position-manager.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-periphery/blob/697c2474757ea89fec12a4e6db16a574fe259610/contracts/NonfungiblePositionManager.sol#L128-L182)
    - `increaseLiquidity`
      - [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-position-manager.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-periphery/blob/697c2474757ea89fec12a4e6db16a574fe259610/contracts/NonfungiblePositionManager.sol#L198-L254)
    - `decreaseLiquidity`
      - [Contract call](./excalidraw/amm/uniswap-v3/uniswap-v3-position-manager.png)
      - [Code walkthrough](https://github.com/Uniswap/v3-periphery/blob/697c2474757ea89fec12a4e6db16a574fe259610/contracts/NonfungiblePositionManager.sol#L257-L306)
- Mint
  - [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Liquidity.test.sol)
  - [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Liquidity.test.sol)
- Increase liquidity
  - [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Liquidity.test.sol)
  - [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Liquidity.test.sol)
- Decrease liquidity
  - [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Liquidity.test.sol)
  - [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Liquidity.test.sol)
- Collect fee and remove liquidity
  - [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Liquidity.test.sol)
  - [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Liquidity.test.sol)

### Section 6 - Tick bitmap

> Algorithm for how the next liquidity position is efficiently searched.

- [Tick bitmap](./excalidraw/amm/uniswap-v3/uniswap-v3-tick-bitmap.png)
- [Next tick algorithm](./excalidraw/amm/uniswap-v3/uniswap-v3-next-tick.png)

### Section 7 - Fee algorithm

> How fee is tracked internally and calculated for all liquidity providers.

- Math - [Fee equation](./excalidraw/amm/uniswap-v3/uniswap-v3-calc-fee.png)
- [Fee growth](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-growth.png)
- Graph - [fee growth](https://www.desmos.com/calculator/eyyefktyjp)
- [Fee growth inside](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-growth-inside.png)
- Graph - [fee growth inside](https://www.desmos.com/calculator/3j7xdgxawz)
- [Fee growth outside](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-growth-outside.png)
- [Fee growth below](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-growth-below.png)
- [Fee growth above](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-growth-above.png)
- [Position fee](./excalidraw/amm/uniswap-v3/uniswap-v3-fee-position.png)
- Code walkthrough
  - [`Tick.update`](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/libraries/Tick.sol#L113-L153)
  - [`Tick.cross`](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/libraries/Tick.sol#L171-L192)
  - [`Tick.getFeeGrowthInside`](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/libraries/Tick.sol#L61-L98)
  - [`Position.update`](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/libraries/Position.sol#L45-L93)

### Section 8 - Flash

> How to get flash loans from Uniswap V3 pools

- [Code walkthrough](https://github.com/Uniswap/v3-core/blob/6562c52e8f75f0c10f9deaf44861847585fc8129/contracts/UniswapV3Pool.sol#L822-L867)
- [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Flash.sol)
- [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Flash.sol)

### Section 9 - TWAP price oracle

> How to calculate a time-weighted average pricing of tokens using Uniswap V3

- Math - [TWAP](./excalidraw/amm/uniswap-v3/uniswap-v3-twap.png)
- Math - [TWAP of token x and y](./excalidraw/amm/uniswap-v3/uniswap-v3-twap-x-y.png)
- Python - [simulation](./notebook/uniswap_v3_twap.ipynb)
- Code walkthrough
  - [`observe`](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/libraries/Oracle.sol#L300-L325)
  - [`transform`](https://github.com/Uniswap/v3-core/blob/d8b1c635c275d2a9450bd6a78f3fa2484fef73eb/contracts/libraries/Oracle.sol#L30-L45)
  - [`consult`](https://github.com/Uniswap/v3-periphery/blob/697c2474757ea89fec12a4e6db16a574fe259610/contracts/libraries/OracleLibrary.sol#L16-L41)
  - [`getQuoteAtTick`](https://github.com/Uniswap/v3-periphery/blob/697c2474757ea89fec12a4e6db16a574fe259610/contracts/libraries/OracleLibrary.sol#L49-L69)
- [Exercise 1](./foundry/test/uniswap-v3/exercises/UniswapV3Twap.sol)
- [Solution 1](./foundry/test/uniswap-v3/solutions/UniswapV3Twap.sol)

### Section 10 - Footnotes

- [JIT liquidity](./excalidraw/amm/uniswap-v3/uniswap-v3-jit.png)
- Graph - [constant product AMM liquidity and price impact](https://www.desmos.com/calculator/vs8qodrrl6)

### Resources

- [Uniswap](https://uniswap.org/)
- [Whitepaper](https://uniswap.org/whitepaper-v3.pdf)
- [App](https://app.uniswap.org/)
- [Uniswap V3 Core](https://github.com/Uniswap/v3-core/)
- [Uniswap V3 Core Solidity 0.8](https://github.com/Uniswap/v3-core/tree/0.8)
- [Uniswap V3 Periphery](https://github.com/Uniswap/v3-periphery/)
- [Uniswap V3 Periphery Solidity 0.8](https://github.com/Uniswap/v3-periphery/tree/0.8)
- [Uniswap V3 Swap Router](https://github.com/Uniswap/swap-router-contracts)
- [Uniswap V3 Docs](https://docs.uniswap.org/contracts/v3/overview)
- [Uniswap V3 Analytics](https://info.uniswap.org/)
- [A Primer on Uniswap v3 Math](https://blog.uniswap.org/uniswap-v3-math-primer)
- [Uniswap V3 book](https://uniswapv3book.com/)
