// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractB.sol";
import "./ContractC.sol";

contract ContractD is ContractB, ContractC {

    function foo() public virtual override (ContractB, ContractC) {
       super.foo();
    }

    function bar() public virtual override (ContractB, ContractC) {
        super.bar();
    }

}