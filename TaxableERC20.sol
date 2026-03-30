// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TaxableERC20 is ERC20 {
    uint256 public taxRate = 1; // 1%

    constructor() ERC20("Tax Token", "TAX") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        uint256 tax = (amount * taxRate) / 100;
        uint256 sendAmount = amount - tax;
        _transfer(msg.sender, to, sendAmount);
        _transfer(msg.sender, address(this), tax);
        return true;
    }
}