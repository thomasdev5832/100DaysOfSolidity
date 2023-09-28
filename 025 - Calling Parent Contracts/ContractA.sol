// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractA {
    event Log(string message);

    // The "virtual" keyword is used to mark a function in the parent contract as potentially overridable in child contracts.
    // Can be replaced with a function with the same signature in child contract.
    function foo() public virtual {
        emit Log("ContractA.foo called");
    }

    function bar() public virtual {
        emit Log("ContractA.bar called");
    }

}