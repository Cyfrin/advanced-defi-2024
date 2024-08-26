### Curve v2

- `b' = b * p`
- D
- virtual price
- dynamic fee
- ema
- profit measurement
- repricing algo

- [Curve v2 graph](https://www.desmos.com/calculator/ms7fqtmpxu)
- [gamma graph](https://www.desmos.com/calculator/id0zrk0ucr)
- [gamma graph 3D](https://www.desmos.com/3d/siehqqoi40)
- [Graph repegging loss](https://www.desmos.com/calculator/km1yqb12ik)
- [price vs reserve graph (python)](./notebook/amm_dy_dx.ipynb)

### TODOs


### Memo

```
concentrated liquidity -> price is mean reverting -> LP profit
                       -> amplifies IL -> price doesn't revert -> AMM repegs -> LP loss

profit if price reverts to EMA
loss if AMM must repeg
```

- xcp -> 0 imbalanced?, max at equilibrium?

```
# v1
xy / (D / 2)**2 -> max = 1 at balanced
                -> 0 when imbalanced

x = y = D / 2 when balanced

# v2
x' = p0 * x = D / 2 when balanced -> x = D / (2 * p0)
y' = p1 * y = D / 2 when balanced -> y = D / (2 * p1)

x'y' / (D / 2)**2 -> max = 1 at balanced <- x' = y' = D / 2 <- x = D / (2 * p0) and y = D / (2 * p1)
                  -> 0 when imbalanced

xcp -> max when x, y at pegged price
    -> otherwise less loss
```


```
xp = [D / (p0 * N), D / (p1 * N), D / (p2 * N), ...]
xcp = geometric_mean(xp)
xcp = value of constant-product invariant at equilibrium
virtual_price = xcp / total_supply (TODO: why?)

```

- why repping can cause loss for LP
  - the loss can occur because it sells at the lower price and rebuys at the higher price

### Resources

- [Curve](https://curve.fi)
- [Curve resources](https://resources.curve.fi/)
- [Docs](https://docs.curve.fi/)
- [Whitepaper](https://resources.curve.fi/pdf/curve-cryptopools.pdf)
- [USDC/WBTC/ETH](https://etherscan.io/address/0x7f86bf177dd4f3494b841a37e810a34dd56c829b)
- [GitHub](https://github.com/curvefi/tricrypto-ng/blob/acba2ee4fc933cc74df4365e4f357fa7e1582b99/contracts/main/CurveTricryptoOptimizedWETH.vy)
- [Tricrypto optimization](https://github.com/curvefi/tricrypto-ng/blob/extended-readme/docs/tricrypto_optimisation.pdf)
- [Curve magic](https://hackmd.io/@alltold/curve-magic)
- [https://docs.kokonutswap.finance/understanding-crypto-pools](Understanding Crypto Pools)
- [Repegging of Curve v2 CryptoSwap|Curve|code review • 0xreviews.xyz](https://0xreviews.xyz/posts/2022-03-04-Curve-CryptoSwap-repegging)
- https://x.com/0xstan_/status/1644931391111725057
