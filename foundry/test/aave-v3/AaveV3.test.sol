// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";

address constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
address constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
address constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

address constant AAVE_PROTOCOL_DATA_PROVIDER =
    0x7B4EB56E7CD4b454BA8ff71E4518426369a138a3;
address constant WRAPPED_TOKEN_GATEWAY_V3 =
    0xD322A49006FC828F9B5B37Ab215F99B4E5caB19C;
address constant POOL_PROXY = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;
address constant POOL_IMP = 0xF1Cd4193bbc1aD4a23E833170f49d60f3D35a621;
address constant AWETH = 0x4d5F47FA6A74757f35C14fD3a6Ef8E3C9BC514E8;

contract AaveV3Test is Test {
    // TODO:
    // stable and variable
    // supply
    // borrow
    // check debt + interest
    // repay
    // withdraw collateral
    // credit delegation
    // liquidation
    // flash loans
    IWETH private constant weth = IWETH(WETH);
    IERC20 private constant usdc = IERC20(USDC);

    IAaveProtocolDataProvider private constant dataProvider =
        IAaveProtocolDataProvider(AAVE_PROTOCOL_DATA_PROVIDER);
    IWrappedTokenGatewayV3 private constant gateway =
        IWrappedTokenGatewayV3(WRAPPED_TOKEN_GATEWAY_V3);
    IPool private constant pool = IPool(POOL_PROXY);
    IAToken private constant aToken = IAToken(AWETH);

    function print() private {
        console2.log("AToken balance", aToken.balanceOf(address(this)));
        {
            (
                uint256 totalCollateralBase,
                uint256 totalDebtBase,
                uint256 availableBorrowsBase,
                uint256 currentLiquidationThreshold,
                uint256 ltv,
                uint256 healthFactor
            ) = pool.getUserAccountData(address(this));
            console2.log("collateral", totalCollateralBase);
            console2.log("debt", totalDebtBase);
            console2.log("available borrow", availableBorrowsBase);
            console2.log("liquidation threshold", currentLiquidationThreshold);
            console2.log("ltv", ltv);
            console2.log("health factor", healthFactor);
        }
        {
            (
                uint256 currentATokenBalance,
                uint256 currentStableDebt,
                uint256 currentVariableDebt,
                uint256 principalStableDebt,
                uint256 scaledVariableDebt,
                uint256 stableBorrowRate,
                uint256 liquidityRate,
                uint40 stableRateLastUpdated,
                bool usageAsCollateralEnabled
            ) = dataProvider.getUserReserveData(WETH, address(this));
            console2.log("AToken balance", currentATokenBalance);
            console2.log("stable debt", currentStableDebt);
            console2.log("variable debt", currentVariableDebt);
            console2.log("principal stable debt", principalStableDebt);
            console2.log("scaled variable debt", scaledVariableDebt);
            console2.log("stable borrow rate", stableBorrowRate);
            console2.log("liquidity rate", liquidityRate);
            console2.log(
                "stableRateLastUpdated", uint256(stableRateLastUpdated)
            );
            console2.log(
                "usage as collateral enabled", usageAsCollateralEnabled
            );
        }
    }

    function test_supply() public {
        gateway.depositETH{value: 1e18}(address(0), address(this), 0);

        // borrow
        pool.borrow({
            asset: USDC,
            amount: 100 * 1e6,
            interestRateMode: 2,
            referralCode: 0,
            onBehalfOf: address(this)
        });

        skip(365 * 24 * 3600);
        console2.log("--- after borrow ---");
        print();
        console2.log("USDC balance", usdc.balanceOf(address(this)));

        // repay
        deal(USDC, address(this), 200 * 1e6);
        usdc.approve(address(pool), type(uint256).max);

        uint256 repaid = pool.repay({
            asset: USDC,
            amount: type(uint256).max,
            interestRateMode: 2,
            onBehalfOf: address(this)
        });

        print();
        console2.log("--- after repay ---");
        console2.log("REPAID", repaid);
        console2.log("USDC balance", usdc.balanceOf(address(this)));

        pool.withdraw(WETH, type(uint256).max, address(this));
        console2.log("WETH balance", weth.balanceOf(address(this)));
    }
}

contract AaveV3FlashLoanSimpleTest is Test {
    IPool private constant pool = IPool(POOL_PROXY);
    IERC20 private constant dai = IERC20(DAI);

    function setUp() public {
        deal(DAI, address(this), 1e6 * 1e18);
        dai.approve(address(pool), type(uint256).max);
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool) {
        require(asset == DAI, "not DAI");
        require(amount == 1e6 * 1e18, "invalid amount");

        console2.log("DAI", dai.balanceOf(address(this)));
        console2.log("fee", premium);

        require(msg.sender == address(pool), "not authorized");
        require(initiator == address(this), "invalid initiator");

        (uint256 num, address addr) = abi.decode(params, (uint256, address));
        console2.log("NUM", num);
        console2.log("addr", addr);

        return true;
    }

    function test_flash_loan_simple() public {
        bytes memory params = abi.encode(uint256(123), address(this));

        pool.flashLoanSimple({
            receiverAddress: address(this),
            asset: DAI,
            amount: 1e6 * 1e18,
            params: params,
            referralCode: 0
        });
    }
}

interface IFlashLoanSimpleReceiver {
    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external returns (bool);
}

interface IWrappedTokenGatewayV3 {
    function depositETH(address, address onBehalfOf, uint16 referralCode)
        external
        payable;
    function withdrawETH(address, uint256 amount, address to) external;
}

interface IPool {
    function deposit(
        address asset,
        uint256 amount,
        address onBehalfOf,
        uint16 referralCode
    ) external;
    function borrow(
        address asset,
        uint256 amount,
        // 1 = stable, 2 = variable
        uint256 interestRateMode,
        uint16 referralCode,
        address onBehalfOf
    ) external;
    function repay(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        address onBehalfOf
    ) external returns (uint256 repaid);
    function withdraw(address asset, uint256 amount, address to)
        external
        returns (uint256);
    function getUserAccountData(address user)
        external
        view
        returns (
            uint256 totalCollateralBase,
            uint256 totalDebtBase,
            uint256 availableBorrowsBase,
            uint256 currentLiquidationThreshold,
            uint256 ltv,
            uint256 healthFactor
        );
    function flashLoanSimple(
        address receiverAddress,
        address asset,
        uint256 amount,
        bytes calldata params,
        uint16 referralCode
    ) external;
}

interface IAToken {
    function balanceOf(address) external view returns (uint256);
}

interface IAaveProtocolDataProvider {
    function getUserReserveData(address asset, address user)
        external
        view
        returns (
            uint256 currentATokenBalance,
            uint256 currentStableDebt,
            uint256 currentVariableDebt,
            uint256 principalStableDebt,
            uint256 scaledVariableDebt,
            uint256 stableBorrowRate,
            uint256 liquidityRate,
            uint40 stableRateLastUpdated,
            bool usageAsCollateralEnabled
        );
}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount)
        external
        returns (bool);
    function allowance(address owner, address spender)
        external
        view
        returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount)
        external
        returns (bool);
}

interface IWETH is IERC20 {
    function deposit() external payable;
    function withdraw(uint256 amount) external;
}
