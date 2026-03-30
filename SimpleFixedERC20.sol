// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleFixedERC20 is ERC20 {
    constructor() ERC20("SimpleFixed","SFIX"){
        _mint(msg.sender, 21000000 ether);
    }
}
