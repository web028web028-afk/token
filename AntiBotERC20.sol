// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AntiBotERC20 is ERC20, Ownable {
    mapping(address => bool) public blacklist;

    constructor() ERC20("AntiBot Token", "ANTIBOT") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function setBlacklist(address account, bool status) external onlyOwner {
        blacklist[account] = status;
    }

    function _transfer(address from, address to, uint256 amount) internal override {
        require(!blacklist[from] && !blacklist[to], "Blacklisted");
        super._transfer(from, to, amount);
    }
}
