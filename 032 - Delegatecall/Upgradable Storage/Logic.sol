// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Logic {

    address public storageContract;

    function setData(uint _data) public {
        (bool success, ) = storageContract.delegatecall(
            abi.encodeWithSignature("setData(uint256)", _data)
        );
    }

    /* 
    The `Logic` contract delegates the execution of the `setData` function to the `Storage` contract. 
    By changing the address of the `storageContract`, the logic contract can upgrade the storage contract while preserving the data stored in it.
    */

}