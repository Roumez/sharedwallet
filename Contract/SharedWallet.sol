// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SharedWallet {

// Mapping from account addresses to current balance.
mapping (address => uint256) private _balances;
// Mapping from account addresses to a mapping of spender addresses to an amount of allowance.
mapping (address => mapping (address => uint256)) private _allowances;
// Address our owner.
address owner;

constructor() {
    owner = msg.sender;
}

modifier onlyOwner() {
    require(msg.sender == owner, "You are not allowed");
    _;
}

receive() external payable {

}

function withdrawMoney(address payable _to, uint _amount) public onlyOwner {
    _to.transfer(_amount);

}
}
