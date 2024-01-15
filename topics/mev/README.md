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

[Flashbotstest.sol](./FlashbotsTest.sol) deployed on Goerli testnet at [0x6638872268bE680cD4fF6F66BB4aa5eaBE94875A]

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
# Goerli FlashBotsTest address
# 0x6638872268bE680cD4fF6F66BB4aa5eaBE94875A

CHAIN=5
DST=0x6638872268bE680cD4fF6F66BB4aa5eaBE94875A
FUNC_SIG="inc()"
ARGS=""
RPC=https://rpc-goerli.flashbots.net

# Send tx
cast send --account $ACCOUNT --rpc-url $RPC --chain $CHAIN $DST $FUNC_SIG $ARGS

# Query - get count
cast call --rpc-url $RPC --chain $CHAIN $DST "count()(uint256)"
```

### References

- [Flashbots](https://docs.flashbots.net/)
