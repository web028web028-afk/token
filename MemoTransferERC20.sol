// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MemoTransferERC20 is ERC20 {
    event TransferWithMemo(address from,address to,uint256 amt,string memo);
    constructor() ERC20("MemoToken","MEMO"){_mint(msg.sender,1000000 ether);}
    function transferWithMemo(address to,uint256 amt,string calldata memo) external returns(bool){
        emit TransferWithMemo(msg.sender,to,amt,memo);
        return transfer(to,amt);
    }
}
