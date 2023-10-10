// SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

// Importing External Packages or Libraries
// Are typically installed via package managers like npm or imported from popular Solidity package repositories
import "openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyContractX is ERC20 {

    constructor() ERC20("MyToken", "MTK") {

    // Additional initialization logic...

    }

}