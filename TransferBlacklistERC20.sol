// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract TransferBlacklistERC20 is ERC20,Ownable {
    mapping(address=>bool)public black;
    constructor() ERC20("TransferBlacklist","TBL"){_mint(msg.sender,1000000 ether);}
    function setBlack(address a,bool v)public onlyOwner{black[a]=v;}
    function _transfer(address f,address t,uint256 a)internal override{
        require(!black[f]&&!black[t],"Black");
        super._transfer(f,t,a);
    }
}
