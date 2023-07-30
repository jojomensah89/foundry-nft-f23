// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {GenesisNft} from "../src/GenesisNft.sol";
import {Script, console} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintGenesisNft is Script {
    string public TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        address mostRecentlydeployed = DevOpsTools.get_most_recent_deployment("GenesisNft", block.chainid);
        mintNftOnContract(mostRecentlydeployed);
        console.log(mostRecentlydeployed);
    }

    function mintNftOnContract(address contractAddress) public {
        vm.startBroadcast();
        GenesisNft(contractAddress).mintNft(TOKEN_URI);
        vm.stopBroadcast();
    }
}
