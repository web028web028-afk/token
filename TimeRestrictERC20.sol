// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TimeRestrictERC20 is ERC20 {
    constructor() ERC20("TimeRestrict", "TIME2") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        require(block.timestamp % 2 == 0,"Time odd");
        return super.transfer(to,amt);
    }
}
