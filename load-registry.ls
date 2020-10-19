require! {
    \../web3t/providers/superagent.ls : { get, post }
    \atob
    \./providers.ls
    \../web3t/plugins/btc-coin.js : btc
    \../web3t/plugins/dash-coin.js : dash
    \../web3t/plugins/eth-coin.js : eth
    \../web3t/plugins/etc-coin.js : etc
    \../web3t/plugins/symblox.js : symblox
    \../web3t/plugins/ltc-coin.js : ltc
    \../web3t/plugins/usdt-coin.js : usdt
}
module.exports = (cb) ->
    def = [ usdt, symblox ]
    cb null, def