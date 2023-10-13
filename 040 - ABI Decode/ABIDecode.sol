// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ABIDecode {

    struct MyStruct {
        string name;
        uint[2] nums;
    }

    function encodeAndDecode(
        uint x,
        address addr,
        uint[] calldata arr,
        MyStruct calldata myStruct
        ) external pure returns (uint, address, uint[] memory, MyStruct memory) {
        
            // abi encoding
            bytes memory encodedData = abi.encode(x, addr, arr, myStruct);

            // 'abi.decode' function allows reverse the encoding process by extracting the original data from a given byte array.
            // It takes two arguments:
            // - the byte array to be decoded (encodedData)
            // - the data type to decode it into.
            return abi.decode(encodedData, (uint, address, uint[], MyStruct));

    }

}