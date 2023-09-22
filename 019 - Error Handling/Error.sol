// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Error {

    function testRequire(uint _i) public pure {
        // 'require' -> validate inputs and conditions 
        // If the condition is not satisfied, the contract execution will be reverted, and an error message will be displayed
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure {
        // 'revert' -> complex conditions and custom errors
        //  Useful when the conditions are more complex or to provide more detailed error messages 
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view {
        // 'assert' -> testing invariants and internal errors
        // Used to check for conditions that should never be false
        // Ensures that the invariant is maintained
        assert(num == 0);
    }

    // Custom Error -> help optimize gas costs and provide more detailed error messages
    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view {
        uint bal = address(this).balance;
        if (bal < _withdrawAmount) {
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }
    }

}