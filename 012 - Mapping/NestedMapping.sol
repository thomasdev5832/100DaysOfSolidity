// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract NestedMapping {

    // Nested mapping => mapping from address to another mapping
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool) {
        // get values from a nested mapping
        // even when it is not initialized
        return nested[_addr][_i];
    }

    function set(address _addr, uint _i, bool _boo) public {
        nested[_addr][_i] = _boo;
    }

    function remove(address _addr, uint _i) public {
        delete nested[_addr][_i];
    }

}