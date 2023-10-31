// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract WriteToAnySlot {

    // 📦 Solidity Storage and Slots
    // State variables are stored in the contract's storage
    // Conceptually, this storage can be visualized as an enormous array with a staggering length of 2^256
    // Each element in this array is referred to as a "slot"
    // Each slot in Solidity storage can store up to 32 bytes of data

    // 🚀 Advanced use cases of writing to any slot:
    // - Gas Optimization
    // - Data Packing
    // - Dynamic Data Structures
    // - Contract Upgradability
    // - Slot Overwriting
    // - Storage Collision
    // - External Dependencies

    uint256[] private data;

    function writeToSlot(uint256 slotNumber, uint256 value) external {
        
        // 'assembly' -> feature that allows low-level manipulation of the EVM
        assembly {
            // 'mstore' -> allows store data directly in memory
            mstore(0, value)
            // 'sstore' -> copy the data from memory to the desired storage slot
            sstore(slotNumber, mload(0))
        }

    }

}