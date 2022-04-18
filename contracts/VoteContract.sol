// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract VoteContract {
    address internal owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
    
    struct Candidate {
        address add;
        string name;
        uint numberVotes;
    }

    mapping (address => Candidate) candidates;
    Candidate[] listCandidates;
    address[] listAddressCandidates;
    
    function Vote(address _address) public {
        candidates[_address].numberVotes++;
        uint i;
        for(i = 0; i < listCandidates.length; i++) {
            if(_address == listCandidates[i].add) {
                listCandidates[i].numberVotes++;
            }
        }
    }

    function SetCandidate(address _address, string memory _name) external onlyOwner  {
        // uint i;
        // if(listAddressCandidates.length > 0) {
        //     for(i = 0; i < listAddressCandidates.length; i++) {
        //         require(_address != listAddressCandidates[i]);
        //     }
        // }
        
        Candidate memory candidate;

        candidate.add = _address;
        candidate.name = _name;
        candidate.numberVotes = 0;
    
        candidates[_address] = candidate;
        listCandidates.push(candidate);
        listAddressCandidates.push(_address);
    }

    function GetCandidates() view public returns(Candidate[] memory) {
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