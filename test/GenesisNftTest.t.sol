// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {DeployGenesisNft} from "../script/DeployGenesisNft.s.sol";
import {GenesisNft} from "../src/GenesisNft.sol";

contract GenesisNfttest is Test {
    GenesisNft public genesisNft;
    DeployGenesisNft deployer;
    address public USER = makeAddr("user");
    uint256 STARTING_BALANCE = 100 ether;
    string public TOKEN_URI = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function setUp() public {
        deployer = new DeployGenesisNft();
        genesisNft = deployer.run();
    }

    function testNameIsCorrect() public {
        bytes32 expectedName = keccak256(abi.encodePacked("Doggie Inu"));
        bytes32 actualName = keccak256(abi.encodePacked(genesisNft.name()));

        // console.log(expectedName);
        // console.log(actualName);
        assertEq(expectedName, actualName);
    }

    function testCanMintAndHaveABalance() public {
        console.log(STARTING_BALANCE);
        vm.prank(USER);
        vm.deal(USER, STARTING_BALANCE);
        genesisNft.mintNft(TOKEN_URI);

        console.log("tokenUri param:", TOKEN_URI);
        console.log("Nft uri:", genesisNft.tokenURI(0));
        assert(genesisNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(TOKEN_URI)) == keccak256(abi.encodePacked(genesisNft.tokenURI(0))));
    }
}
