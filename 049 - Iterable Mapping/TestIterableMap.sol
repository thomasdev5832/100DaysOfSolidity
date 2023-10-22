// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./IterableMapping.sol";

contract TestIterableMap {

    using IterableMapping for IterableMapping.Map;

    IterableMapping.Map private map;

    function testIterableMap() public {
        map.set(address(0), 0);
        map.set(address(1), 100);
        map.set(address(2), 200); // insert
        map.set(address(2), 250); // update
        map.set(address(3), 300);
    
        // iterates over the `map`
        for(uint i = 0; i < map.size(); i++) {
            // retrieving each key
            address key = map.getKeyAtIndex(i);
            assert(map.get(key) == i * 100);
        }

        map.remove(address(1));

        assert(map.size() == 3);
        assert(map.getKeyAtIndex(0) == address(0));
        assert(map.getKeyAtIndex(1) == address(3));
        assert(map.getKeyAtIndex(2) == address(2));
    
    }
}