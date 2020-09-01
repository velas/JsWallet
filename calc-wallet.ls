require! {
    \./api.ls : { get-balance }
    \./math.ls : { times, plus }
    \prelude-ls : { find, map, pairs-to-obj, foldl, filter }
    \./workflow.ls : { run, task }
    \./round5.ls
    \./round-human.ls
    #\./pending-tx.ls : { get-pending-amount }
}
calc-wallet = (store, cb)->
    return cb "Store is required" if not store?
    { wallets } = store.current.account
    { rates } = store
    state =
        balance-usd: 0
    return cb err if err?
    build-loader = (wallet)-> task (cb)->
        { token } = wallet.coin
        #wallet.balance = \..
        #wallet.balance-usd = 0
        token = wallet.coin.token.to-lower-case!
        usd-rate = rates[token] ? \..
        # convert usd-rate to string because bigint does not like number type and can throw exception
        usd-rate = usd-rate + ''
        #coin =
        #    coins |> find (.token is wallet.coin.token)
        #return cb "Coin Not Found" if not coin?
        #coin.wallet = wallet
        wallet.usd-rate =
            | usd-rate is \.. => 0
            | _ => round5 usd-rate
        eur-rate = \0.893191
        btc-rate = \0
        wallet.eur-rate =
            | usd-rate is \.. => \..
            | _ => round5 (usd-rate `times` eur-rate)
        wallet.btc-rate =
            | usd-rate is \.. => \..
            | _ => round5 (usd-rate `times` btc-rate)
        err, balance <- get-balance { wallet.address, wallet.network, token, account: { wallet.address, wallet.private-key } }
        return cb err if err?
        pending-sent =
            store.transactions.all
                |> filter (.token is token)
                |> filter (.pending is yes)
                |> map (.amount)
                |> foldl plus, 0
        #err, pending-sent <- get-pending-amount { store, token, wallet.network }
        #console.log { err, pending-sent }
        wallet.pending-sent = pending-sent
        wallet.balance = balance
        wallet.balance-usd =
            | usd-rate is \.. => 0
            | _ => balance `times` usd-rate
        balance-usd-current =
            | wallet.balance-usd is \.. => 0
            | _ => wallet.balance-usd
        state-before = state.balance-usd
        #convert state.balance-usd to string as bignumber can throw exception for numbers
        state.balance-usd = state.balance-usd + ''
        state.balance-usd =
            | usd-rate is \.. => 0
            | _ => state.balance-usd `plus` balance-usd-current
        #console.log { state-before, state.balance-usd, balance-usd-current }
        cb!
    loaders =
        wallets |> map build-loader
    tasks =
        loaders
            |> map -> [loaders.index-of(it).to-string!, it]
            |> pairs-to-obj
    <- run [tasks] .then
    return cb err if err?
    store.current.balance-usd = state.balance-usd
    cb null
module.exports = calc-wallet