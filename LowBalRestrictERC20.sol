// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract LowBalRestrictERC20 is ERC20 {
    constructor() ERC20("LowBalRestrict","LBR"){_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        require(balanceOf(msg.sender)>10 ether,"Low balance");
        return super.transfer(t,a);
    }
}
