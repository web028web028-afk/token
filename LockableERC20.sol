// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LockableERC20 is ERC20 {
    mapping(address => uint256) public lockedBalance;

    constructor() ERC20("Lockable Token", "LOCK") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function lock(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Not enough balance");
        lockedBalance[msg.sender] += amount;
    }

    function unlock(uint256 amount) public {
        require(lockedBalance[msg.sender] >= amount, "Not enough locked");
        lockedBalance[msg.sender] -= amount;
    }
}