require! {
    \./velas-web3.ls
    \./addresses.ls
}
abis =
    Staking      : require("./contracts/StakingAuRa.json").abi
    ValidatorSet : require("./contracts/ValidatorSetAuRa.json").abi
    BlockReward  : require("./contracts/BlockRewardAuRa.json").abi
    Upgrade      : require("./contracts/AdminUpgradeabilityProxy.json").abi
module.exports = (store)->
    web3 = velas-web3 store
    api =
        Staking      : web3.eth.contract(abis.Staking).at(addresses.Staking)
        ValidatorSet : web3.eth.contract(abis.ValidatorSet).at(addresses.ValidatorSet)
        BlockReward  : web3.eth.contract(abis.BlockReward).at(addresses.BlockReward)
        Upgrade      : web3.eth.contract(abis.Upgrade).at(addresses.Upgrade)
        web3         : web3.eth
    api