// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Library features:
// 1️⃣ Cannot have any state variables
// 2️⃣ Cannot send or receive Ether
// Libraries are purely focused on providing reusable functions and code logic

library Math {

    function sqrt(uint y) internal pure returns (uint z) {
        
        if(y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while(x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        } else {
            z = 0; // default
        }

    }

}