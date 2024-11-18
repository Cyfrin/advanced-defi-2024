### Curve v2

- not covered - advance math

# Section 1 - Intro

- course intro
- what you'll learn
  - what won't be covered
    - advanced math (`get_y`)
- lead instructor
- best practices
- setup repo
- how to execute exercises

- prerequisites
  - Basic DeFi knowledge (DAI, WETH, WBTC, etc)
  - Advanced Solidity developer
  - curve v1 (CPAMM, CSAMM)
  - uni v3 (concentrated liq)?
  - Foundry
  - Python (optional)

# Section 2 - Math

- Curve V2 intro
- Equation
- Graph - [Curve V2](https://www.desmos.com/calculator/ms7fqtmpxu)
- Python code - [concentrated liquidity](./notebook/amm_dy_dx.ipynb)
- Graph - [Gamma](https://www.desmos.com/3d/3ebvcluqdr)
- Recap
- [Price scale](./excalidraw/amm/curve-v2/curve-v2-price-scale.png)
- [Price scale and concentrated liquidity](./excalidraw/amm/curve-v2/curve-v2-price-scale-amm-eq.pprice-scale.png)
- Python code (optional) - [swap with price scale](./notebook/curve_v2_swap_price_scale.ipynb)
- [Repegging with price scale](./excalidraw/amm/curve-v2/curve-v2-price-scale-repeg.png)
- Graph - [AMM with price scale](https://www.desmos.com/calculator/v0ubb9g4oj)
- Graph - [review of constant product liquidity](https://www.desmos.com/calculator/mg1evrmbdq)
- Graph - [Quantifying pool value](https://www.desmos.com/calculator/weg6ff1pgk)
- Math - Pool value
- Graph - [repegging loss part 1](https://www.desmos.com/calculator/weg6ff1pgk)
- Graph - [repegging loss part 2](https://www.desmos.com/calculator/weg6ff1pgk)

# Section 3 - Contract overview

- contract overview
- packed state variables, `_pack` and `_unpack`
- price scale
- transformed balances exercise
- A and gamma
  - `ramp_A_gamma` and `stop_ramp_A_gamma`
- `get_virtual_price`

# Section ? - Swap

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [Trace](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- Code walkthrough - `swap`
- Code walkthrough - `_fee`
- Graph - [dynamic fee](https://www.desmos.com/calculator/64npil5ieq)
- [ ] exercise

# Section ? - Add liquidity

- [Contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [Trace](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- imbalance fee?
- code walkthrough
  - add_liquidity
  - calc_token_fee
- [ ] exercise

# Section ? - Remove liquidity

- remove_liquidity
- [contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [trace](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- code walkthrough
  - remove_liquidity
- [ ] exercise
- [contract call](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- [trace](./excalidraw/amm/curve-v2/curve-v2-contract.png)
- imbalance fee?
- code walkthrough
  - remove_liquidity_one_coin
  - TODO: ? calc_withdraw_one_coin?
- [ ] exercise

# Section ? - Price repegging

- EMA
  - math
    - [regular interval](./excalidraw/amm/curve-v2/curve-v2-ema-regular-interval.png]
  - [python code example - regular interval](./notebook/curve_v2_ema.ipynb)
  - math
    - [irregular interval](./excalidraw/amm/curve-v2/curve-v2-ema-irregular-interval.png]
    - graph [half life](https://www.desmos.com/calculator/m5xmw1poez)
  - [python code example - irregular interval](./notebook/curve_v2_ema.ipynb)
  - Word about math and code (alpha = 1 - a)
  - `price_oracle` code walkthrough
- tweak_price
  - when tweak_price is called
  - code outline
  - code walkthrough
  - [x] how does `xcp_profit` track profit / loss?
- [ ] claim_admin_fees
  - when claim_admin_fees is called
  - code walkthrough
    - `xcp_profit` and `xcp_profit_a`

# Section ? - Footnote

- [ ] TODO: dy / dx

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
- https://x.com/Kurt_M_Barry/status/1404496489703952384?s=20&t=5sGVQL4HbLrwzA_ALxivhA
