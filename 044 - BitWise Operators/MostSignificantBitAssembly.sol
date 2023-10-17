// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract MostSignificantBitAssembly {

    function mostSignificantBit(uint x) external pure returns (uint msb) {
        
        assembly {
            let f := shl(7, gt(x, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(6, gt(x, 0xFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(5, gt(x, 0xFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(4, gt(x, 0xFFFF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(3, gt(x, 0xFF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(2, gt(x, 0xF))
            x := shr(f, x)
            msb := or(msb, f)        
        }

        assembly {
            let f := shl(1, gt(x, 0x1))
            x := shr(f, x)
            msb := or(msb, f)        
        }



    }

}