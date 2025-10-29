// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HybridVoting {
    address public admin;
    bool public votingOpen;
    uint public ballotsCount;

    // store minimal audit info: ballotHash => recorded
    mapping(bytes32 => bool) public recorded;
    event BallotRecorded(address indexed voter, bytes32 ballotHash, uint indexed index);

    modifier onlyAdmin() {
        require(msg.sender == admin, "admin only");
        _;
    }

    constructor() {
        admin = msg.sender;
        votingOpen = false;
        ballotsCount = 0;
    }

    function openVoting() external onlyAdmin {
        votingOpen = true;
    }

    function closeVoting() external onlyAdmin {
        votingOpen = false;
    }

    // record ballot hash on chain
    function recordVote(bytes32 ballotHash) external {
        require(votingOpen, "voting closed");
        require(!recorded[ballotHash], "already recorded"); // prevents identical duplicate hash records
        recorded[ballotHash] = true;
        ballotsCount++;
        emit BallotRecorded(msg.sender, ballotHash, ballotsCount);
    }
}
