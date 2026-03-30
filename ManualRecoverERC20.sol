// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
contract ManualRecoverERC20 is ERC20,Ownable {
    constructor() ERC20("ManualRecover", "MREC") {_mint(msg.sender,1000000 ether);}
    function recoverWrongToken(address token,uint256 amt)public onlyOwner{
        IERC20(token).transfer(owner(),amt);
    }
}
