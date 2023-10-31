// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./StorageSlot.sol";

contract TestSlot {

    // `bytes32` value represent the storage slot used to store the "AddressSlot" data
    bytes32 public constant TEST_SLOT = keccak256("TEST_SLOT");

    // writing the address to the storage slot specified by `TEST_SLOT`
    function write(address _addr) external {
        // obtain a storage pointer to the "AddressSlot" struct at the specified slot
        StorageSlot.AddressSlot storage data = StorageSlot.getAddressSlot(TEST_SLOT);
        // assigns the passed address `_addr` to the `value` member of the retrieved "AddressSlot" storage pointer
        data.value = _addr;
    }

    // reading the address value stored in the storage slot specified by `TEST_SLOT`
    function write() external view returns (address) {
        StorageSlot.AddressSlot storage data = StorageSlot.getAddressSlot(TEST_SLOT);
        return data.value;
    }

}