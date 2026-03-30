// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MemoStoreERC20 is ERC20 {
    mapping(uint256=>string)public memos;
    uint256 public idx;
    constructor() ERC20("MemoStore", "MEMO2") {_mint(msg.sender,1000000 ether);}
    function transferWithMemo(address t,uint256 a,string calldata m)external{
        transfer(t,a);
        memos[idx++]=m;
    }
}
