// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/Test.sol";

import {HelloEthernaut} from "../src/HelloEthernaut.sol";

contract HelloEthernautSolution is Script {
    HelloEthernaut instance =
        HelloEthernaut(0x5435F660038072827651763A56259f13319BFbD9); // paste instance address

    function run() external {
        string memory password = instance.password();
        vm.startBroadcast();
        instance.authenticate(password);
        vm.stopBroadcast();
    }
}
