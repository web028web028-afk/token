// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ManualBurnERC20 is ERC20 {
    constructor() ERC20("ManualBurn","MBURN"){_mint(msg.sender,1000000 ether);}
    function burn(uint256 amt) public {
        _burn(msg.sender,amt);
    }
}
