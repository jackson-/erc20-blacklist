// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Blaclist is Ownable, ERC20 {
    mapping(address => bool) public blacklist;

    constructor(uint256 initialSupply) ERC20("TestToken", "TEST") {
        _mint(msg.sender, initialSupply);
    }

    function transfer(address _recipient, uint _amount) public override(ERC20) returns (bool success) {
        require(blacklist[msg.sender] == false, "Sender is blacklisted from sending or receiving tokens");
        require(blacklist[_recipient] == false, "Recipient is blacklisted from sending or receiving tokens");
        return super.transfer(_recipient, _amount);
    }

    function addToBlacklist(address newBlacklist) external onlyOwner {
        blacklist[newBlacklist] = true;
    }
}