require! {
    \prelude-ls : { obj-to-pairs, pairs-to-obj, map }
    \mobx : { toJS }
    \./api.ls : { get-keys }
    \./web3.ls
    #\./ethnamed.ls
}
module.exports = (store, mnemonic="", cb)->
    generate-coin-wallet = (coin, cb)->
        network = coin[store.current.network]
        return cb null if network.disabled is yes
        index = store.current.account-index
        err, wallet <- get-keys { index, network, mnemonic, coin.token }
        return cb err if err?
        balance = \...
        balance-usd = \...
        usd-rate = \...
        wallet <<< { coin, network, balance, balance-usd, usd-rate, mnemonic }
        cb null, wallet
    generate-coin-wallets = ([coin, ...rest], cb)->
        return cb null, [] if not coin?
        err, wallet-or-null <- generate-coin-wallet coin
        return cb err if err?
        if wallet-or-null?
            coin.wallet = wallet-or-null
            wallet-or-null.usd-rate = \..
            wallet-or-null.eur-rate = \..
            wallet-or-null.balance-usd = \..
            wallet-or-null.pending-sent = \..
            wallet-or-null.balance = \..
        err, wallets <- generate-coin-wallets rest
        return cb err if err?
        current-wallets =
            | wallet-or-null? => [wallet-or-null]
            | _ => []
        all = current-wallets ++ wallets
        cb null, all
    err, wallets <- generate-coin-wallets store.coins
    return cb err if err?
    cb null, { mnemonic, wallets }