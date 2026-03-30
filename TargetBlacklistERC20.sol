// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract TargetBlacklistERC20 is ERC20,Ownable {
    mapping(address=>bool)public deny;
    constructor() ERC20("TargetBlacklist","TBL2"){_mint(msg.sender,1000000 ether);}
    function denyTarget(address a,bool v)public onlyOwner{deny[a]=v;}
    function transfer(address t,uint256 a)public override returns(bool){
        require(!deny[t]);
        return super.transfer(t,a);
    }
}
