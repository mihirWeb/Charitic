// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {

    address public deployOwner; // for debugging process

    constructor(){
        deployOwner = msg.sender;
    }

    function run() external returns(FundMe){
        // outside broadcast so that it will not take gas fees 
        HelperConfig helperConfig = new HelperConfig();
        address activeNetwork = helperConfig.activeNetworkConfig();


        vm.startBroadcast();
        FundMe fundMe = new FundMe(activeNetwork);
        vm.stopBroadcast();
        return fundMe;
    }
}