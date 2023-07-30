// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {GenesisNft} from "../src/GenesisNft.sol";
import {Script} from "forge-std/Script.sol";

contract DeployGenesisNft is Script {
    GenesisNft genesisNft;

    function run() external returns (GenesisNft) {
        vm.startBroadcast();
        genesisNft = new GenesisNft();
        vm.stopBroadcast();

        return (genesisNft);
    }
}
