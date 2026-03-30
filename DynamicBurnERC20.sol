// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DynamicBurnERC20 is ERC20 {
    constructor() ERC20("DynamicBurn", "DYNBURN") {_mint(msg.sender,1000000 ether);}
    function transfer(address t,uint256 a)public override returns(bool){
        uint256 rate = totalSupply() > 1000000 ether ? 1 : 0;
        _burn(msg.sender,a*rate/100);
        return super.transfer(t,a);
    }
}
