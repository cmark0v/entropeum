// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.21;

import "../lib/forge-std/src/Script.sol";

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
    }
}
