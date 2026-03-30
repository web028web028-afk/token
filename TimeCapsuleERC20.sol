// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TimeCapsuleERC20 is ERC20 {
    mapping(address => uint256) public capsuleTime;
    mapping(address => string) public capsuleMessage;

    constructor() ERC20("TimeCapsule", "CAPSULE") {
        _mint(msg.sender, 1000000 ether);
    }

    // 设置时间胶囊（锁定+留言）
    function setCapsule(string calldata message) external {
        capsuleTime[msg.sender] = block.timestamp + 30 days;
        capsuleMessage[msg.sender] = message;
    }

    // 解锁时间胶囊
    function unlockCapsule() external {
        require(block.timestamp >= capsuleTime[msg.sender], "Locked");
        capsuleTime[msg.sender] = 0;
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(capsuleTime[msg.sender] == 0, "Account locked");
        return super.transfer(to, amount);
    }
}
