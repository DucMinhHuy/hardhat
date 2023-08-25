//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Floppy is 
    ERC20,
    ERC20Burnable,
    Ownable
{
    uint256 private cap = 50_000_000_000 * 10**18;
    constructor() ERC20("Floppy","FLP") {
        _mint(msg.sender, cap);
        transferOwnership(msg.sender);
    }
    function mint (address to, uint256 amount) public onlyOwner {
        require(
            ERC20.totalSupply() + amount <= cap,
            "Floppy: cap exceeded"
        );
        _mint(to,amount);
    }
}
