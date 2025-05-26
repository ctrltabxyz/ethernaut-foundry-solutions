// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";

import {HelloEthernaut} from "../src/HelloEthernaut.sol";

contract HelloEthernautTest is Test {
    HelloEthernaut instance;

    function setUp() public {
        vm.startBroadcast();
        instance = new HelloEthernaut("some_password");
        vm.stopBroadcast();
    }

    function test_HelloEthernautSolution() public {
        bool isClearedBefore = instance.getCleared();

        vm.startBroadcast();
        instance.authenticate(instance.password());
        vm.stopBroadcast();

        bool isClearedAfter = instance.getCleared();

        assertTrue(!isClearedBefore);
        assertTrue(isClearedAfter);
    }
}
