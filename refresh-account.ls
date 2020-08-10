require! {
    \./new-account.ls
    \./refresh-wallet.ls
    \mobx : { toJS, transaction }
    \prelude-ls : { map, pairs-to-obj, find }
    \./mirror.ls
    \./apply-transactions.ls
    \./scam-warning.ls
    \./seed.ls : seedmem
}
export set-account = (web3, store, cb)->
    err, account <- new-account store, seedmem.mnemonic
    return cb err if err?
    #vlx =
    #    account.wallets 
    #        |> find -> it.coin.token is 'vlx'
    #vlx.address = 'VLZXHUUZYToqjvSJgT61DrULHy2mmxkSgxd'
    #console.log account
    store.current.account = account
    mirror.account-addresses =
        account.wallets 
            |> map -> [it.coin.token, it.address] 
            |> pairs-to-obj
    cb null
export refresh-account = (web3, store, cb)-->
    scam-warning!
    err <- set-account web3, store
    return cb err if err?
    #err, name <- web3.get-account-name store
    #store.current.account.account-name = 
    #    | not err? => name 
    #    | _ => "Anonymous"
    store.current.account.account-name = "Anonymous"
    account-name = store.current.account.account-name
    store.current.nickname = "" if account-name isnt "Anonymous"
    store.current.nicknamefull = account-name if account-name isnt "Anonymous"
    refresh-wallet web3, store, cb
export background-refresh-account = (web3, store, cb)->
    store.current.refreshing = yes
    bg-store = toJS store
    #err, coins <- get-coins
    #return cb err if err?
    #bg-store.coins = coins
    err <- refresh-account web3, bg-store
    store.current.refreshing = no
    return cb err if err?
    transaction ->
        wallet = bg-store.current.account.wallets[store.current.wallet-index]
        return if not wallet?
        store.rates = bg-store.rates
        store.current.account = bg-store.current.account
        store.current.filter.length = 0
        store.current.filter.push \IN
        store.current.filter.push \OUT
        store.current.filter.push wallet.coin.token
        store.current.balance-usd = bg-store.current.balance-usd
        store.transactions = bg-store.transactions
        apply-transactions store
    cb null