// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract EmergencyMintStopERC20 is ERC20, Ownable {
    bool public mintEnabled = true;
    constructor() ERC20("EmergencyMintStop", "EMS") {}
    function toggleMint(bool val) public onlyOwner { mintEnabled = val; }
    function mint(uint256 amt) public {
        require(mintEnabled, "Mint disabled");
        _mint(msg.sender, amt);
    }
}
