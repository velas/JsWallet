require! {
    \./velas-web3.ls
    \./addresses.ls
}
abis =
    Staking      : require("./contracts/StakingAuRa.json").abi
    ValidatorSet : require("./contracts/ValidatorSetAuRa.json").abi
    BlockReward  : require("./contracts/BlockRewardAuRa.json").abi
    Development  : require("./contracts/VelasDevelopment.json").abi
    Resolver     : require("./contracts/LockupResolver.json").abi
    Timelock     : require("./contracts/LockupTimelock.json").abi    
module.exports = (store)->
    web3 = velas-web3 store
    Development-contract-address =
        if store.current.network is \testnet
            addresses.DevelopmentTest
        else
            addresses.Development
    api =
        Staking      : web3.eth.contract(abis.Staking).at(addresses.Staking)
        ValidatorSet : web3.eth.contract(abis.ValidatorSet).at(addresses.ValidatorSet)
        BlockReward  : web3.eth.contract(abis.BlockReward).at(addresses.BlockReward)
        Development  : web3.eth.contract(abis.Development).at(Development-contract-address)
        Resolver     : web3.eth.contract(abis.Resolver).at(addresses.ResolverAuRa)
        Timelock     : web3.eth.contract(abis.Timelock) 
        web3         : web3.eth
    api