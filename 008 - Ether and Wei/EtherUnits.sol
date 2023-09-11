// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract EtherUnits {

    uint public oneWei = 1 wei;

    // 1 wei equal to 1
    bool public insOneWei = 1 wei == 1;

    // 1 ether is equal to 10^18 wei
    bool public insOneEther = 1 ether == 1e18;

}