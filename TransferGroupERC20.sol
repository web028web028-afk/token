// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TransferGroupERC20 is ERC20 {
    constructor() ERC20("TransferGroup", "TG") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        require(amt%10 ether==0,"Must multiple 10");
        return super.transfer(to,amt);
    }
}
