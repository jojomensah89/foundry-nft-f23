// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MoodNft} from "../src/MoodNft.sol";
import {Script} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    MoodNft moodNft;

    function run() external returns (MoodNft) {
        vm.startBroadcast();
        moodNft = new MoodNft();
        vm.stopBroadcast();

        return (moodNft);
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));

        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
