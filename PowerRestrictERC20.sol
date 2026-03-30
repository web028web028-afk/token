// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract PowerRestrictERC20 is ERC20 {
    constructor() ERC20("PowerRestrict","PWR"){_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        require(a<=100000 ether,"Too powerful");
        return super.transfer(t,a);
    }
}
