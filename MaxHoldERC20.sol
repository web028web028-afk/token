// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MaxHoldERC20 is ERC20 {
    uint256 public maxHold = 100000 * 10**decimals();

    constructor() ERC20("MaxHold Token", "MAX") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(balanceOf(to) + amount <= maxHold, "Exceed max hold");
        return super.transfer(to, amount);
    }
}