// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MerkleTree {
    mapping(bytes32 => bool) public tree;

    function addEntry(bytes32 _entry) internal {
        require(!tree[_entry], "Duplicate entry in Merkle Root ");
        tree[_entry] = true;
        
    }
}