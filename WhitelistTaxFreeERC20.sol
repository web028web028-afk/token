// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract WhitelistTaxFreeERC20 is ERC20,Ownable {
    mapping(address=>bool) public taxFree;
    uint256 public tax = 1;
    constructor() ERC20("TaxFreeWhite","TFW"){
        taxFree[msg.sender]=true;
        _mint(msg.sender,1000000 ether);
    }
    function setTaxFree(address acc,bool val) public onlyOwner {taxFree[acc]=val;}
    function transfer(address to,uint256 amt) public override returns(bool){
        if(taxFree[msg.sender]) return super.transfer(to,amt);
        uint256 fee = amt*tax/100;
        _transfer(msg.sender,to,amt-fee);
        _transfer(msg.sender,address(this),fee);
        return true;
    }
}
