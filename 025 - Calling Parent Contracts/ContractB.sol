// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";

contract ContractB is ContractA {

    // The "override" keyword is used to indicate that a function in a child contract is overriding a function marked as "virtual" in the parent class.
    // "override" ensures that the function in the child is actually overriding a function in the parent class.
    function foo() public virtual override {
        emit Log("ContractB.foo called");
        ContractA.foo();
    }

    function bar() public virtual override {
        emit Log("ContractB.bar called");
        // The `super` keyword allows to explicitly call functions from immediate parent contracts. 
        super.bar();
    }

}