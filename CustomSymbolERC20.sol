// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract CustomSymbolERC20 is ERC20 {
    constructor() ERC20("CustomSymbol", "CUST") {_mint(msg.sender,500000 ether);}
}
