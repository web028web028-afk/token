// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract ThreeSigERC20 is ERC20 {
    address[3]public admins;
    constructor() ERC20("ThreeSig", "3SIG") {
        admins[0]=msg.sender;
        _mint(msg.sender,1000000 ether);
    }
    function mint(uint256 a)public{
        bool isAdmin;
        for(uint i;i<3;i++)if(admins[i]==msg.sender)isAdmin=true;
        require(isAdmin);
        _mint(msg.sender,a);
    }
}
