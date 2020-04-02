require! {
    \web3 : Web3
}
mainnet = \https://mainnet-v2.velas.com/rpc
testnet = \https://testnet-v2.velas.com/rpc
network = if window.location.href.index-of('testnet') > -1 then testnet else mainnet
module.exports = new Web3(new Web3.providers.HttpProvider(network))