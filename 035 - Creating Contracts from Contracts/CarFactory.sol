// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Car.sol";

contract CarFactory {

    Car[] public cars;

    // straight approach to create new contracts
    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model);
        cars.push(car);
    }

    // allows create a contract and fund it with Ether 
    function createAndSendEther(address _owner, string memory _model) public payable {
        Car car = (new Car){value: msg.value}(_owner, _model);
        cars.push(car);
    }

    // Deterministic Contract Creation
    // a random value used in the contract creation process
    function create2(address _owner, string memory _model, bytes32 _salt) public {
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function create2AndSendEther(address _owner, string memory _model, bytes32 _salt) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function getCar(uint _index) public view returns (address owner, string memory model, address carAddr, uint balance) {
        Car car = cars[_index];
        return (car.owner(), car.model(), car.carAddr(), address(car).balance);
    }

}