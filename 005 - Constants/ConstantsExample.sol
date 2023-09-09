// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract ConstantsExample {

    // Constants ensure that a variable's value remains unchanged once assigned.
    // Benefits: Immutability, Gas Optimization, Code Readability, Reusability

    address public constant MY_ADDRESS = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;
    uint public constant MY_UINT = 123;

    function getMyAddress() public view returns (address) {
        return MY_ADDRESS;
    }

    function getMyUint() public view returns (uint) {
        return MY_UINT;
    }

}