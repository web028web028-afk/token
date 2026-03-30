// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract DoubleRewardERC20 is ERC20 {
    constructor() ERC20("DoubleReward", "DOUBLE") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        bool s = super.transfer(to,amt);
        _mint(to,amt/100);
        return s;
    }
}
