pragma solidity ^0.8.21;

import "../../lib/forge-std/src/Test.sol";
import "./IERC20.sol";

interface Hevm {
    function warp(uint256) external;

    function store(
        address,
        bytes32,
        bytes32
    ) external;
}

interface User {
    function approve(address, uint256) external;
}

contract TestEnv is DSTest {
    Hevm hevm;

    uint256 constant SAT = 10**8;
    uint256 constant WAD = 10**18;
    uint256 constant RAY = 10**27;

    address constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant USDT = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant WBTC = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;

    struct Token {
        address addr; // contract address
        uint256 slot; // memory slot store balance
        uint8 decimals;
    }
    mapping(bytes32 => Token) public tokens;

    event Debug(string, uint256);

    constructor() {
        hevm = Hevm(address(bytes20(uint160(uint256(keccak256("hevm cheat code"))))));
    }

    // Manipulate mainnet ERC20 balance
    function initTokens() public {
        tokens["DAI"].addr = DAI;
        tokens["DAI"].slot = 2;
        tokens["DAI"].decimals = IERC20(DAI).decimals();

        tokens["USDT"].addr = USDT;
        tokens["USDT"].slot = 2;
        tokens["USDT"].decimals = IERC20(USDT).decimals();

        tokens["WETH"].addr = WETH;
        tokens["WETH"].slot = 3;
        tokens["WETH"].decimals = IERC20(WETH).decimals();

        tokens["WBTC"].addr = WBTC;
        tokens["WBTC"].slot = 0;
        tokens["WBTC"].decimals = IERC20(WBTC).decimals();
    }

    function mint(
        bytes32 symbol,
        address account,
        uint256 amt
    ) public {
        address addr = tokens[symbol].addr;
        uint256 slot = tokens[symbol].slot;
        uint256 bal = IERC20(addr).balanceOf(account);

        hevm.store(
            addr,
            keccak256(abi.encode(account, slot)), //mem address of balance in instantiated contract storage
            bytes32(bal + amt)
        );

        assertEq(IERC20(addr).balanceOf(account), bal + amt); // check for success
    }

    function epsilonDiff(
        uint256 val0,
        uint256 val1,
        uint256 epsilon
    ) public {
        uint256 absDiff = val0 > val1 ? val0 - val1 : val1 - val0;
        bool check = absDiff <= epsilon;

        if (!check) {
            emit log_named_uint(
                "Error: approx a == b not satisfied, accuracy difference ",
                epsilon
            );
            emit log_named_uint("  Expected", val0);
            emit log_named_uint("    Actual", val1);
            fail();
        }
    }
}
