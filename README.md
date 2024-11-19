# Advanced Defi 2024

- [How to use this repo](#how-to-use-this-repo)
- [Topics](#topics)
- [Tools](#tools)
- [Exercises and solutions](#exercises-and-solutions)
- [Resources](#resources)

## How to use this repo

Each DeFi course has a markdown file which lists the prerequisites and topics that are covered.

Check out the [topics](#topics) section to see which DeFi protocol is available.

Here are the general steps to follow for each course.

- Check prerequisites
- Install [tools](#tools)
- Watch videos on [Cyfrin Updraft](https://updraft.cyfrin.io/)
- Do [exercises and check solutions](#exercises-and-solutions)
- Ask questions on [GitHub discussions](https://github.com/Cyfrin/advanced-defi-2024/discussions)

## Topics

- [ ] Syllabus
- [ ] AMM
  - [x] Intro
    - [x] [What is an AMM?](./topics/amm/intro/what_is_amm.md)
    - [x] [AMM vs orderbook](./topics/amm/intro/amm_order_book.md)
    - [x] [Different AMM equations](./topics/amm/intro/amm_equations.md)
  - [x] [Uniswap v2](./uniswap-v2.md)
  - [x] [Uniswap v3](./uniswap-v3.md)
  - [x] [Curve v1](./curve-v1.md)
  - [x] [Curve v2](./curve-v2.md)
- [ ] MEV
- [ ] Price oracle - Chainlink
- [ ] Stablecoin
- [ ] Lending protocol

## Tools

Make sure to install the tools used in this course

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

## Resources

- [Cyfrin Updraft](https://updraft.cyfrin.io/)
- [DeFiLama](https://defillama.com/)
- [Whitepapers](./whitepapers)
