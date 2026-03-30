// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TimeLockERC20 is ERC20 {
    mapping(address => uint256) public lockTime;

    constructor() ERC20("TimeLock Token", "TIME") {
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    // 锁定24小时
    function lockFor24Hours() external {
        lockTime[msg.sender] = block.timestamp + 24 hours;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(block.timestamp > lockTime[msg.sender], "Tokens locked");
        return super.transfer(to, amount);
    }
}
