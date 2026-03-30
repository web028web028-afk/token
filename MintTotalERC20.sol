// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MintTotalERC20 is ERC20 {
    uint256 public totalMinted;
    constructor() ERC20("MintTotal", "MTOT") {}
    function mint(uint256 a)public{
        totalMinted+=a;
        _mint(msg.sender,a);
    }
}
