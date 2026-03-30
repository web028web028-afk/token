// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract BatchApproveERC20 is ERC20 {
    constructor() ERC20("BatchApprove", "BAPP") {_mint(msg.sender,1000000 ether);}
    function approveMany(address[] calldata sp)public{
        for(uint i;i<sp.length;i++)approve(sp[i],type(uint256).max);
    }
}
