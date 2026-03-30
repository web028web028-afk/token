// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleStakeRewardERC20 is ERC20 {
    mapping(address=>uint256)public stake;
    constructor() ERC20("SimpleStakeReward","SSR"){_mint(msg.sender,1000000 ether);}
    function deposit(uint256 a)public{
        _transfer(msg.sender,address(this),a);
        stake[msg.sender]+=a;
    }
    function getReward()public{
        _mint(msg.sender,stake[msg.sender]/100);
    }
}
