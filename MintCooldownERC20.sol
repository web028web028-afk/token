// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MintCooldownERC20 is ERC20 {
    mapping(address=>uint256) public lastMint;
    uint256 public interval = 1 hours;
    constructor() ERC20("MintCool","MCOOL"){}
    function mint() external {
        require(block.timestamp >= lastMint[msg.sender]+interval,"Wait");
        lastMint[msg.sender] = block.timestamp;
        _mint(msg.sender,50 ether);
    }
}
