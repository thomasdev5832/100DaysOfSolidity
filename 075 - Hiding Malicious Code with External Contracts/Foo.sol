// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Bar.sol";

contract Foo {
    
    Bar bar;

    constructor(address _bar) {
        bar = Bar(_bar);
    }

    function callBar() public {
        bar.log();
    }

}