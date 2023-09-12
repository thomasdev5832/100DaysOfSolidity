// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract GasFees {

    uint public totalSuply = 1000;

    function transfer(uint _value) external payable {
        
        // Gasleft is used to check the remaining gas during a contract call
        uint gasUsed = gasleft();
        // Gas price represents the amount of ether you are willing to pay per unit of gas.
        uint gasPrice = tx.gasprice;
        // calculate gas fees
        uint gasFees = gasUsed * gasPrice;

        // deduct gas fees from the transfered value
        uint transferValue = _value - gasFees;

        // perform the transfer with the updated value
        totalSuply -= transferValue;

        // refund any remaining gas
        uint remainingGas = gasleft();

        payable(msg.sender).transfer(remainingGas * gasPrice);

    }

}