// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract TieredFeeERC20 is ERC20 {
    constructor() ERC20("TieredFee", "TFEE") {_mint(msg.sender,1000000 ether);}
    function transfer(address to, uint256 amt) public override returns(bool){
        uint256 fee = amt < 1000 ether ? 2 : 1;
        _transfer(msg.sender,address(this),amt*fee/100);
        return super.transfer(to,amt-amt*fee/100);
    }
}
