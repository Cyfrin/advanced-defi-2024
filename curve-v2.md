### Curve v2

- `b' = b * p`
- D
- virtual price
- xcp
- repricing algo
  - repeggins loss
  - quantifying profit loss
- ema
- dynamic fee

- Intro (ui video)
  - volatile tokens
  - single sided liquidity
  - concentrated liquidity that algorithmically repegs to EMA?
  - dynamic fees
  - newton's method and optimizations
- Math
  - [Price scale](./excalidraw/amm/curve-v2/curve-v2-price-scale.png)
  - Equation (animation)
  - [Curve v2 graph](https://www.desmos.com/calculator/ms7fqtmpxu)
  - [Concentrated liquidity - Python code](./notebook/amm_dy_dx.ipynb)
  - [Gamma]
    - [Gamma graph](https://www.desmos.com/calculator/id0zrk0ucr)
    - [Gamma graph 3D](https://www.desmos.com/3d/siehqqoi40)
  - Quantification of profit (TODO)
    - why repping can cause loss for LP
      - the loss can occur because it sells at the lower price and rebuys at the higher price
    - [Graph constant product liquidity](https://www.desmos.com/calculator/mg1evrmbdq)
    - [Graph repegging loss](https://www.desmos.com/calculator/km1yqb12ik)
    - TODO: math (x'y' -> xp -> xcp)

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

- Code walkthrough
  - xp
  - get_xcp
  - get_virtual_price
  - exchange
    - get_y? (Avdanced math)
  - add_liquidity
  - remove_liquidity
  - remove_liquidity_one_coin
    - calc_withdraw_one_coin
  - price_oracle
    - math
    - [python code](./notebook/curve_v2_ema.ipynb)
    - code walkthroug
  - tweak_price
    - xcp_profit
    - how to compare xcp_profit and virtual price? (TODO)
  - claim_admin_fee?
  - dynamic fee?
  - get_dy?
- Exercises
  - Swap
    - get dy
    - exchange
  - Add liquidity
  - Remove liquidity
  - Remove liquidity one coin

- Footnote
  - dy / dx


### TODOs


### Memo

```
concentrated liquidity -> price is mean reverting -> LP profit
                       -> amplifies IL -> price doesn't revert -> AMM repegs -> LP loss

profit if price reverts to EMA
loss if AMM must repeg
```

- xcp -> 0 imbalanced?, max at equilibrium?


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
