require! {
    \../web3t/providers/superagent.ls : { get, post }
    \atob
    \./providers.ls
    \../web3t/plugins/btc-coin.js : btc
    \../web3t/plugins/dash-coin.js : dash
    \../web3t/plugins/eth-coin.js : eth
    \../web3t/plugins/etc-coin.js : etc
    \../web3t/plugins/symblox.js : syx
    \../web3t/plugins/symblox-v2.js : syx2
    \../web3t/plugins/ltc-coin.js : ltc
    \../web3t/plugins/usdt-coin.js : usdt
    \../web3t/plugins/usdt_erc20.json : usdt_erc20
    #\../web3t/plugins/sol-coin.js : vlx_sol
    \../web3t/plugins/vlx_erc20-coin.js : vlx_erc20
}
module.exports = (cb) ->
    def = [ eth, usdt, syx, syx2, usdt_erc20, ltc,  vlx_erc20 ]
    cb null, def