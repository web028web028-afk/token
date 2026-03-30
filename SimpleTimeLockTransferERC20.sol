// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleTimeLockTransferERC20 is ERC20 {
    constructor() ERC20("SimpleTimeLockTransfer","STLT"){_mint(msg.sender,1000000 ether);}
    function transferAfter1Hour(address t,uint256 a)public{
        require(block.timestamp%3600==0);
        transfer(t,a);
    }
}
