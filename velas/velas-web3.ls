require! {
    \web3 : Web3
}
mainnet = \https://mainnet-v2.velas.com/rpc
testnet = \https://testnet-v2.velas.com/rpc
network = if window.location.href.index-of('testnet') > -1 then testnet else mainnet
web3 = new Web3(new Web3.providers.HttpProvider(network))
#security updates (TODO check more)
delete web3.eth.send-transaction
delete web3.eth.send-signed-transaction
delete web3.eth.send-raw-transaction
delete web3.personal
delete web3.eth.accounts
delete web3.eth.getAccounts
delete web3.eth.sign
#
module.exports = web3