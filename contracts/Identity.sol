pragma solidity 0.8;

contract Identity {
    struct User {
        string name;
        address walletAddress;
        bytes32 biometricData;  //store hashhash of biometric data  
    }

    mapping (address => User) public users;

    function registerUser() {
        public 
        returns (bool sucess) {
            require(_name != "", "Name cannot be empty ");

            if (users[_walletAddress].exist()) {
                return false //user already exists 
            }

            User storage user = user[_walletAddress];
            user.name = _name;
            user.walletAddredd = _walletAddress;

        }

    }
}