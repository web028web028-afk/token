// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WhitelistERC20 is ERC20, Ownable {
    mapping(address => bool) public whitelist;

    constructor() ERC20("Whitelist Token", "WHITE") {
        _mint(msg.sender, 1000000 * 10**decimals());
        whitelist[msg.sender] = true;
    }

    function addWhitelist(address account) public onlyOwner {
        whitelist[account] = true;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(whitelist[msg.sender], "Not whitelisted");
        return super.transfer(to, amount);
    }
}