// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {MoodNft} from "../src/MoodNft.sol";
import {Script, console} from "forge-std/Script.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    MoodNft moodNft;

    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/sad.svg");
        string memory happySvg = vm.readFile("./images/happy.svg");
        // console.log(sadSvg,happySvg);
        vm.startBroadcast();
        moodNft = new MoodNft(svgToImageURI(sadSvg),svgToImageURI(happySvg));
        vm.stopBroadcast();

        return (moodNft);
    }

    function svgToImageURI(string memory svg) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(bytes(string(abi.encodePacked(svg))));
        // concat baseURL and base64 encoded svg
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
