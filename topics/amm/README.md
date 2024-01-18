# AMM - Automated market maker

[What is an AMM?](./what_is_amm.md)

### AMM vs orderbook

#### Orderbook

- Buyer
  - Deposit money
  - Bid - submit buy order
  - Update order
  - Cancel order
- Seller
  - Deposit token
  - Ask - submit sell order
  - Update order
  - Cancel order
- Orderbook
  - Sort orders by price
  - Match and execute orders

Cons

- Use high amounts of gas 🔥
- Low trading volume 🔈

#### AMM

- Liquidity provider
  - Deposit tokens
- Trader
  - Swap tokens with the AMM
- AMM
  - Execute trades
  - Algorithmicly calculate the price
  - Give swap fees to liquidity providers

Pros

- Gas efficient ✅
- High trading volume 🔊

Cons

- Liquidity providers usually operate at a loss 💸

### Different AMMs

- Constant product
- Constant sum
- Concentrated liquidity
- Curve stable swap

[Desmos graphs](https://www.desmos.com/calculator/5ob4mfy5r3)
