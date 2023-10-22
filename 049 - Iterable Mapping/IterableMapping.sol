// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

library IterableMapping {

    // iterable mapping struct
    struct Map {
        address[] keys; // stores the addresses used as keys
        mapping(address => uint) values; // associates each address key with a corresponding value
        mapping(address => uint) indexOf; // keeps track of the index of each address key in the `keys` array.
        mapping(address => bool) inserted; // check if an address key has been inserted into the mapping
    }

    // Retrieves the value associated with a given address key
    function get(Map storage map, address key) public view returns (uint) {
        return map.values[key];
    }

    // Returns the address key at a specific index in the `keys` array.
    function getKeyAtIndex(Map storage map, uint index) public view returns (address) {
        return map.keys[index];
    }

    // Returns the number of elements in the iterable mapping
    function size(Map storage map) public view returns (uint) {
        return map.keys.length;
    }

    // Sets a key-value pair in the mapping. If the key already exists, it updates the associated value.
    function set(Map storage map, address key, uint val) public {
        if(map.inserted[key]) {
            map.values[key] = val;
        } else {
            map.inserted[key] = true;
            map.values[key] = val;
            map.indexOf[key] = map.keys.length;
            map.keys.push(key);
        }
    }

    // Removes a key-value pair from the mapping.
    function remove(Map storage map, address key) public {
        if(!map.inserted[key]) {
            return;
        }
        
        delete map.inserted[key];
        delete map.values[key];

        uint index = map.indexOf[key];
        address lastKey = map.keys[map.keys.length - 1];

        map.indexOf[lastKey] = index;
        delete map.indexOf[key];

        map.keys[index] = lastKey;
        map.keys.pop();
    }

}