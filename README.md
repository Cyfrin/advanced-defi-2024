# advanced-defi-2024

## Goals

- Be able to integrate a simple dapp into another defi protocol
- Understand the fundamentals of protocols

- TODO: Simple apps for each protocol

## Install

- foundry
- python?

## Topics

TODO: spot, execution price, slippage

- [ ] Syllabus
- [ ] MEV
  - [ ] Front run, back run and sandwich examples
  - [ ] Flashbots RPC example
  - [ ] Summary
- [ ] AMM
  - [ ] AMM vs orderbook
  - [ ] Different AMMs (constant product, constant sum, concentrated liquidity)
  - [ ] Uniswap v2
    - [ ] Math
    - [ ] Contract overview
    - [ ] Swap
      - [ ] MEV sandwicsh 🤔
    - [ ] Add / remove liquidity
    - [ ] Flash swap
    - [ ] TWAP
  - [ ] Uniswap v3
    - [ ] Math
    - [ ] Contract overview
    - [ ] Swap
    - [ ] Add / remove liquidity
      - [ ] JIT liquidity
    - [ ] Flash swap
    - [ ] TWAP
  - [ ] Curve v1
    - [ ] Math
    - [ ] Swap
    - [ ] Add / remove liquidity
    - [ ] TWAP🤔
    - [ ] VE gauge🤔 (liquidity -> better price for users -> more trade -> more fee -> more liquidity)?
  - [ ] Curve v2🤔
    - [ ] Math
  - [ ] Summary
- [ ] Price oracle ✅
  - [ ] Chainlink
- [ ] Stablecoin ✅
  - [ ] DAI
    - [ ] Overview
    - [ ] CDP and vaults
    - [ ] Math (wad, ray, rad)
    - [ ] Debt math
    - [ ] Contract overview
    - [ ] Add collateral
    - [ ] Borrow
    - [ ] Repay
    - [ ] Liquidation, math and auction
    - [ ] Debt auction
    - [ ] Surplus auction
    - [ ] DSR (math)
    - [ ] PSsM
    - [ ] Flash
    - [ ] Flash mint DAI -> Sell DAI for USDC on Uniswap -> Sell USDC to PSM -> Repay flash loan
    - [ ] What can we do with DAI and Maker protocol?🤔
    - [ ] Leverage🤔
    - [ ] Summary
- [ ] Lending
  - [ ] AAVE 🚧
    - [ ] supply
    - [ ] borrow
    - [ ] repay
    - [ ] withdraw
    - [ ] flash loan
    - [ ] liquidation
    - [ ] GHO 🤔
    - [ ] portal 🤔
    - [ ] stake AAVE 🤔
    - [ ] govenance 🤔
    - [ ] apps -> flash loan, farm gov tokens, leverage, short 🤔
  - [ ] Compound 🤔
  - [ ] Flash loan
  - [ ] Rebase tokens
  - [ ] Summary
- [ ] Liquid staking 🚧
  - [ ]Lido
  - [ ]Rocket pool 🤔

## TODOs

- How to cover theses topics?
  - Algorithms used in DeFi
    - AMM
    - Vault
    - Staking rewards (discrete and time based)
    - DAI interest rate
    - Dutch auction
    - English and Dutch auction
- DEX agg - cow swap, paraswap?

## Resources

- cyfrin updraft
- https://defillama.com/
- https://www.youtube.com/@blockchain-web3moocs635/playlists

#### Aave

- https://calnix.gitbook.io/aave-unleashed/
- https://github.com/aave/protocol-v2/blob/master/aave-v2-whitepaper.pdf
- https://github.com/aave/aave-protocol/blob/master/docs/Aave_Protocol_Whitepaper_v1_0.pdf
