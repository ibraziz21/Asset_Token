// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract AssetToken is ERC20 {
    //constructor sets the initial supply, name, symbol and decimal places
    constructor(uint _initialSupply) ERC20("Flappy Token","FPT"){
        _mint(msg.sender,_initialSupply);
    }
}