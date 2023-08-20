pragma solidity ^0.8.21;

import "./TestEnv.sol";

import "../Entropy.sol";

contract test_rand is TestEnv {
    uint256 N = 10;

    function test_rand_32() public {
        for (uint8 i = 1; i < N; i++) {
            uint32 bob = Rand.rand32();
            emit log_named_uint("rand32", bob);
        }
    }

    function test_rand_64() public {
        for (uint8 i = 1; i < N; i++) {
            uint64 bob = Rand.rand64();
            emit log_named_uint("rand64", bob);
        }
    }

    function test_rand_256() public {
        for (uint8 i = 1; i < N; i++) {
            uint256 bob = Rand.rand256();
            emit log_named_uint("rand256", bob);
        }
    }

    function test_rand_gas_kek256() public {
        for (uint8 i = 1; i < N; i++) {
            uint256 bob = Rand.kek256();
            emit log_named_uint("rand256kek", uint256(bob));
        }
    }
}
