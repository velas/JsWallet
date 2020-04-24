require! {
    \prelude-ls : { filter }
    \./install-plugin.ls : { get-install-list }
    \./browser/window.ls
}
gobyte = require \../web3t/plugins/gobyte-coin.ls
zec = require \../web3t/plugins/zec-coin.ls
#stt = require \../web3t/plugins/stt-coin.json
#qiwi = require \../web3t/plugins/qiwi-coin.ls
#ym = require \../web3t/plugins/ym-coin.ls
#qiwi_rs = require \../web3t/plugins/qiwi-rs.ls
#ym_rs = require \../web3t/plugins/ym-rs.ls
#usd_ac_rs = require \../web3t/plugins/usd-ac-rs.ls
common = (store)->
    vlx2 = require \../web3t/plugins/vlx2-coin.ls
    btc  = require \../web3t/plugins/btc-coin.ls
    coins = [btc, vlx2]
    if store.preference.disablevlx1 isnt true
        vlx = require \../web3t/plugins/vlx-coin.ls
        coins.push vlx
    if window.location.search.index-of("plugin=gbx") > -1  
        coins.push gobyte
    coins
export get-coins = (store, cb)->
    base =
        common store
            |> filter (?)
            |> filter (.type is \coin)
            |> filter (.enabled)
    err, items <- get-install-list
    return cb err if err?
    installed =
        items |> filter (.type is \coin)
            |> filter (.enabled isnt no)
    all = installed ++ base
    cb null, all