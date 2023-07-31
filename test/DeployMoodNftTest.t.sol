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

    function testConvertSvgToUri() public {
        //         string memory expectedUri = 'data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkdGg9IjQwMCIgIGhlaWdodD0iNDAwIiB4bWxu
        // cz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPgogIDxjaXJjbGUgY3g9IjEwMCIgY3k9IjEw
        // MCIgZmlsbD0ieWVsbG93IiByPSI3OCIgc3Ryb2tlPSJibGFjayIgc3Ryb2tlLXdpZHRoPSIzIi8+
        // CiAgPGcgY2xhc3M9ImV5ZXMiPgogICAgPGNpcmNsZSBjeD0iNjEiIGN5PSI4MiIgcj0iMTIiLz4K
        // ICAgIDxjaXJjbGUgY3g9IjEyNyIgY3k9IjgyIiByPSIxMiIvPgogIDwvZz4KICA8cGF0aCBkPSJt
        // MTM2LjgxIDExNi41M2MuNjkgMjYuMTctNjQuMTEgNDItODEuNTItLjczIiBzdHlsZT0iZmlsbDpu
        // b25lOyBzdHJva2U6IGJsYWNrOyBzdHJva2Utd2lkdGg6IDM7Ii8+Cjwvc3ZnPg==';
        // string memory svg = '<svg viewBox="0 0 200 200" width="400"  height="400" xmlns="http://www.w3.org/2000/svg">
        //   <circle cx="100" cy="100" fill="yellow" r="78" stroke="black" stroke-width="3"/>
        //   <g class="eyes">
        //     <circle cx="61" cy="82" r="12"/>
        //     <circle cx="127" cy="82" r="12"/>
        //   </g>
        //   <path d="m136.81 116.53c.69 26.17-64.11 42-81.52-.73" style="fill:none; stroke: black; stroke-width: 3;"/>
        // </svg>';
        // string memory actualUri =deployer.svgToImageURI(svg);
        // assert(keccak256(abi.encodePacked(actualUri)) === keccak256(abi.encodePacked(expectedUri)) );
    }
}
