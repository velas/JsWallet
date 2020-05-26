require! {
    \./velas-web3.ls : web3
    \./addresses.ls
}
abis =
    Staking      : require("./contracts/StakingAuRa.json").abi
    ValidatorSet : require("./contracts/ValidatorSetAuRa.json").abi
    BlockReward  : require("./contracts/BlockRewardAuRa.json").abi
    Upgrade      : require("./contracts/AdminUpgradeabilityProxy.json").abi
contracts =
    Staking      : web3.eth.contract(abis.Staking).at(addresses.Staking)
    ValidatorSet : web3.eth.contract(abis.ValidatorSet).at(addresses.ValidatorSet)
    BlockReward  : web3.eth.contract(abis.BlockReward).at(addresses.BlockReward)
    Upgrade      : web3.eth.contract(abis.Upgrade).at(addresses.Upgrade)
    web3         : web3.eth
module.exports = contracts