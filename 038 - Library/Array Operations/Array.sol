// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

library Array {

    function remove(uint[] storage arr, uint index) public {
        // move the last element into the place to delete
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }

}