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
  - DEX trade
  - JIT (Just in time) liquidity

### Protection

- Use [Flashbots RPC](https://docs.flashbots.net/flashbots-protect)

### Code example using `cast`

Example of sending transcation through Flasbots RPC

[FlashbotsTest.sol](./FlashbotsTest.sol) deployed on Sepolia testnet at [0xA36Cc45540670B8699dE15596618a857f1AB9610](https://sepolia.etherscan.io/address/0xA36Cc45540670B8699dE15596618a857f1AB9610)

1. Import wallet into cast

```shell
# Import private key
ACCOUNT=burner
PRIVATE_KEY=...
cast wallet import $ACCOUNT --private-key $PRIVATE_KEY
# Clear private key variable
unset PRIVATE_KEY

# List wallets
cast wallet list

# Wallet saved to ~/.foundry/keystores
ls ~/.foundry/keystores/

# Remove wallet
rm -rf ~/.foundry/keystores/$ACCOUNT
```

2. Send transaction using Flashbots RPC

```shell
# Sepolia FlashBotsTest address
# 0xA36Cc45540670B8699dE15596618a857f1AB9610

ACCOUNT=burner
CHAIN=11155111
DST=0xA36Cc45540670B8699dE15596618a857f1AB9610
FUNC_SIG="unlock(string)"
ARGS="cyfrin"
RPC=https://rpc-sepolia.flashbots.net

# Send tx
cast send --account $ACCOUNT --rpc-url $RPC --chain $CHAIN $DST $FUNC_SIG $ARGS
```

### References

- [cyfrin updraft](https://updraft.cyfrin.io/courses/security/mev-and-governance/mev-introduction?lesson_format=video)
- [Flashbots](https://docs.flashbots.net/)
