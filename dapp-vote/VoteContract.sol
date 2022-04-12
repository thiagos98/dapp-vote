// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VoteContract {
    struct Candidate {
        string name;
        uint numberVotes;
    }

    mapping (address => Candidate) candidates;
    address[] listCandidates;
    
    function Vote(address _address) public {
        candidates[_address].numberVotes++;
    }

    function SetCandidate(address _address, string memory _name) public {
        Candidate memory candidate;

        candidate.name = _name;
        candidate.numberVotes = 0;

        candidates[_address] = candidate;
        listCandidates.push(_address);
    }

    function GetCandidates() view public returns(address[] memory) {
        return listCandidates;
    }

    function GetCandidate(address _address) view public returns (string memory name, uint numberVotes){
        Candidate memory candidate = candidates[_address];

        return (candidate.name, candidate.numberVotes);
    }

    function TotalCandidates() view public returns (uint) {
        return listCandidates.length;
    }
    
}