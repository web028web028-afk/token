// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract StakeBaseERC20 is ERC20 {
    mapping(address=>uint256) public staked;
    constructor() ERC20("StakeBase","STAKE"){_mint(msg.sender,1000000 ether);}
    function stake(uint256 amt) external {
        _transfer(msg.sender,address(this),amt);
        staked[msg.sender]+=amt;
    }
    function unstake(uint256 amt) external {
        require(staked[msg.sender]>=amt,"Insufficient");
        staked[msg.sender]-=amt;
        _transfer(address(this),msg.sender,amt);
    }
}
