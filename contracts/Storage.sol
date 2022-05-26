// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;


contract SlowStorage {

    struct Data {
        string fileName;
        string fileType;
    }

    mapping (string => Data) dataBase;

    function storeData(string memory _cidIpfs, string memory _fileName, string memory _fileType) public {

        Data memory currentData = Data({
            fileName: _fileName,
            fileType: _fileType
        });

         dataBase[_cidIpfs] = currentData;
    }

    function getData(string memory _cid) public view returns (Data memory) {
        return dataBase[_cid];
    }
}