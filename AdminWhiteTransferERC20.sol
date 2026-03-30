// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract AdminWhiteTransferERC20 is ERC20,Ownable {
    mapping(address=>bool)public canSend;
    constructor() ERC20("AdminWhiteTransfer","AWT"){_mint(msg.sender,1000000 ether);}
    function allowSend(address a,bool v)public onlyOwner{canSend[a]=v;}
    function transfer(address t,uint256 a)public override returns(bool){
        require(canSend[msg.sender],"Not allowed");
        return super.transfer(t,a);
    }
}
