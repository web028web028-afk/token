// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract CustomMintCapERC20 is ERC20,Ownable {
    uint256 public cap=2000000 ether;
    constructor() ERC20("CustomMintCap","CMC"){}
    function mint(uint256 a)public onlyOwner{
        require(totalSupply()+a<=cap);
        _mint(msg.sender,a);
    }
}
