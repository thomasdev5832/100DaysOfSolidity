// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import { ERC721 } from "./ERC721.sol";

contract MyERC721 is ERC721 {

    constructor() ERC721("MyERC721", "M721") {}

    uint256 private tokenIdCounter = 0;

    function mintToken(address to) external {
        _mint(to, tokenIdCounter);
        tokenIdCounter++;
    }

    

}