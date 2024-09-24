### Curve v2

- not covered - advance math

### TODOs

- readme
- how state variables `D`, `virtual_price` and `xcp_profit` update
- when does virtual price increase? decrease?
- when does xcp_profit change?
- show how A and gamma changes D?
- how to calculate last price? `get_p`

```
concentrated liquidity -> price is mean reverting -> LP profit
                       -> amplifies IL -> price doesn't revert -> AMM repegs -> LP loss

profit if price reverts to EMA
loss if AMM must repeg
```

- xcp -> 0 imbalanced?, max at equilibrium?

# Section 1 - Intro

- course intro
- what you'll learn
- lead instructor
- best practices
- setup repo
- how to execute exercises

- prerequisites
  - Basic DeFi knowledge (DAI, WETH, WBTC, etc)
  - curve v1 (CPAMM, CSAMM)
  - Foundry
  - Python (optional)

# Section 2 - Math

- Curve V2 intro
- Equation
- Graph - [Curve V2](https://www.desmos.com/calculator/ms7fqtmpxu)
- Python code - [concentrated liquidity](./notebook/amm_dy_dx.ipynb)
- Graph - gamma (answer how gamma controls concentrated liquidity)
  - [Gamma graph](https://www.desmos.com/calculator/c1yc2loglv)
  - [Gamma graph 3D](https://www.desmos.com/3d/siehqqoi40)
- [Price scale](./excalidraw/amm/curve-v2/curve-v2-price-scale.png)
- Quantification of profit (TODO)

- why repping can cause loss for LP
  - the loss can occur because it sells at the lower price and rebuys at the higher price
    - [Graph constant product liquidity](https://www.desmos.com/calculator/mg1evrmbdq)
    - [Graph repegging loss](https://www.desmos.com/calculator/km1yqb12ik)
- TODO?: math (x'y' -> xp -> xcp)

```
# v1 (for 2 tokens)
xy / (D / 2)**2 -> max = 1 at balanced -> xy max at x = y = D / 2
                -> 0 when imbalanced

# v2 (for 2 tokens)
x' = p0 * x = D / 2 when balanced -> x = D / (2 * p0)
y' = p1 * y = D / 2 when balanced -> y = D / (2 * p1)

x'y' / (D / 2)**2 -> max = 1 at balanced -> x'y' mat at x' = y' = D / 2
                  -> 0 when imbalanced

xp = [D / (p0 * N), D / (p1 * N), D / (p2 * N), ...]
xcp = geometric_mean(xp)

xcp -> max when x, y at pegged price
    -> otherwise loss

xcp = value of constant-product invariant at equilibrium
virtual_price = xcp / total_supply (TODO: why?)
```

# Section 3 - Contract overview

- contract overview
- packed state variables
- A and gamma
  - `ramp_A_gamma` and `stop_ramp_A_gamma`
- xp, xcp, virtual price, D?
- xcp exercise?
- get_virtual_price exercise?

# Section ? - Swap

- contract call
- trace
- dynamic fee
- get_dy
- code walkthrough
- exercise

# Section ? - Add liquidity

# Section ? - Remove liquidity

- remove_liquidity
- remove_liquidity_one_coin
- calc_withdraw_one_coin?

# Section ? - Price repegging

- EMA
  - math
  - python code example
  - code walkthrough
- tweak_price
  - trace
  - `xcp_profit`
  - code walkthrough
- claim_admin_fees
  - trace
  - `xcp_profit` and `xcp_profit_a`
  - code walkthrough
- EMA exercises?

# Section ? - Footnote

- dy / dx

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
