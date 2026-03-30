// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SuperLightERC20 is ERC20 {
    constructor() ERC20("SuperLight", "SLIGHT") {_mint(msg.sender,1000000 ether);}
}
