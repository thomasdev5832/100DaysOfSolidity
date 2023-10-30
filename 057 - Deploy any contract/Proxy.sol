// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// ⭐ The Proxy contract plays a crucial role in facilitating the deployment of any contract by providing a dynamic way to create and interact with smart contracts. 

contract Proxy {

    event Deploy(address);

    // Allows the `Proxy` contract to receive Ether when sent to it.
    receive() external payable {}

    // Deploy a new contract by providing its bytecode as an argument.
    function deploy(bytes memory _code) external payable returns (address addr) {
        assembly {
            // create (v, p, n)
            // v = ammount of ETH to send
            // p = pointer in memory to start of code
            // n = size of code
            addr := create(callvalue(), add(_code, 0x20), mload(_code)) 
        }
        // return address 0 on error
        require(addr != address(0), "deploy failed");
        
        emit Deploy(addr);
    }

    // to execute functions of a deployed contract. 
    function execute(address _target, bytes memory _data) external payable {
        (bool success, ) = _target.call{value: msg.value} (_data);
        require(success, "failed");
    }

}