// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MultiSigERC20 is ERC20 {
    address public admin1;
    address public admin2;

    constructor() ERC20("MultiSig Token", "MULTI") {
        admin1 = msg.sender;
        admin2 = 0x1234567890000000000000000000000000000000;
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    function mint(address to, uint256 amount) external {
        require(msg.sender == admin1 || msg.sender == admin2, "Not admin");
        _mint(to, amount);
    }
}
