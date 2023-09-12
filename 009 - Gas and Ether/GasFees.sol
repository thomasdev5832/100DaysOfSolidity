// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract GasFees {

    uint public totalSuply = 1000;

    function transfer(uint _value) external payable {
        
        // calculate gas fees
        uint gasUsed = gasleft();
        uint gasPrice = tx.gasprice;
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