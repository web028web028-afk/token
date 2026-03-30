// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract HoldRewardERC20 is ERC20 {
    constructor() ERC20("HoldReward","HOLD"){_mint(msg.sender,1000000 ether);}
    function claimReward() external {
        uint256 reward = balanceOf(msg.sender)/100;
        _mint(msg.sender,reward);
    }
}
