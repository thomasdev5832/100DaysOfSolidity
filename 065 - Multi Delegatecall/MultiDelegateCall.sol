// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./ContractA.sol";
import "./ContractB.sol";
import "./ContractC.sol";

// 🌟 Multi Delegatecall 
// -> chaining multiple delegatecalls together to enable the calling contract to interact with multiple other contracts in a single transaction.
// 🚀 Advantages:
// 1️⃣ Gas Efficiency
// 2️⃣ Atomicity
// 3️⃣ Code Reusability
// 4️⃣ Reduced On-Chain Footprint

contract MultiDelegateCaller {

    ContractA contractA;
    ContractB contractB;
    ContractC contractC;

    constructor(address _contractA, address _contractB, address _contractC) {
        contractA = ContractA(_contractA);
        contractB = ContractB(_contractB);
        contractC = ContractC(_contractC);
    }

    function performMultiDelegateCall(uint256 _aValue, uint256 _bValue, uint256 _cValue) public {
        // perform a multi delegatecall to the target contracts
        contractA.setValue(_aValue);
        contractB.setValue(_bValue);
        contractC.setValue(_cValue);
    }

}