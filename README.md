🏆 Daily Login Reward Smart Contract
A Solidity smart contract that rewards users with tokens for daily logins. Users can claim a reward once per day, ensuring engagement and retention in blockchain applications.

📜 Features
✅ Users can claim a fixed reward (10 tokens) per day.
✅ Ensures rewards can only be claimed once per day.
✅ Maintains a record of total rewards earned by each user.
✅ Provides a function to check accumulated rewards.

📄 Smart Contract Code
solidity
Copy
Edit
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
🛠 How It Works
A user calls claimReward().

The contract verifies if they have already claimed for the day.

If not, they receive 10 tokens, and the last claim timestamp is updated.

Users can call getRewardBalance() to check their accumulated rewards.

🚀 Deployment & Testing
Deployment
Deploy the contract using Remix IDE, Hardhat, or any Solidity-compatible blockchain environment.

Interact with the contract functions via the blockchain explorer or web3 interfaces.

Testing
Call claimReward() once per day and verify that rewards are credited.

Use getRewardBalance() to track earned rewards.

Ensure that calling claimReward() multiple times in a single day fails.

🔐 Security Considerations
⚠️ This contract does not use actual ERC-20 tokens but tracks rewards internally.
⚠️ To integrate real tokens, modify the contract to transfer ERC-20 tokens instead of just updating a balance.
⚠️ Ensure the contract is deployed on a trusted blockchain to prevent timestamp manipulation.

🔧 Future Enhancements
🚀 Integrate ERC-20 token transfers instead of internal balance tracking.
🚀 Dynamic reward system where users get increasing rewards for consecutive logins.
🚀 Admin-controlled settings to adjust reward amounts and claim intervals.

📍 Smart Contract Address
🔗 Contract Address: 0x039a5824b2C90f979E4cd7f1eBDEA87034f47fe7
