// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MintableERC20 is ERC20 {
    address public minter;

    constructor() ERC20("Mintable Token", "MINT") {
        minter = msg.sender;
        _mint(msg.sender, 500000 * 10**decimals());
    }

    function mint(address to, uint256 amount) public {
        require(msg.sender == minter, "Not minter");
        _mint(to, amount);
    }
}