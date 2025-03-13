// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Web3Auth {
    struct User {
        address wallet;
        string ens;
        uint256 createdAt;
    }

    mapping(address => User) public users;
    event UserRegistered(address indexed wallet, string ens, uint256 timestamp);

    // Register a new user
    function registerUser(string memory _ens) public {
        require(users[msg.sender].wallet == address(0), "User already registered");
        users[msg.sender] = User({wallet: msg.sender, ens: _ens, createdAt: block.timestamp});
        emit UserRegistered(msg.sender, _ens, block.timestamp);
    }

    // Check if a user is registered
    function isUserRegistered(address _wallet) public view returns (bool) {
        return users[_wallet].wallet != address(0);
    }

    // Get user details
    function getUser(address _wallet) public view returns (User memory) {
        require(users[_wallet].wallet != address(0), "User not found");
        return users[_wallet];
    }
}
