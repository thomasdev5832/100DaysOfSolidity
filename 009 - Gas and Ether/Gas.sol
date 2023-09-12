// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Gas {

    uint public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // State changes are undone.
    // Gas spent are not refunded.
    
    // run an infinite loop until all the gas is consumed.
    function forever() public {
        while(true) {
            i += 1;
        }
    }

}