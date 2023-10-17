// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract MostSignificantBitFunction {

    function mostSignificantBit(uint x) external pure returns (uint msb) {
        
        if(x >= 0x100000000000000000000000000) {
            x >>= 128;
            msb += 128;
        }

        if(x >= 0x1000000000000000) {
            x >>= 64;
            msb += 64;
        }

        if(x >= 0x100000000) {
            x >>= 32;
            msb += 32;
        }

        if(x >= 0x10000) {
            x >>= 16;
            msb += 16;
        }

        if(x >= 0x1000) {
            x >>= 8;
            msb += 8;
        }

        if(x >= 0x10) {
            x >>= 4;
            msb += 4;
        }

        if(x >= 0x4) {
            x >>= 2;
            msb += 2;
        }

        if(x >= 0x2) {
            msb += 1;
        }

    }

}