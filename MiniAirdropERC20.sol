// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract MiniAirdropERC20 is ERC20 {
    constructor() ERC20("MiniAirdrop", "MAD") {_mint(msg.sender,1000000 ether);}
    function airdropSingle(address to)public{
        transfer(to,10 ether);
    }
}
