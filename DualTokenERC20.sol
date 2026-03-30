// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DualTokenERC20 is ERC20 {
    constructor() ERC20("DualToken", "DUAL") {_mint(msg.sender,1000000 ether);}
}
