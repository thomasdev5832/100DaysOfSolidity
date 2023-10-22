// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract IterableMappingExample {

    mapping(address => uint256) private myMapping;

    address[] private keys;

    function setValue(address key, uint256 value) public {
        myMapping[key] = value;
        keys.push(key);
    }

    function getValue(address key) public view returns (uint256) {
        return myMapping[key];
    }

    function getAllKeys() public view returns (address[] memory) {
        return keys;
    }

    function iterateMapping() public view {
        // loops through the `keys` array
        for (uint256 i = 0; i < keys.length; i++) {
            address key = keys[i];
            // retrieves the corresponding value from 'myMapping'
            uint256 value = myMapping[key];
            // Perform desired operations with key-value pair
        }
    }

}