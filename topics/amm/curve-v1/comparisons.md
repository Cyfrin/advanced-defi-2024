# Comparison of Curve v1, Uniswap v2 and v3 (swapping USDC / DAI)

|               | Uniswap v2  | Uniswap v3                    | Curve v1         |
| ------------- | ----------- | ----------------------------- | ---------------- |
| Language      | Solidity    | Solidity                      | Vyper            |
| Slippage      | High        | Low                           | Low              |
| Pool          | 2 tokens    | 2 tokens                      | 2 or more        |
| Liquidity     | Both tokens | Depends on position and price | 1 to all         |
| Liquidity fee | None        | None                          | Fee on imbalance |
| Swap fee      | Token in    | Token in                      | Token out        |
