// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Identity is MerkleTree {
    struct User {
        string name;
        address walletAddress;
        bytes32 biometricData;  // Hashed biometric data
    }

    mapping(address => User) public users;

    event UserRegistered(address indexed walletAddress, string name);
    event UserAccessed(address indexed walletAddress, string action);

    function registeredUser(
        string memory _name,
        bytes32 _hashedBiometricData
    ) external returns (bool) {
        require(bytes(_name).length > 0, "Name cannot be empty");
        require(users[msg.sender].walletAddress == address(0), "User already have a wallet address");

        //register user
        users[msg.sender] = User({
            name: _name,
            walletAddress: msg.sender,
            biometricData: _hashedBiometricData
        });

        //Add hashed biometric data to MerkleTree
        addEntry(_hahshedBiometricData);

        emit UserRegistered(msg.sender, _name);
        return true;
    }

    function redUserBiometric(addresss _walletAddress) external view returns (bytes32) {
        User memory user = users[_walletAddress];
        require(user.walletAddress != address(0), "user does not exist");

        emit UserAccessed(_walletAddress, "Read");
        return user.biometricData;
    }
}