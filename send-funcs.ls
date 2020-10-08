require! {
    \mobx : { toJS }
    \./math.ls : { times, minus, div }
    \./api.ls : { create-transaction, push-tx }
    \./calc-amount.ls : { change-amount, calc-crypto-from-eur, calc-crypto-from-usd }
    \./send-form.ls : { notify-form-result }
    \./get-name-mask.ls
    \./resolve-address.ls
    \./browser/window.ls
    \./navigate.ls
    \./close.ls
    \./round.ls
    \./round5.ls
    \./round5edit.ls
    \./topup.ls
    \./get-primary-info.ls
    \./pending-tx.ls : { create-pending-tx }
    \./transactions.ls : { rebuild-history }
    \prelude-ls : { map }
    \./web3.ls
    \./api.ls : { calc-fee }
    \./pages/confirmation.ls : { confirm }
    \./get-lang.ls
    \./apply-transactions.ls
    \./get-tx-details.ls
}
module.exports = (store, web3t)->
    return null if not store? or not web3t?
    lang = get-lang store
    { send-to } = web3t.naming
    { send } = store.current
    { wallet, fee-type } = send
    return null if not wallet?
    color = get-primary-info(store).color
    primary-button-style =
        background: color
    default-button-style = { color }
    send-tx = ({ to, wallet, network, amount-send, amount-send-fee, data, coin, tx-type, gas, gas-price }, cb)->
        { token } = send.coin
        tx-obj =
            account: { wallet.address, wallet.private-key }
            recipient: to
            network: network
            token: token
            coin: coin
            amount: amount-send
            amount-fee: amount-send-fee
            data: data
            gas: gas
            gas-price: gas-price
            fee-type: fee-type
        err, data <- create-transaction tx-obj
        return cb err if err?
        parts = get-tx-details store
        agree <- confirm store, parts.0
        return cb null if not agree
        err, tx <- push-tx { token, tx-type, network, ...data }
        return cb err if err?
        err <- create-pending-tx { store, token, network, tx, amount-send, amount-send-fee, send.to, from: wallet.address }
        cb err, tx
    perform-send-safe = (cb)->
        err, to <- resolve-address { store, address: send.to, coin: send.coin, network: send.network }
        #send.propose-escrow = err is "Address not found" and send.coin.token is \eth
        #return cb err if err?
        resolved =
            | err? => send.to
            | _ => to
        send.to = resolved
        #send.error = err.message ? err if err?
        #return cb err if err?
        send-tx { wallet, ...send }, cb
    perform-send-unsafe = (cb)->
        send-tx { wallet, ...send }, cb
    check-enough = (cb)->
        try
            amount = wallet.balance `minus` send.amount-send `minus` (wallet.pending-sent ? 0) `minus` send.amount-send-fee
            return cb "Not Enough funds" if +amount < 0
            cb null
        catch err
            cb err
    send-money = ->
        return if wallet.balance is \...
        return if send.sending is yes
        err <- check-enough
        return send.error = "#{err.message ? err}" if err?
        send.sending = yes
        err, data <- perform-send-safe
        send.sending = no
        return send.error = "#{err.message ? err}" if err?
        # If cancel was pressed
        return null if not data?
        notify-form-result send.id, null, data
        store.current.last-tx-url = | send.network.api.linktx => send.network.api.linktx.replace \:hash, data
            | send.network.api.url => "#{send.network.api.url}/tx/#{data}"
        navigate store, web3t, \sent
        <- web3t.refresh
    send-escrow = ->
        name = send.to
        amount-ethers = send.amount-send
        err <- send-to { name, amount-ethers }
    send-anyway = ->
        send-money!
    cancel = (event)->
        navigate store, web3t, \wallets
        notify-form-result send.id, "Cancelled by user"
    recipient-change = (event)->
        _to = event.target.value
        _to = _to.trim!
        err <- resolve-address { store, address: _to, coin: send.coin, network: send.network }
        console.error "An error occured during address resolving:" err if err?
        send.error = err ? ''
        send.to = _to ? ""
    get-value = (event)->
        value = event.target.value.match(/^[0-9]+([.]([0-9]+)?)?$/)?0
        value2 =
            | value?0 is \0 and value?1? and value?1 isnt \. => value.substr(1, value.length)
            | _ => value
        value2
    amount-change = (event)->
        value = get-value event
        value = value ? 0
        <- change-amount store, value, no
    perform-amount-eur-change = (value)->
        to-send = calc-crypto-from-eur store, value
        <- change-amount store, to-send , no
    perform-amount-usd-change = (value)->
        to-send = calc-crypto-from-usd store, value
        <- change-amount store, to-send, no
    amount-eur-change = (event)->
        value = get-value event
        send.amount-send-eur = value
        amount-eur-change.timer = clear-timeout amount-eur-change.timer
        amount-eur-change.timer = set-timeout (-> perform-amount-eur-change value), 500
    amount-usd-change = (event)->
        value = get-value event
        value = value ? 0
        send.amount-send-usd = value
        amount-usd-change.timer = clear-timeout amount-usd-change.timer
        amount-usd-change.timer = set-timeout (-> perform-amount-usd-change value), 500
    encode-decode = ->
        send.show-data-mode =
            | send.show-data-mode is \decoded => \encoded
            | _ => \decoded
    show-data = ->
        | send.show-data-mode is \decoded => send.decoded-data
        | _ => send.data
    show-label = ->
        if send.show-data-mode is \decoded then \encoded else \decoded
    when-empty = (str, def)->
        if (str ? "").length is 0 then def else str
    history = ->
        store.current.send-menu-open = no
        store.current.filter = [\IN, \OUT, send.coin.token]
        apply-transactions store
        navigate store, web3t, \history
    export network =
        | store.current.network is \testnet => " (TESTNET) "
        | _ => ""
    export invoice = (wallet)->
        store.current.send-menu-open = no
        { coin, network } = store.current.send
        store.current.invoice <<<< { coin, wallet, network }
        navigate store, web3t, \invoice
    export token = send.coin.token.to-upper-case!
    export name = send.coin.name ? token
    fee-token = (wallet.network.tx-fee-in ? send.coin.token).to-upper-case!
    is-data = (send.data ? "").length > 0
    choose-auto = ->
        send.fee-type = \auto
        <- change-amount store, send.amount-send, no
    choose-cheap = ->
        send.fee-type = \cheap
        <- change-amount store, send.amount-send, no
    choose-custom = (amount)->
        send.fee-type = \custom
        send.fee-custom-amount = amount
        <- change-amount store, send.amount-send, no
    chosen-cheap =  if send.fee-type is \cheap then \chosen else ""
    chosen-auto  =  if send.fee-type is \auto then \chosen else ""
    chosen-custom  =  if send.fee-type is \custom then \chosen else ""
    send-options = send.coin.tx-types ? []
    pending = wallet.pending-sent + ' ' + token
    calc-amount-and-fee = (amount-send, trials, cb)->
        return cb "Cannot estimate max amount. Please try to type manually" if trials <= 0
        return cb "Balance is not enough to send tx" if +amount-send is 0
        account = { wallet.address, wallet.private-key }
        err, amount-send-fee <- calc-fee { token, send.network, amount: amount-send, send.fee-type, send.tx-type, send.to, send.data, account }
        #console.log amount-send, err
        return cb null, { amount-send, amount-send-fee } if not err?
        return cb err if err? and err isnt "Balance is not enough to send tx"
        return cb "Fee cannot be calculated" if not amount-send-fee?
        next = amount-send-fee ? ( 10 `div` (10 ^ send.network.decimals) )
        next-amount = amount-send `minus` next
        next-trials = trials - 1
        calc-amount-and-fee next-amount, next-trials, cb
    use-max = (cb)->
        return cb "Fee is not calculated" if !send.amount-send-fee
        return cb "Please enter recipient address first" if !send.to
        amount = wallet.balance `minus` (wallet.pending-sent ? 0) `minus` send.amount-send-fee
        return cb "Amount is too small" if +amount <= 0
        #console.log { amount }
        err, info <- calc-amount-and-fee amount, 10
        #console.log { amount, wallet.balance, send.amount-send-fee }
        return cb "#{err}" if err?
        return cb "Amount is 0" if +info.amount-send is 0
        send.amount-send = wallet.balance `minus` (wallet.pending-sent ? 0) `minus` info.amount-send-fee
        send.amount-send-fee = info.amount-send-fee
        <- change-amount store, send.amount-send, no
        send.amount-send = wallet.balance `minus` (wallet.pending-sent ? 0) `minus` send.amount-send-fee
        cb null
    use-max-try-catch = (cb)->
        try
            use-max cb
        catch err
            cb err
    export use-max-amount = ->
        err <- use-max-try-catch
        alert "#{err}" if err?
    export change-amount
    export send
    export wallet
    export pending
    export fee-token
    export primary-button-style
    export recipient-change
    export amount-change
    export amount-usd-change
    export amount-eur-change
    export show-data
    export show-label
    export topup : topup(store)
    export history
    export cancel
    export send-anyway
    export choose-auto
    export choose-cheap
    export choose-custom
    export chosen-auto
    export chosen-cheap
    export chosen-custom
    export default-button-style
    export round5edit
    export round5
    export send-options
    export calc-amount-and-fee
    export is-data
    export encode-decode
    out$