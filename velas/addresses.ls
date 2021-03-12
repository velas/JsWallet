require! {
    \../swaping/addresses.ls : \swapping-addresses
}
addresses =     
    mainnet:
        Staking             : "0x1100000000000000000000000000000000000001"
        ValidatorSet        : "0x1000000000000000000000000000000000000001"
        BlockReward         : "0x2000000000000000000000000000000000000001"
        Upgrade             : "0x4000000000000000000000000000000000000001"
        ResolverAuRa        : "0x80c56f0660A2f4dA65A0b09877c4c85B51e3d723"
        Development         : "0xd89fCa43728eAa5c306c3148DA32dE8A3Ef2963f"
    testnet:
        Staking             : "0x1100000000000000000000000000000000000001"
        ValidatorSet        : "0x1000000000000000000000000000000000000001"
        BlockReward         : "0x2000000000000000000000000000000000000001"
        Upgrade             : "0x4000000000000000000000000000000000000001"
        ResolverAuRa        : "0x9285bea804a386C650afAA63dc6e39e97C9f3f26"
        Development         : "0x4c4955d1a507f59DeC1755C30463825d4BEfE6d1"
addresses.mainnet <<<< swapping-addresses.mainnet
addresses.testnet <<<< swapping-addresses.testnet
module.exports = addresses