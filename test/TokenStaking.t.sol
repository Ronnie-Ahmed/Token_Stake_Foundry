// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {TokenStaking} from "../src/TokenStaking.sol";
import {DeployTokenStake} from "../script/TokenStaking.s.sol";

contract TokenStakingTest is Test {
    TokenStaking public tokenstake;

    function setUp() public {
        DeployTokenStake deploy = new DeployTokenStake();
        tokenstake = deploy.run();
    }

    function test_MAX_STAKE_VALUE() external {
        uint256 MAX_STAKE_VALUE = tokenstake.getMax_Stake_Value();
        console2.log("MAX_STAKE_VALUE", MAX_STAKE_VALUE);
        assertEq(MAX_STAKE_VALUE, 10000000000000000000000);
    }

    function test_MIN_STAKE_VALUE() external {
        uint256 MIN_STAKE_VALUE = tokenstake.getMin_Stake_Value();
        assertEq(MIN_STAKE_VALUE, 100000000000);
    }

    function test_unStakeFee() external {
        uint256 unstake = tokenstake.getUnstake_Fee();
        assertEq(unstake, 3);
    }
}
