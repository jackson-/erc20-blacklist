# ERC20 Blacklist
This smart contract extends the OpenZeppelin ERC20 implementation to
only allow addresses that are not blacklisted to send and receive tokens.

## Extended functions

`transfer(address _recipient, uint _amount) public override(ERC20) returns (bool success) `

Does transfer using blacklist rules

`addToBlacklist(address newBlacklist) external onlyOwner`

Adds desired address to blacklist