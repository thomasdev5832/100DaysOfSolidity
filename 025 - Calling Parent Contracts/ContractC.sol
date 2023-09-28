// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";

contract ContractC is ContractA {

    function foo() public virtual override {
        emit Log("ContractC.foo called");
        ContractA.foo();
    }

    function bar() public virtual override {
        emit Log("ContractC.bar called");
        super.bar();
    }

}