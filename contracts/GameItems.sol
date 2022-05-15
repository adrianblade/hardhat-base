pragma solidity ^0.8.7;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract GameItems is ERC1155 {
    uint public constant CHARIZARD = 0;
    uint public constant IVYSAUR = 1;
    uint public constant VENASAUR = 2;
    uint public constant CHARMANDER = 3;

    constructor() public ERC1155("https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/{id}.json") {
        _mint(msg.sender, CHARIZARD, 10, "");
        _mint(msg.sender, IVYSAUR, 10, "");
        _mint(msg.sender, VENASAUR, 10, "");
        _mint(msg.sender, CHARMANDER, 10, "");
    }

    function uri(uint _tokenId) override public view returns(string memory) {
        return string(
            abi.encodePacked(
                "https://bafybeihul6zsmbzyrgmjth3ynkmchepyvyhcwecn2yxc57ppqgpvr35zsq.ipfs.dweb.link/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    }

}