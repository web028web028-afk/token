// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AddressTagERC20 is ERC20 {
    mapping(address=>string)public tag;
    constructor() ERC20("AddressTag", "TAG") {_mint(msg.sender,1000000 ether);}
    function setTag(string calldata t)public{tag[msg.sender]=t;}
}
