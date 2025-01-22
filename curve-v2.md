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

> This section explains what the course will teach, who the course is for and how to do the exercises

- Course intro
- Lead instructor
- Setup repo

### Section 2 - Math

> This section explains the math of Curve V2's AMM, how liquidity is concentrated and how the AMM decides to repeg the pool's liquidity at a different price.

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

> Here you will learn about what functions to call to interact with the AMM.
> You will also learn about how state variables such as `A`, `gamma` and `price_scale` are stored.

- [Contract overview](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [Code walkthrough packed state variables](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L796-L819)
- [Code walkthrough price scale](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L822-L854)
- [Code walkthrough `A`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1261-L1284)
- [Code walkthrough `ramp_A_gamma`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1961-L2008)
- [Code walkthrough `get_virtual_price`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1718-L1728)
- [Exercise transformed balances](./foundry/test/curve-v2/exercises/CurveV2PriceScale.test.sol)
- [Solution transformed balances](./foundry/test/curve-v2/solutions/CurveV2PriceScale.test.sol)

### Section 4 - Exchange

> This section explains how the function `exchange` works, how to call to swap tokens, followed by exercises to simulate a swap.

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `exchange`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `exchange`
- [Code walkthrough `exchange`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L860-L960)
- [Code walkthrough `_fee`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1287-L1295)
- Graph [dynamic fee](https://www.desmos.com/calculator/64npil5ieq)
- [Exercise 1 `get_dy`](./foundry/test/curve-v2/exercises/CurveV2Swap.test.sol)
- [Solution 1 `get_dy`](./foundry/test/curve-v2/solutions/CurveV2Swap.test.sol)
- [Exercise 2 `exchange`](./foundry/test/curve-v2/exercises/CurveV2Swap.test.sol)
- [Solution 2 `exchange`](./foundry/test/curve-v2/solutions/CurveV2Swap.test.sol)

### Section 5 - Add liquidity

> This section explains how the function `add_liquidity` is implemented, how to add liquidity, followed by a exercise.

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `add_liquidity`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `add_liquidity`
- [Code walkthrough `add_liquidity`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L511-L648)
- [Code walkthrough `calc_token_fee`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1314-L1336)
- [Exercise `add_liquidity`](./foundry/test/curve-v2/exercises/CurveV2AddLiquidity.test.sol)
- [Solution `add_liquidity`](./foundry/test/curve-v2/solutions/CurveV2AddLiquidity.test.sol)

### Section 6 - Remove liquidity

> There are 2 ways to remove liquidity (`remove_liquidity` and `remove_liquidity_one_coin`).
> This section will explain how both functions work, followed by exercises.

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity`
- [Code walkthrough `remove_liquidity`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L651-L722)
- [Exercise 1 `remove_liquidity`](./foundry/test/curve-v2/exercises/CurveV2RemoveLiquidity.test.sol)
- [Solution 1 `remove_liquidity`](./foundry/test/curve-v2/solutions/CurveV2RemoveLiquidity.test.sol)
- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity_one_coin`
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `remove_liquidity_one_coin`
- [Code walkthrough `remove_liquidity_one_coin`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L725-L781)
- [Code walkthrough `calc_withdraw_one_coin`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1339-L1410)
- [Exercise 2 `remove_liquidity_one_coin`](./foundry/test/curve-v2/exercises/CurveV2RemoveLiquidity.test.sol)
- [Solution 2 `remove_liquidity_one_coin`](./foundry/test/curve-v2/solutions/CurveV2RemoveLiquidity.test.sol)

### Section 7 - Price repeg

> Curve V2 has an internal price oracle that decides to re-concentrate liquidity when the internal price and the current price deviates significantly.
> This section explains the math of how the internal price oracle track prices the function that is responsible for repegging (`tweak_price`).

- Math EMA [regular interval](./excalidraw/amm/curve-v2/curve-v2-ema-regular-interval.png)
- Python [example regular interval](./notebook/curve_v2_ema.ipynb)
- Math EMA [irregular interval](./excalidraw/amm/curve-v2/curve-v2-ema-irregular-interval.png)
- Graph [half life](https://www.desmos.com/calculator/m5xmw1poez)
- Python [example irregular interval](./notebook/curve_v2_ema.ipynb)
- Difference between math and code
- [Code walkthrough `price_oracle`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1731-L1766)
- [When is `tweak_price` called](./excalidraw/amm/curve-v2/curve-v2-contract.excalidraw)
- [Code outline](./excalidraw/amm/curve-v2/curve-v2-contract.png) `tweak_price`
- [Code walkthrough `tweak_price`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L963-L1167)
- How does `xcp_profit` track profit and loss?
- [When is `claim_admin_fees` called](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [Code walkthrough `claim_admin_fees`](https://github.com/curvefi/tricrypto-ng/blob/584591e6613cb6cdb46e4659488a8cccdfff69ad/contracts/main/CurveTricryptoOptimizedWETH.vy#L1170-L1241)

### Section 8 - Footnote

> Footnote on how the spot price of AMM such as constant sum, constant product, Curve V1 and V2 can be calculated by a mathematical technique called implicit differentiation.

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
