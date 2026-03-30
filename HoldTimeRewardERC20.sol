// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract HoldTimeRewardERC20 is ERC20 {
    mapping(address=>uint256)public holdStart;
    constructor() ERC20("HoldTimeReward","HTR"){_mint(msg.sender,1000000 ether);}
    function claim()public{
        uint256 timeHeld = block.timestamp-holdStart[msg.sender];
        if(timeHeld>1 days)_mint(msg.sender,100 ether);
    }
}
