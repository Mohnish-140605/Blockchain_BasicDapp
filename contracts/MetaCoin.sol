// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ConvertLib.sol";

contract MetaCoin {
    mapping(address => uint256) balances;

    constructor() {
        balances[msg.sender] = 10000;
    }

    function getBalance(address addr) public view returns (uint256) {
        return balances[addr];
    }

    function sendCoin(address receiver, uint256 amount) public returns (bool) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        return true;
    }

    function getBalanceInEth(address addr) public view returns (uint) {
        uint conversionRate = 2; // Example conversion rate
        return ConvertLib.convert(balances[addr], conversionRate);
    }
}
