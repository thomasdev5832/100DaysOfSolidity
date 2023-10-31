// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

library StorageSlot {

    // Wrap address in a struct so that it can be passed around as a storage pointer
    struct AddressSlot {
        address value;
    }

    function getAddressSlot(bytes32 slot) internal pure returns (AddressSlot storage pointer) {
        assembly {
            // get the pointer to AddressSlot stored at slot
            pointer.slot := slot
        }
    }

}