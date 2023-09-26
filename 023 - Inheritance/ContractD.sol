// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractB.sol";
import "./ContractC.sol";

contract ContractD is ContractB, ContractC {
    function foo() public pure override (ContractB, ContractC) returns (string memory) {
        return super.foo();
         // output: "C" 
    }
}