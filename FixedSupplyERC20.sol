// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract FixedSupplyERC20 is ERC20 {
    constructor() ERC20("Fixed Supply Token", "FIXED") {
        _mint(msg.sender, 21000000 * 10**decimals());
    }
}