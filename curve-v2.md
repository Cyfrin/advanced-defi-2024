### Curve v2

## How to use this

- Check [prerequisites](#prerequisites)
- Install [tools](#tools)
- Watch videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/curve-v2)
- Do exercises under [topics](#topics)
- Ask questions on [GitHub discussions](https://github.com/Cyfrin/advanced-defi-2024/discussions)

## Prerequisites

- Advanced Solidity developer
- Experience with Foundry
- Knowledge of Curve V1
- Basic understanding of DeFi
- Python (optional)

## Tools

- [Foundry](https://github.com/foundry-rs/foundry/tree/master)
- [Python / Jupyter lab](https://jupyter.org/) (optional)

## Topics

Check out the videos on [Cyfrin Updraft](https://updraft.cyfrin.io/courses/curve-v2) for each lesson.

### Section 1 - Intro

- Course intro
- What you'll learn
  - what won't be covered
    - advanced math
- Lead instructor
- Setup repo

  - How to execute Foundry exercises
  - Where are the Python code?
  - Where are the diagrams?

### Section 2 - Math

- Curve V2 intro
- AMM equation
- Graph [Curve V2](https://www.desmos.com/calculator/ms7fqtmpxu)
- Python code [concentrated liquidity](./notebook/amm_dy_dx.ipynb)
- Graph [Gamma](https://www.desmos.com/3d/3ebvcluqdr)
- Recap
- [Price scale](./excalidraw/amm/curve-v2/curve-v2-price-scale.png)
- [Price scale and concentrated liquidity](./excalidraw/amm/curve-v2/curve-v2-price-scale-amm-eq.pprice-scale.png)
- Python code (optional) [swap with price scale](./notebook/curve_v2_swap_price_scale.ipynb)
- [Price scale repeg](./excalidraw/amm/curve-v2/curve-v2-price-scale-repeg.png)
- Graph [AMM with price scale](https://www.desmos.com/calculator/v0ubb9g4oj)
- Graph [review of constant product liquidity](https://www.desmos.com/calculator/mg1evrmbdq)
- Graph [Quantifying pool value](https://www.desmos.com/calculator/weg6ff1pgk)
- Math pool value
- Graph [repegging loss part 1](https://www.desmos.com/calculator/weg6ff1pgk)
- Graph [repegging loss part 2](https://www.desmos.com/calculator/weg6ff1pgk)

### Section 3 - Contract overview

- [Contract overview](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- Code walkthrough packed state variables
- Code walkthrough price scale
- Code walkthrough `A`
- Code walkthrough `ramp_A_gamma`
- Code walkthrough `get_virtual_price`
- [Exercise transformed balances](./foundry/test/curve-v2/exercises/CurveV2PriceScale.test.sol)
- [Solution transformed balances](./foundry/test/curve-v2/solutions/CurveV2PriceScale.test.sol)

### Section 4 - Exchange

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `exchange`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `exchange`
- Code walkthrough `swap`
- Code walkthrough `_fee`
- Graph [dynamic fee](https://www.desmos.com/calculator/64npil5ieq)
- [Exercise 1 `get_dy`](./foundry/test/curve-v2/exercises/CurveV2Swap.test.sol)
- [Solution 1 `get_dy`](./foundry/test/curve-v2/solutions/CurveV2Swap.test.sol)
- [Exercise 2 `exchange`](./foundry/test/curve-v2/exercises/CurveV2Swap.test.sol)
- [Solution 2 `exchange`](./foundry/test/curve-v2/solutions/CurveV2Swap.test.sol)

### Section 5 - Add liquidity

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `add_liquidity`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `add_liquidity`
- Code walkthrough `add_liquidity`
- Code walkthrough `calc_token_fee`
- [Exercise `add_liquidity`](./foundry/test/curve-v2/exercises/CurveV2AddLiquidity.test.sol)
- [Solution `add_liquidity`](./foundry/test/curve-v2/solutions/CurveV2AddLiquidity.test.sol)

### Section 6 - Remove liquidity

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity`
- Code walkthrough `remove_liquidity`
- [Exercise 1 `remove_liquidity`](./foundry/test/curve-v2/exercises/CurveV2RemoveLiquidity.test.sol)
- [Solution 1 `remove_liquidity`](./foundry/test/curve-v2/solutions/CurveV2RemoveLiquidity.test.sol)
- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity_one_coin`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity_one_coin`
- Code walkthrough `remove_liquidity_one_coin`
- Code walkthrough `calc_withdraw_one_coin`
- [Exercise 2 `remove_liquidity_one_coin`](./foundry/test/curve-v2/exercises/CurveV2RemoveLiquidity.test.sol)
- [Solution 2 `remove_liquidity_one_coin`](./foundry/test/curve-v2/solutions/CurveV2RemoveLiquidity.test.sol)

### Section 7 - Price repeg

- Math EMA [regular interval](./excalidraw/amm/curve-v2/curve-v2-ema-regular-interval.png]
- Python [example regular interval](./notebook/curve_v2_ema.ipynb)
- Math EMA [irregular interval](./excalidraw/amm/curve-v2/curve-v2-ema-irregular-interval.png]
- Graph [half life](https://www.desmos.com/calculator/m5xmw1poez)
- Python [example irregular interval](./notebook/curve_v2_ema.ipynb)
- Difference between math and code
- Code walkthrough `price_oracle`
- When is `tweak_price` called
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `tweak_price`
- Code walkthrough `tweak_price`
- How does `xcp_profit` track profit and loss?
- When is `claim_admin_fees` called
- Code walkthrough `claim_admin_fees`

### Section 8 - Footnote

- [AMM spot price dy / dx](./notebook/amm_dy_dx.ipynb)

### Resources

- [Curve](https://curve.fi)
- [Curve resources](https://resources.curve.fi/)
- [Docs](https://docs.curve.fi/)
- [Whitepaper](https://resources.curve.fi/pdf/curve-cryptopools.pdf)
- [USDC/WBTC/ETH](https://etherscan.io/address/0x7f86bf177dd4f3494b841a37e810a34dd56c829b)
- [GitHub](https://github.com/curvefi/tricrypto-ng/blob/main/contracts/main/CurveTricryptoOptimizedWETH.vy)
- [Tricrypto optimization](https://github.com/curvefi/tricrypto-ng/blob/extended-readme/docs/tricrypto_optimisation.pdf)
- [Curve magic](https://hackmd.io/@alltold/curve-magic)
- [Understanding Crypto Pools](https://docs.kokonutswap.finance/understanding-crypto-pools)
- [Repegging of Curve v2 CryptoSwap|Curve|code review • 0xreviews.xyz](https://0xreviews.xyz/posts/2022-03-04-Curve-CryptoSwap-repegging)
- [Deep Dive: Curve v2 Parameters](https://nagaking.substack.com/p/deep-dive-curve-v2-parameters)
- [Imbalance fee](https://ethereum.stackexchange.com/questions/124850/curve-amm-how-is-fee-calculated-when-adding-liquidity)
- [Implicit function](https://en.wikipedia.org/wiki/Implicit_function)
- [Implicit differentiation](https://www.khanacademy.org/math/ap-calculus-ab/ab-differentiation-2-new/ab-3-2/v/implicit-differentiation-1)
- https://x.com/Kurt_M_Barry/status/1404496489703952384?s=20&t=5sGVQL4HbLrwzA_ALxivhA

## TODO

- links to code
- description of each section
