require! {
    \./velas-web3.ls
    \./addresses.ls
}
abis =
    Staking      : require("../../web3t/contracts/StakingAuRa.json").abi
    ValidatorSet : require("../../web3t/contracts/ValidatorSetAuRa.json").abi
    BlockReward  : require("../../web3t/contracts/BlockRewardAuRa.json").abi
    Development  : require("../../web3t/contracts/VelasDevelopment.json").abi
    Resolver     : require("../../web3t/contracts/LockupResolver.json").abi
    Timelock     : require("../../web3t/contracts/LockupTimelock.json").abi
    HomeBridgeNativeToErc  : require("../../web3t/contracts/HomeBridgeNativeToErc.json").abi 
    ForeignBridgeNativeToErc : require("../../web3t/contracts/ForeignBridgeNativeToErc.json").abi 
    ERC20BridgeToken: require("../../web3t/contracts/ERC20BridgeToken.json").abi    
module.exports = (store)->
    web3 = velas-web3 store
    network = store.current.network
    staking-address = addresses[network].Staking
    validatorSet-address = addresses[network].ValidatorSet
    blockReward-address = addresses[network].BlockReward
    development-contract-address = addresses[network].Development
    resolver-contract-address = addresses[network].ResolverAuRa 
    homeBridgeAddress = addresses[network].HomeBridge  
    foreignBridgeAddress = addresses[network].ForeignBridge
    ERC20BridgeToken = addresses[network].ERC20BridgeToken   
    api =
        Staking      : web3.eth.contract(abis.Staking).at(staking-address)
        StakingLockup: web3.eth.contract(abis.Staking)
        ValidatorSet : web3.eth.contract(abis.ValidatorSet).at(validatorSet-address)
        BlockReward  : web3.eth.contract(abis.BlockReward).at(blockReward-address)
        Development  : web3.eth.contract(abis.Development).at(development-contract-address)
        Resolver     : web3.eth.contract(abis.Resolver).at(resolver-contract-address)
        Timelock     : web3.eth.contract(abis.Timelock) 
        web3         : web3.eth
        HomeBridgeNativeToErc : web3.eth.contract(abis.HomeBridgeNativeToErc).at(homeBridgeAddress)
        ForeignBridgeNativeToErc : web3.eth.contract(abis.ForeignBridgeNativeToErc).at(foreignBridgeAddress)
        ERC20BridgeToken : web3.eth.contract(abis.ERC20BridgeToken).at(ERC20BridgeToken) 
    api