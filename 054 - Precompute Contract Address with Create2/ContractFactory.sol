// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./SampleContract.sol";

contract ContractFactory {
    
    event ContractDeployed(address indexed newContractAddress, bytes32 salt);

    function getContractAddress(bytes32 salt, bytes memory bytecode) public view returns (address) {
        bytes32 hash = keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(bytecode)
        ));
        return address(uint160(bytes20(hash)));
    }

   
    // The "create2" opcode takes four arguments:
    // 1️⃣ Salt: A random value that is used to generate a deterministic address
    // 2️⃣ Bytecode: The bytecode of the contract that is going to be deployed.
    // 3️⃣ Initializer: If the contract being deployed has an initializer function, this argument can be used to provide the input data for that function.
    // 4️⃣ Value: The amount of ether to be sent along with the deployment transaction.
    
    // ⭐ Use Cases:
    // - Efficient Token Deployment
    // - Upgradeable Contracts
    // - Decentralized Name Services
    // - Collaborative Contract Deployment

    // Function to create a contract at the precomputed address using 'create2' opcode
    function deployContract(bytes32 salt, bytes memory bytecode) public {
        address contractAddress;
        assembly {
            contractAddress := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
            if iszero(extcodesize(contractAddress)) {
                revert(0, 0)
            }
        }
        emit ContractDeployed(contractAddress, salt);
    }

    function deploySampleContract(uint256 initialValue) public {
        bytes memory bytecode = type(SampleContract).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(msg.sender, initialValue));
        // ⚡ calls the `deployContract` function to deploy the `SampleContract` to the precomputed address
        deployContract(salt, bytecode);
    }

}