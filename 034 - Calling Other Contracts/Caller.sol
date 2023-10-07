// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Callee.sol";

contract Caller {

    // Direct Function Call 
    function setX(Callee _callee, uint _x) public {
      uint x = _callee.setX(_x);
    }

}