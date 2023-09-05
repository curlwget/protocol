// SPDX-License-Identifier: GPL-3.0

/*
    This file is part of the Enzyme Protocol.

    (c) Enzyme Council <council@enzyme.finance>

    For the full license information, please view the LICENSE
    file that was distributed with this source code.
*/

pragma solidity >=0.6.0 <0.9.0;
pragma experimental ABIEncoderV2;

/// @title IStakingWrapper interface
/// @author Enzyme Council <security@enzyme.finance>
interface IStakingWrapper {
    struct TotalHarvestData {
        uint128 integral;
        uint128 lastCheckpointBalance;
    }

    struct UserHarvestData {
        uint128 integral;
        uint128 claimableReward;
    }

    function claimRewardsFor(address _for)
        external
        returns (address[] memory rewardTokens_, uint256[] memory claimedAmounts_);

    function claimRewardsForWithoutCheckpoint(address _for)
        external
        returns (address[] memory rewardTokens_, uint256[] memory claimedAmounts_);

    function depositTo(address _to, uint256 _amount) external;

    function togglePause(bool _isPaused) external;

    function withdrawTo(address _to, uint256 _amount) external;

    function withdrawToOnBehalf(address _onBehalf, address _to, uint256 _amount) external;

    function withdrawToWithoutCheckpoint(address _to, uint256 _amount) external;

    // STATE GETTERS

    function getRewardTokenAtIndex(uint256 _index) external view returns (address rewardToken_);

    function getRewardTokenCount() external view returns (uint256 count_);

    function getRewardTokens() external view returns (address[] memory rewardTokens_);

    function getTotalHarvestDataForRewardToken(address _rewardToken)
        external
        view
        returns (TotalHarvestData memory totalHarvestData_);

    function getUserHarvestDataForRewardToken(address _user, address _rewardToken)
        external
        view
        returns (UserHarvestData memory userHarvestData_);

    function isPaused() external view returns (bool isPaused_);
}
