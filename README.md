# Advanced Defi 2024

[contributors-shield]: https://img.shields.io/github/contributors/cyfrin/advanced-defi-2024.svg?style=for-the-badge
[contributors-url]: https://github.com/cyfrin/advanced-defi-2024/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/cyfrin/advanced-defi-2024.svg?style=for-the-badge
[forks-url]: https://github.com/cyfrin/advanced-defi-2024/network/members
[stars-shield]: https://img.shields.io/github/stars/cyfrin/advanced-defi-2024.svg?style=for-the-badge
[stars-url]: https://github.com/cyfrin/advanced-defi-2024/stargazers
[issues-shield]: https://img.shields.io/github/issues/cyfrin/advanced-defi-2024.svg?style=for-the-badge
[issues-url]: https://github.com/cyfrin/advanced-defi-2024/issues
[license-shield]: https://img.shields.io/github/license/cyfrin/advanced-defi-2024.svg?style=for-the-badge
[license-url]: https://github.com/cyfrin/advanced-defi-2024/blob/main/LICENSE
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555

<p align="center"><strong>Learn smart contract development, and level up your career
</strong></p>

[![Stargazers][stars-shield]][stars-url] [![Forks][forks-shield]][forks-url] [![Contributors][contributors-shield]][contributors-url] [![Issues][issues-shield]][issues-url] [![GPLv3 License][license-shield]][license-url]

<p align="center">
    <br />
    <a href="https://cyfrin.io/">
        <img src=".github/images/poweredbycyfrinbluehigher.png" width="145" alt=""/></a>
<a href="https://updraft.cyfrin.io/courses/moccasin">
        <img src=".github/images/coursebadge.png" width="242.3" alt=""/></a>
    <br />
</p>

</div>

This repository houses course resources and [discussions](https://github.com/Cyfrin/advanced-defi-2024/discussions) for the course.

Please refer to this for an in-depth explanation of the content:

- [Website](https://updraft.cyfrin.io) - Join Cyfrin Updraft and enjoy 50+ hours of smart contract development courses
- [Twitter](https://twitter.com/CyfrinUpdraft) - Stay updated with the latest course releases
- [LinkedIn](https://www.linkedin.com/school/cyfrin-updraft/) - Add Updraft to your learning experiences
- [Discord](https://discord.gg/cyfrin) - Join a community of 3000+ developers and auditors
- [Codehawks](https://codehawks.com) - Smart contracts auditing competitions to help secure web3

# Table of Contents

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

- [x] AMM
  - [x] Intro
    - [x] [What is an AMM?](./topics/amm/intro/what_is_amm.md)
    - [x] [AMM vs orderbook](./topics/amm/intro/amm_order_book.md)
    - [x] [Different AMM equations](./topics/amm/intro/amm_equations.md)
  - [x] [Uniswap v2](./uniswap-v2.md)
  - [x] [Uniswap v3](./uniswap-v3.md)
  - [x] [Curve v1](./curve-v1.md)
  - [x] [Curve v2](./curve-v2.md)
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
forge build --via-ir
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
