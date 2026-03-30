// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract AutoBurnPoolERC20 is ERC20 {
    constructor() ERC20("AutoBurnPool", "ABP") {_mint(msg.sender,1000000 ether);}
    function burnPool()public{
        _burn(address(this),balanceOf(address(this)));
    }
}
