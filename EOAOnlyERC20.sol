// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract EOAOnlyERC20 is ERC20 {
    constructor() ERC20("EOAOnly", "EOA") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        require(tx.origin == msg.sender, "Only wallet");
        return super.transfer(to,amt);
    }
}
