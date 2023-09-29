// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

contract Sample {

    uint256 private privateNumber;
    uint256 internal internalNumber;
    uint256 public publicNumber;
    
    function setPrivateNumber(uint256 _number) private {
        privateNumber = _number;
    }

    function getPrivateNumber() public view returns (uint256) {
        return privateNumber;
    }

    function setInternalNumber(uint256 _number) internal {
        internalNumber = _number;
    }

    function getInternalNumber() public view returns (uint256) {
        return internalNumber;
    }

    function setPublicNumber(uint256 _number) public {
        publicNumber = _number;
    }

    function getPublicNumber() public view returns (uint256) {
        return publicNumber;
    }

}