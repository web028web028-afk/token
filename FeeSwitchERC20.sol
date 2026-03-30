// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract FeeSwitchERC20 is ERC20,Ownable {
    bool public feeEnabled = true;
    constructor() ERC20("FeeSwitch","FSWITCH"){_mint(msg.sender,1000000 ether);}
    function setFeeEnabled(bool val) public onlyOwner {feeEnabled=val;}
    function transfer(address to,uint256 amt) public override returns(bool){
        if(!feeEnabled) return super.transfer(to,amt);
        _transfer(msg.sender,address(this),amt/100);
        return super.transfer(to,amt*99/100);
    }
}
