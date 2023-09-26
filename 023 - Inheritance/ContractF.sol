// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";
import "./ContractB.sol";

contract ContractF is ContractA, ContractB {
    function foo() public pure override (ContractA, ContractB) returns (string memory) {
        return super.foo();
        // output: "B"
    }
}