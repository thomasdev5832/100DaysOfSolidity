// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./LibraryContract.sol";

contract UserContract {

    address public libraryAddress;
    uint public storedValue;

    constructor(address _library) {
        libraryAddress = _library;
    }

    function updateValue(uint _newValue) external {
        (bool success, ) = libraryAddress.delegatecall(abi.encodeWithSignature("setValue(uint256)", _newValue));
        require(success, "Delegatecall failed");
    }

}