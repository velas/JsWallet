require! {
    \prelude-ls : { filter }
    \./install-plugin.ls : { get-install-list }
    \./browser/window.ls
}
gobyte = require \../web3t/plugins/gobyte-coin.ls
zec = require \../web3t/plugins/zec-coin.ls
common = (store)->
    vlx2 = require \../web3t/plugins/vlx2-coin.ls
    btc  = require \../web3t/plugins/btc-coin.ls
    #btc_sw  = require \../web3t/plugins/btc-segwit-coin.ls
    coins = [vlx2, btc]
    #if store.url-params.segwit?
    #    coins.push btc_sw
    if store.url-params.gbx?
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
    all =  base ++ installed
    cb null, all