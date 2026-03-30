// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TransferCountERC20 is ERC20 {
    uint256 public transferCount;
    constructor() ERC20("CountToken","COUNT"){_mint(msg.sender,1000000 ether);}
    function transfer(address to,uint256 amt) public override returns(bool){
        transferCount++;
        return super.transfer(to,amt);
    }
}
