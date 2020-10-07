require! {
    \./math.ls : { times, minus, plus, div }
    \mobx : { toJS, transaction }
    \./api.ls : { calc-fee }
    \prelude-ls : { find }
    \./round5.ls
}
calc-crypto-generic = (name)-> (store, val)->
    return \0 if not val?
    { send } = store.current
    { wallet } = send
    { token } = send.coin
    rate = wallet?[name] ? 0
    round5 (val `div` rate)
export calc-crypto-from-usd = calc-crypto-generic \usdRate
export calc-crypto-from-eur = calc-crypto-generic \eurRate
calc-fiat = (name)-> (store, amount-send)->
    return \0 if not amount-send?
    { send } = store.current
    { wallet } = send
    { token } = send.coin
    rate = wallet?[name] ? 0
    amount-send `times` rate
export calc-usd = calc-fiat \usdRate
export calc-eur = calc-fiat \eurRate
calc-fee-proxy = (input, cb)->
    fun = ->
        calc-fee input, cb
    calc-fee-proxy.timer = clear-timeout calc-fee-proxy.timer
    calc-fee-proxy.timer = set-timeout fun, 500
change-amount-generic = (field)-> (store, amount-send, fast, cb)->
    send = store.current[field]
    { wallet } = send
    { token } = send.coin
    { wallets } = store.current.account
    return cb null if !send.to
    fee-token = wallet.network.tx-fee-in ? send.coin.token ? \unknown
    fee-wallet =
        wallets |> find (-> it.coin?token is fee-token)
    #return if not send.wallet
    send.error = "Balance is not loaded" if not wallet?
    return cb "Balance is not loaded" if not wallet?
    result-amount-send = amount-send ? 0
    { fee-type, tx-type, fee-custom-amount } = store.current.send
    usd-rate = wallet?usd-rate ? 0
    fee-usd-rate = fee-wallet?usd-rate ? 0
    account = { wallet.address, wallet.private-key }
    send.amount-send = amount-send ? ""
    send.amount-send = amount-send ? ""
    send.value = result-amount-send `times` (10 ^ send.network.decimals)
    send.amount-obtain = result-amount-send
    send.amount-obtain-usd = send.amount-obtain `times` usd-rate
    send.amount-send-usd = calc-usd store, amount-send
    send.amount-send-eur = calc-eur store, amount-send
    calc-fee-fun = if fast then calc-fee else calc-fee-proxy
    err, calced-fee <- calc-fee-fun { token, send.to, send.data, send.network, amount: result-amount-send, fee-type, tx-type, account }
    send.error = "Calc Fee Error: #{err.message ? err}" if err?
    return cb "Calc Fee Error: #{err.message ? err}" if err?
    tx-fee =
        | calced-fee? => calced-fee
        | send.network?tx-fee-options? => send.network.tx-fee-options[fee-type] ? send.network.tx-fee
        | _ => send.network.tx-fee
    send.amount-send-fee = tx-fee
    send.amount-send-fee-options[fee-type] = tx-fee
    send.amount-charged =
        | (result-amount-send ? "").length is 0 => tx-fee
        | result-amount-send is \0 => tx-fee
        | result-amount-send is 0 => tx-fee
        | _ => result-amount-send `plus` tx-fee
    send.amount-charged-usd =  send.amount-charged `times` usd-rate
    send.amount-send-fee-usd = tx-fee `times` fee-usd-rate
    send.error =
        | wallet.balance is \... => "Balance is not yet loaded"
        | parse-float(wallet.balance `minus` result-amount-send) < 0 => "Not Enough Funds"
        | _ => ""
    cb null
export change-amount = change-amount-generic \send
export change-amount-invoice = change-amount-generic \invoice