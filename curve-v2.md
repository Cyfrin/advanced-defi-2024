### Curve v2

-   [Curve v2 graph](https://www.desmos.com/calculator/ms7fqtmpxu)
-   [gamma graph](https://www.desmos.com/calculator/id0zrk0ucr)
-   [gamma graph 3D](https://www.desmos.com/3d/siehqqoi40)
-   [price vs reserve graph (python)](./notebook/amm_dy_dx.ipynb)

-   dynamic fee
-   ema
-   profit measurement
-   repricing algo

### TODOs

-   what is xcp

```
xp = [D / (p0 * N), D / (p1 * N), D / (p2 * N), ...]
xcp = geometric_mean(xp)
xcp = value of constant-product invariant at equilibrium
virtual_price = xcp / total_supply (TODO: why?)

```

-   why repping can cause loss for LP
    -   the loss can occur because it sells at the lower price and rebuys at the higher price
-   quantify potential loss / gain

### Resources

-   [Whitepaper](https://resources.curve.fi/pdf/curve-cryptopools.pdf)
-   [USDC/WBTC/ETH](https://etherscan.io/address/0x7f86bf177dd4f3494b841a37e810a34dd56c829b)
-   [GitHub](https://github.com/curvefi/tricrypto-ng/blob/acba2ee4fc933cc74df4365e4f357fa7e1582b99/contracts/main/CurveTricryptoOptimizedWETH.vy)
-   [Tricrypto optimization](https://github.com/curvefi/tricrypto-ng/blob/extended-readme/docs/tricrypto_optimisation.pdf)
-   [https://docs.kokonutswap.finance/understanding-crypto-pools](Understanding Crypto Pools)
-   https://x.com/0xstan_/status/1644931391111725057
