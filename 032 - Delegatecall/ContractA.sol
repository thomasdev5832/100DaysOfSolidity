// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract ContractA {

    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {

        /* 
        - What happens when `delegatecall` is invoked:
        1️⃣ 'abi.encodeWithSignature' function -> generate the function signature and encode the parameters.
        2️⃣ The encoded data is passed as an argument to the 'delegatecall' function along with the address of contract B.
        3️⃣ 'delegatecall' function is executed, and contractB code is invoked with contract A's storage, message sender, and value.
        4️⃣ The return value of the 'delegatecall' is captured in the 'success' boolean variable and the `data` bytes variable.
        
        *IMPORTANT*: when using 'delegatecall', the called contract's code is executed in the context of the calling contract, but the called contract's storage is not modified. 
        
        */
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }

}