// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import "./Sample.sol";

contract DerivedSample is Sample {

    function updateNumbers(uint256 _private, uint256 _internal, uint256 _public) public {
        //setPrivateNumber(_private); -> cannot be called directly from derived contracts
        setInternalNumber(_internal); // can be called from derived contracts
        setPublicNumber(_public); // can be called from anywhere
    }

}