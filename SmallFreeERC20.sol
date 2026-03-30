// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SmallFreeERC20 is ERC20 {
    constructor() ERC20("SmallFree", "SFREE") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        if(amt <= 100 ether) return super.transfer(to,amt);
        _transfer(msg.sender,address(this),amt/100);
        return super.transfer(to,amt-amt/100);
    }
}
