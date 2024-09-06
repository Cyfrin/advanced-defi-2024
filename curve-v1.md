# Curve v1

## Tools

- [Foundry](https://github.com/foundry-rs/foundry/tree/master)
- [Python / Jupyter lab](https://jupyter.org/)(optional)


## Topics

### Intro

> What you will learn
> - What is Curve AMM
> - How is it different from Uniswap v2 and v3?

- Intro
- [Comparison with Uniswap v2 and v3](./topics/amm/curve-v1/comparisons.md)
- TODO: project setup 

### Math

> What you will learn
> - Math of Curve v1 AMM
> - How Curve v1's equation calculates swap amount and liuidity

- Graphs
  - [Curve V1 AMM graph](https://www.desmos.com/calculator/3xrvh5slce)
  - [Curve V1 xy/(D/2)^2 graph](https://www.desmos.com/3d/t0jtduq4us)
- [Math](./excalidraw/amm/curve-v1/curve-v1-eq.png)
- [Newton's method](./excalidraw/amm/curve-v1/curve-v1-newton.png)
  - [Curve v1 equations](./notebook/curve_v1_equations.ipynb)
  - [Curve v1 Newton's method](./notebook/curve_v1_newton.ipynb)

### [ ] Contract overview


TODO: fix
> What you will learn
> - Curve v1 AMM contract overview
> - Parameter "A" that controls the flatness of the curve of Curve v1
> - Number "D" that quantifies liquidity of the pool

- TODO: contract overview
- TODO: show how A affects D


- Code walkthrough
  - `A`
    - `ramp_A`
    - `stop_ramp_A`
  - `_xp`
  - `get_D`
    - [Python code - Compute equations for D](./notebook/curve_v1_equations.ipynb)
  - `get_virtual_price`
  - `calc_token_amount`

### Swap

> What you will learn
> - How swap function is implemented

- Code walkthrough
  - `exchange`
    - `get_y`
      - [Python code - Compute equations for y](./notebook/curve_v1_equations.ipynb)
- `get_dy`
- Exercises
  - [Exercise 1](./foundry/test/curve-v1/exercises/CurveV1Swap.test.sol)
  - [Solution 1](./foundry/test/curve-v1/solutions/CurveV1Swap.test.sol)
  - [Exercise 2](./foundry/test/curve-v1/exercises/CurveV1Swap.test.sol)
  - [Solution 2](./foundry/test/curve-v1/solutions/CurveV1Swap.test.sol)

### Add liquidity

> What you will learn
> - How the function to add liquidity is implemented
> - Imbalance fee for adding liquidity in a way that changes the token ratios

- Code walkthrough
  - `add_liquidity`
    - Imbalance fee
- Exercise
  - [Exercise](./foundry/test/curve-v1/exercises/CurveV1Liquidity.test.sol)
  - [Solution](./foundry/test/curve-v1/solutions/CurveV1Liquidity.test.sol)

### Remove liquidity

> What you will learn
> - How the functions to remove liquidity are implemented

- Code walkthrough
  - `remove_liquidity`
  - `remove_liquidity_one_coin`
    - `_calc_withdraw_one_coin`
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
