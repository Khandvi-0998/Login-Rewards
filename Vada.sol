// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DailyLoginReward {
    mapping(address => uint256) public lastClaimed;
    mapping(address => uint256) public rewards;
    uint256 public rewardAmount = 10;

    function claimReward() public {
        uint256 today = block.timestamp / 1 days;
        require(lastClaimed[msg.sender] < today, "Reward already claimed today");

        lastClaimed[msg.sender] = today;
        rewards[msg.sender] += rewardAmount;
    }

    function getRewardBalance() public view returns (uint256) {
        return rewards[msg.sender];
    }
}
