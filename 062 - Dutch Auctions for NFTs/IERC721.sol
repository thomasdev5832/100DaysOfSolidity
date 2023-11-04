// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

interface IERC721 {
    function transferFrom(address _from, address _to, uint _nftId) external;
}