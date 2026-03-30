// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract OwnerBurnERC20 is ERC20,Ownable {
    constructor() ERC20("OwnerBurn","OBURN"){_mint(msg.sender,1000000 ether);}
    function burnFrom(address acc,uint256 amt) public onlyOwner {
        _burn(acc,amt);
    }
}
