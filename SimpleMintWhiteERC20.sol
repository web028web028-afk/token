// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract SimpleMintWhiteERC20 is ERC20 {
    mapping(address=>bool)public allowed;
    constructor() ERC20("SimpleMintWhite","SMW"){allowed[msg.sender]=true;}
    function mint(uint256 a)public{
        require(allowed[msg.sender]);
        _mint(msg.sender,a);
    }
}
