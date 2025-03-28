// SPDX-License-Identifier: MIT
// Specifies the license type for the code (MIT License).

// Tells the Solidity compiler to compile only from version 0.8.13 and above.
pragma Solidity ^0.8.13;

// Importing the ConvertLib library, which provides utility functions like conversion.
import "./ConvertLib.sol";

// Defining the MetaCoin contract.
contract MetaCoin {
    // A mapping to store balances of each address (user).
    mapping(address => uint) balances;

    // Event to log when coins are transferred between addresses.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    // Constructor function, executed only once when the contract is deployed.
    // It initializes the deployer's balance to 10,000 coins.
    constructor() public {
        balances[tx.origin] = 10000;
    }

    // Function to send coins from the sender to a receiver.
    // Returns true if the transfer is successful, false otherwise.
    function sendCoin(
        address receiver,
        uint amount
    ) public returns (bool sufficient) {
        // Check if the sender has enough balance.
        if (balances[msg.sender] < amount) return false;

        // Deduct the amount from the sender's balance.
        balances[msg.sender] -= amount;

        // Add the amount to the receiver's balance.
        balances[receiver] += amount;

        // Emit the Transfer event to log the transaction.
        emit Transfer(msg.sender, receiver, amount);

        // Return true to indicate the transfer was successful.
        return true;
    }

    // Function to get the balance of an address in Ether (or a converted unit).
    // Uses the ConvertLib library for conversion.
    function getBalanceInEth(address addr) public view returns (uint) {
        return ConvertLib.convert(getBalance(addr), 2);
    }

    // Function to get the balance of an address in MetaCoin.
    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }
}
