// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleDividendERC20 is ERC20 {
    constructor() ERC20("DividendToken","DIV"){_mint(msg.sender,1000000 ether);}
    function distribute() public {
        _mint(msg.sender, totalSupply()/1000);
    }
}
