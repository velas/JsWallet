require! {
    \./velas-web3.ls : web3
}
abis =
    Staking      : require("./contracts/StakingAuRa.json").abi
    ValidatorSet : require("./contracts/ValidatorSetAuRa.json").abi
    BlockReward  : require("./contracts/BlockRewardAuRa.json").abi
    Upgrade      : require("./contracts/AdminUpgradeabilityProxy.json").abi
addresses =
    Staking      : "0x1100000000000000000000000000000000000001"
    ValidatorSet : "0x1000000000000000000000000000000000000001"
    BlockReward  : "0x2000000000000000000000000000000000000001"
    Upgrade      : "0x4000000000000000000000000000000000000001"
contracts =
    Staking      : web3.eth.contract(abis.Staking).at(addresses.Staking)
    ValidatorSet : web3.eth.contract(abis.ValidatorSet).at(addresses.ValidatorSet)
    BlockReward  : web3.eth.contract(abis.BlockReward).at(addresses.BlockReward)
    Upgrade      : web3.eth.contract(abis.Upgrade).at(addresses.Upgrade)
module.exports = contracts