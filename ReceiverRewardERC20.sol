// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ReceiverRewardERC20 is ERC20 {
    constructor() ERC20("ReceiverReward", "RR") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        _mint(to,amt/200);
        return super.transfer(to,amt);
    }
}
