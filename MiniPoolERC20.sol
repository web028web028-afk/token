// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MiniPoolERC20 is ERC20 {
    constructor() ERC20("MiniPool","MINIPOOL"){_mint(msg.sender,1000000 ether);}
    function addPoolFunds() public payable {}
    function withdrawPool() public onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
    }
}
