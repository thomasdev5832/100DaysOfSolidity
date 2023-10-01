// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Payable {
    
    // payable address can receive Ether
    address payable public owner;

    // payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender);
    }

    // The `deposit` function allows anyone to send Ether to the contract.
    // The `payable` keyword ensures that the function can receive Ether. 
    function deposit() public payable {
        
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    // Thos function is not payable, cannot receive Ether
    // If someone tries to send Ether to this function, it will throw an error.
    function notPayable() public {
        
    }

    // function to withdraw all Ether from this contract
    function withdraw() public {
        
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;

        // send all Ether to owner
        // owner can receive Ether since the address of owner is payable
        (bool success, ) = owner.call{value: amount}("");

        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        
        // note that "to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }

}