# MEV - Maximal extractable value

`MEV` - Maximum value that can be extracted from block production by including, excluding or rearranging the order of transactions

`Searcher` - User or a bot that searches for MEV opportunities and submit profitable transactions

### Examples

Front run, back run and sandwich

- Front run - execute transaction before target
  - DEX arbitrage [Example](https://etherscan.io/tx/0x5e1657ef0e9be9bc72efefe59a2528d0d730d478cfc9e6cdd09af9f997bb3ef4)
  - Liquidation
- Backrun - execute transaction after target
  - DEX arbitrage
- Sandwich - execute transaction before and after target
  TODO: xy = k calc
  - DEX trade (1000 DAI / ETH, 1001 DAI / ETH -> 1002 DAI / ETH, ETH -> 1001 DAI / ETH)
  - JIT (Just in time) liquidity

### Protection

- use Flashbots

### TODO: Code

https://docs.flashbots.net/flashbots-auction/libraries/ethers-js-provider

- Ether.js
- Web3.py
- Foundry cast?

### References

- [Flashbots](https://docs.flashbots.net/)
