# advanced-defi-2024

## Install

```shell
# Install foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup
```

## Exercises and solutions

Exercises and solutions are located in [foundry/test](./foundry/test)

Tests are grouped by DeFi protocal.

For each DeFi protocol there are `exercises` and `solutions` folder.

`exercises` are for you to write your code.

`solutions` are for you to check you code.

```shell
# Make sure to execute foundry command inside the foundry founder
cd foundry

# Compile
forge build
```

```shell
# Make sure to execute foundry command inside the foundry founder
cd foundry

# Set FORK_URL
FORK_URL= rpc url for testing on fork

# Test exercises
forge test --fork-url $FORK_URL \
--match-path test/[name of DeFi protocol]/exercises/[name of test].test.sol \
--match-test name_of_test \
-vvv

# Test solutions
forge test --fork-url $FORK_URL \
--match-path test/[name of DeFi protocol]/solutions/[name of test].test.sol \
--match-test name_of_test \
-vvv
```

## Topics

- [ ] Syllabus
- [ ] AMM
  - [x] Intro
    - [x] 1. [What is an AMM?](./topics/amm/intro/what_is_amm.md)
    - [x] 2. [AMM vs orderbook](./topics/amm/intro/amm_order_book.md)
    - [x] 3. [Different AMM equations](./topics/amm/intro/amm_equations.md)
  - [x] [Uniswap v2](./uniswap-v2.md)
  - [x] [Uniswap v3](./uniswap-v3.md)
  - [x] [Curve v1](./curve-v1.md)
  - [ ] Curve v2
- [ ] MEV
- [ ] Price oracle - Chainlink
- [ ] Stablecoin - DAI
- [ ] Lending - AAVE v3

## Resources

- https://updraft.cyfrin.io/
- https://defillama.com/
- https://www.youtube.com/@blockchain-web3moocs635/playlists

[Whitepapers](./whitepapers)
