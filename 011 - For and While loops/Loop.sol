// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract Loop {

    function loop() public pure {
        
        // for loop
        for (uint i = 0; i < 10; i++) {
            // do something
        }

        // while loop
        uint j;
        while (j < 10) {
            // do something
            j++;
        }
    
    }

}