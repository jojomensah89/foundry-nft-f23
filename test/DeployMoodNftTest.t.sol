// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";

import {MoodNft} from "../src/MoodNft.sol";
import {DeployMoodNft} from "../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployMoodNft;
    MoodNft moodNft;

    function setUp() public {
        DeployMoodNft deployer = new DeployMoodNft();
        moodNft = deployer.run();
    }
}
