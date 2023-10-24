// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

import { ERC721 } from "./ERC721.sol";

contract MyERC721WithMetadata is ERC721 {

    mapping(uint256 => string) private _tokensURIs;

    constructor() ERC721("MyERC721WithMetadata", "M721M") {}

    function mintToken(address to, uint256 tokenId, string calldata tokenURI) external {
        _mint(to, tokenId);
        _setTokenURI(tokenId, tokenURI);
    }

    function setTokenURI(uint256 tokenId, string calldata tokenURI) internal {
        _tokensURIs[tokenId] = tokenURI;
    }

    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        return _tokensURIs[tokenId];
    }

}