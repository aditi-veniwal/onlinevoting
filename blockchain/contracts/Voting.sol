// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    address public admin;
    mapping(string => uint256) public votes;
    mapping(address => bool) public hasVoted;

    constructor() {
        admin = msg.sender;
    }

    function vote(string memory candidate) public {
        require(!hasVoted[msg.sender], "Already voted");
        votes[candidate] += 1;
        hasVoted[msg.sender] = true;
    }

    function getVotes(string memory candidate) public view returns (uint256) {
        return votes[candidate];
    }
}
