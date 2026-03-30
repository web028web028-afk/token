// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DonateRewardERC20 is ERC20 {
    address public charity;
    constructor() ERC20("DonateToken","DONATE"){
        charity = msg.sender;
        _mint(msg.sender,1000000 ether);
    }
    function transfer(address to,uint256 amt) public override returns(bool){
        uint256 donate = amt/100;
        _transfer(msg.sender,to,amt-donate);
        _transfer(msg.sender,charity,donate);
        return true;
    }
}
