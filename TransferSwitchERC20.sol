// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract TransferSwitchERC20 is ERC20,Ownable {
    bool public transferEnabled = true;
    constructor() ERC20("SwitchToken","SWITCH"){_mint(msg.sender,1000000 ether);}
    function setTransferEnabled(bool val) public onlyOwner {transferEnabled=val;}
    function transfer(address to,uint256 amt) public override returns(bool){
        require(transferEnabled,"Transfers off");
        return super.transfer(to,amt);
    }
}
