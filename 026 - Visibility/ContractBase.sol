// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractBase {

    // Visibility for State Variables
    string private privateVar = "my private variable"; // accessible only within the defining contract
    string internal internalVar = "my internal variable"; // can be accessed within the defining contract and derived contracts
    string public publicVar = "my public var"; // accessible by all contracts and accounts
    // State variables cannot be external

    // Private -> can only be accessed within the contract where it is defined.
    // Contracts that inherit from the contract containing private members cannot access them directly.
    function privateFunc() private pure returns (string memory) {
        return "private function called";
    }

    function testPrivateFunc() public pure returns (string memory) {
        return privateFunc();
    }

    // Internal -> are accessible within the current contract and its derived contracts. 
    function internalFunc() internal pure returns (string memory) {
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns (string memory) {
        return internalFunc();
    }

    // Public -> maximum flexibility in terms of accessibility 
    // Allows to be accessed within the defining contract, derived contracts, and also by other contracts and accounts.
    function publicFunc() public pure returns (string memory) {
        return "public function called";
    }

    // External -> can only be called by other contracts and accounts, and they cannot be accessed internally within the contract.
    function externalFunc() external pure returns (string memory) {
        return "external function called";
    }

}