# Curve v1

## How to use this section

- Install [tools](#tools)

## Prerequisites

- Intermediate Solidity
- Experience with Foundry
- Knowledge of constant sum (`x + y = K`) and constant product (`xy = K`) AMM
- Python (optional)

## Tools

- [Foundry](https://github.com/foundry-rs/foundry/tree/master)
- [Python / Jupyter lab](https://jupyter.org/) (optional)

## Topics

### Section 1 - Intro

> What you will learn
>
> - What is Curve AMM
> - How is it different from Uniswap v2 and v3?

- Intro
- [Comparison with Uniswap v2 and v3](./topics/amm/curve-v1/comparisons.md)
- TODO: project setup

### Section 2 - Math

> What you will learn
>
> - Math of Curve v1 AMM
> - How Curve v1's equation calculates swap amount and liuidity

- Graphs
  - [Curve V1 AMM graph](https://www.desmos.com/calculator/3xrvh5slce)
  - [Curve V1 xy/(D/2)^2 graph](https://www.desmos.com/3d/t0jtduq4us)
- [Math](./excalidraw/amm/curve-v1/curve-v1-eq.png)
- [Newton's method](./excalidraw/amm/curve-v1/curve-v1-newton.png)
  - [Curve v1 equations](./notebook/curve_v1_equations.ipynb)
  - [Curve v1 Newton's method](./notebook/curve_v1_newton.ipynb)

### Section 3 - Contract overview

> What you will learn
>
> - Curve v1 AMM contract overview
> - Parameter `A` that controls the flatness of the curve of Curve v1
> - Number `D` that quantifies liquidity of the pool

- TODO: contract overview
- TODO: show how A affects D

- Code walkthrough
  - [`A`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L147-L172)
    - [`ramp_A`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L701-L716)
    - [`stop_ramp_A`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L719-L730)
  - [`_xp`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L175-L181)
  - [`get_D`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L193-L218)
    - [Python code - Compute equations for D](./notebook/curve_v1_equations.ipynb)
  - [`get_virtual_price`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L227-L238)
  - [`calc_token_amount`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L241-L265)

### Section 4 - Swap

> What you will learn
>
> - How swap function is implemented

- Code walkthrough
  - [`exchange`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L429-L493)
    - [`get_y`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L354-L397)
      - [Python code - Compute equations for y](./notebook/curve_v1_equations.ipynb)
  - [`get_dy`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L400-L411)
- Exercises
  - [Exercise 1](./foundry/test/curve-v1/exercises/CurveV1Swap.test.sol)
  - [Solution 1](./foundry/test/curve-v1/solutions/CurveV1Swap.test.sol)
  - [Exercise 2](./foundry/test/curve-v1/exercises/CurveV1Swap.test.sol)
  - [Solution 2](./foundry/test/curve-v1/solutions/CurveV1Swap.test.sol)

### Section 5 - Add liquidity

> What you will learn
>
> - How the function to add liquidity is implemented
> - Imbalance fee for adding liquidity in a way that changes the token ratios

- Code walkthrough
  - [`add_liquidity`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L268-L351)
    - Imbalance fee
- Exercise
  - [Exercise](./foundry/test/curve-v1/exercises/CurveV1Liquidity.test.sol)
  - [Solution](./foundry/test/curve-v1/solutions/CurveV1Liquidity.test.sol)

### Section 6 - Remove liquidity

> What you will learn
>
> - How the functions to remove liquidity are implemented

- Code walkthrough
  - [`remove_liquidity`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L496-L524)
  - [`remove_liquidity_one_coin`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L668-L697)
    - [`_calc_withdraw_one_coin`](https://github.com/curvefi/curve-contract/blob/b0bbf77f8f93c9c5f4e415bce9cd71f0cdee960e/contracts/pools/3pool/StableSwap3Pool.vy#L628-L659)
- Exercises
  - [Exercise 1](./foundry/test/curve-v1/exercises/CurveV1Liquidity.test.sol)
  - [Solution 1](./foundry/test/curve-v1/solutions/CurveV1Liquidity.test.sol)
  - [Exercise 2](./foundry/test/curve-v1/exercises/CurveV1Liquidity.test.sol)
  - [Solution 2](./foundry/test/curve-v1/solutions/CurveV1Liquidity.test.sol)

## Resources

- [Curve](https://curve.fi)
- [Docs](https://curve.readthedocs.io/)
- [Whitepaper](https://resources.curve.fi/pdf/curve-stableswap.pdf)
- [Curve resources](https://resources.curve.fi/)
- [Curve magic](https://hackmd.io/@alltold/curve-magic)
- [Imbalance fee](https://ethereum.stackexchange.com/questions/124850/curve-amm-how-is-fee-calculated-when-adding-liquidity)
- [Curve V1 StableSwap3Pool code](https://github.com/curvefi/curve-contract/blob/master/contracts/pools/3pool/StableSwap3Pool.vy)
- [3pool](https://etherscan.io/address/0xbebc44782c7db0a1a60cb6fe97d0b483032ff1c7)
- [Newton's method](https://en.wikipedia.org/wiki/Newton's_method)
