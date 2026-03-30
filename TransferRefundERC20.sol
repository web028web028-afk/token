// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TransferRefundERC20 is ERC20 {
    constructor() ERC20("TransferRefund", "REFUND") {_mint(msg.sender,1000000 ether);}
    function safeTransfer(address t,uint256 a)public returns(bool){
        (bool s)=transfer(t,a);
        if(!s)transfer(msg.sender,a);
        return s;
    }
}
