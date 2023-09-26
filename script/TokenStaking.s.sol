// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {TokenStaking} from "../src/TokenStaking.sol";
import {StakeToken} from "../src/StakeToken.sol";

contract DeployTokenStake is Script {
    function setUp() public {}

    function run() external returns (TokenStaking) {
        vm.startBroadcast();
        StakeToken stakeToken = new StakeToken();
        TokenStaking tokenStaking = new TokenStaking(address(stakeToken));

        vm.stopBroadcast();
        console2.log("tokenStaking address: ", address(tokenStaking));
        return tokenStaking;
    }
}
