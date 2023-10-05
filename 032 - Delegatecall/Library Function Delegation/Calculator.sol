// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Math.sol";

contract Calculator {

    using Math for uint;

    function addNumbers(uint _a, uint _b) public pure returns (uint) {
        return Math.add(_a, _b);
    }

    /*
    The `Calculator` contract uses the `delegatecall` feature of libraries.
    The `Math` library provides an `add` function, which is delegated by the `Calculator` contract.
    This approach allows the contract to utilize the functionality of the library without having to deploy it separately.
    */

}