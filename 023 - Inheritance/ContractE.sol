// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractB.sol";
import "./ContractC.sol";

contract ContractE is ContractC, ContractB {
    function foo() public pure override (ContractC, ContractB) returns (string memory) {
        return super.foo();
        // output: "B" 
        // similar inheritance structure as contract D but with the order of parent contracts reversed.
    }
}