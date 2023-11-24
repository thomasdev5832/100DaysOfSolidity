// SPDX-License-Identifier: MIT

pragma solidity ^0.8;
// Asserts not detected in 0.8
// switch to 0.7 to test assertions

contract TestAssert {

    // 🦔 Echidna can help you explore how assertions behave under various conditions, catching unexpected scenarios that could potentially lead to contract vulnerabilities.

    function test_assert(uint _i) external {
        assert(_i < 10);
    }

    // more complex example
    function abs(uint x, uint y) private pure returns (uint) {
        if(x >= y) {
            return x - y;
        }
        return y - x;
    }

    function test_abs(uint x, uint y) external {
        uint z = abs(x, y);
        if(x >= y) {
            assert(z <= x);
        } else {
            assert(z <= y);
        }
    }

}