// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Immutable {

    // `immutable` ensures that this variable cannot be modified after it is assigned a value.
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }

}