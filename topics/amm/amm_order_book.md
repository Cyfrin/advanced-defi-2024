# AMM vs Order Book

Why not use on-chain order books? What problem does AMM solve?

```
Gas - AMMs execute trade with lower gas cost than order books
Liquidity - Better liquidity than on-chain order books
```

### What is liquidity

```
Liquidity - ease with which an asset can be converted into cash
            without affecting its market price (Investopedia.com)
```

### On-chain order book

##### Operations

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
- Order book
  - Sort orders by price
  - Match and execute orders

##### Cons

- Expensive gas cost 🔥
- Low liquidity 💧
- Low trading volume 🔈

### AMM

##### Operations

- Liquidity provider
  - Deposit tokens
- Trader
  - Swap tokens with the AMM
- AMM
  - Execute trades
  - Algorithmically calculate the exchange rates
  - Give swap fees to liquidity providers

##### Pros

- Gas efficient ✅
- High liquidity 💧💧💧
- High trading volume 🔊

##### Cons

- Liquidity providers usually operate at a loss 💸
