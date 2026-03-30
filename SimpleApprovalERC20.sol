// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleApprovalERC20 is ERC20 {
    constructor() ERC20("SimpleApprove","SAPP"){_mint(msg.sender,1000000 ether);}
    function approveMax(address spender) external {
        _approve(msg.sender,spender,type(uint256).max);
    }
}
