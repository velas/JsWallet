require! {
    \mobx : { toJS }
    \./math.ls : { times, minus, div, plus }
    \./api.ls : { create-transaction, push-tx }
    \./calc-amount.ls : { change-amount-calc-fiat, change-amount-send, change-amount, calc-crypto-from-eur, calc-crypto-from-usd, change-amount-without-fee }
    \./send-form.ls : { notify-form-result }
    \./get-name-mask.ls
    \./resolve-address.ls
    \./browser/window.ls
    \./navigate.ls
    \./close.ls
    \./round.ls
    \./round5.ls
    \./round5edit.ls
    \./round-number.ls    
    \./topup.ls
    \./get-primary-info.ls
    \./pending-tx.ls : { create-pending-tx }
    \./transactions.ls : { rebuild-history }
    \prelude-ls : { map, find }
    \./web3.ls
    \./api.ls : { calc-fee }
    \./pages/confirmation.ls : { confirm }
    \./get-lang.ls
    \./apply-transactions.ls
    \./get-tx-details.ls
    \ethereumjs-util : {BN}
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
    send-tx = ({ to, wallet, network, amount-send, amount-send-fee, data, coin, tx-type, gas, gas-price, swap }, cb)->
        { token } = send.coin
        current-network = store.current.network
        is-erc20 = (['vlx_erc20', 'eth', 'etc', 'sprkl', 'vlx2'].index-of(token)) >= 0   
        chain-id = if current-network is \testnet and is-erc20 then 3 else 1   
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
            swap: swap
        tx-obj <<<< { chain-id } if is-erc20  
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
        _coin = if send.coin.token is \vlx2 then \vlx else send.coin.token   
        err = "Address is not valid #{_coin} address" if err? and err.index-of "Invalid checksum"
        resolved =
            | err? => send.to
            | _ => to
        send.to = resolved
        send.error = err if err?
        return cb err if err?
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
    to-hex = ->
        new BN(it)
    swap-back = ->
        cb = console.log  
        return cb null if not store.current.send.amountSend?
        return if wallet.balance is \...
        return if send.sending is yes
        err <- check-enough
        return send.error = "#{err.message ? err}" if err?
        send.sending = yes 
        send.swap = \foreign_to_erc     
        value = store.current.send.amountSend
        to = web3t.velas.ForeignBridgeNativeToErc.address 
        value = to-hex (value `times` (10^18))
        token-address = web3t.velas.ERC20BridgeToken.address
        data = web3t.velas.ERC20BridgeToken.transferAndCall.get-data(to, value, "0x")
        send.data = data
        send.to = token-address
        send.amount = 0
        send.amount-send = 0  
        err, _data <- perform-send-safe 
        return cb err if err?
        notify-form-result send.id, null, _data
        store.current.last-tx-url = | send.network.api.linktx => send.network.api.linktx.replace \:hash, _data
            | send.network.api.url => "#{send.network.api.url}/tx/#{_data}"
        navigate store, web3t, \sent
        <- web3t.refresh 
    cancel = (event)->
        navigate store, web3t, \wallets
        notify-form-result send.id, "Cancelled by user"
    recipient-change = (event)!->
        _to = event.target.value
        send.to = _to    
        _to = _to.trim!
        err <- resolve-address { store, address: _to, coin: send.coin, network: send.network }
        return send.error = err if err? 
        send.error = '' 
    get-value = (event)-> 
        return null if not event.target?value      
        return \0 if event.target?value is ""    
        value = event.target.value.match(/^[0-9]+([.]([0-9]+)?)?$/)?0
        value2 =
            | value?0 is \0 and value?1? and value?1 isnt \. => value.substr(1, value.length)
            | _ => value
        value2
    amount-change = (event)->
        value = get-value event
        return if not value?    
        <- change-amount store, value, no
    perform-amount-eur-change = (value)->
        to-send = calc-crypto-from-eur store, value
        <- change-amount store, to-send , no
    perform-amount-usd-change = (value)->
        to-send = calc-crypto-from-usd store, value
        <- change-amount-calc-fiat store, to-send, no
    amount-eur-change = (event)->
        value = get-value event
        send.amount-send-eur = value
        amount-eur-change.timer = clear-timeout amount-eur-change.timer
        amount-eur-change.timer = set-timeout (-> perform-amount-eur-change value), 500
    amount-usd-change = (event)->
        value = get-value event
        value = value ? 0 
        { wallets } = store.current.account
        { token } = store.current.send.coin
        wallet =
            wallets |> find (-> it.coin.token is token)
        { balance, usdRate } = wallet 
        send.amount-send-usd = value
        #return no if +value is 0    
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
        return if has-send-error!  
        send.fee-type = \auto
        <- change-amount store, send.amount-send, no
    choose-cheap = ->
        send.fee-type = \cheap
        <- change-amount store, send.amount-send, no
    choose-custom = (amount)->
        return if has-send-error!    
        balance = send.wallet.balance
        amount-send-fee = send.amount-send-fee      
        send.fee-type = \custom
        max-amount = Math.max 1e8, balance
        amount = round-number(amount, {decimals: send.network.decimals, maxValue:max-amount})
        send.amount-send-fee = send.fee-custom-amount = amount
        <- change-amount store, send.amount-send, no
    chosen-cheap = if send.fee-type is \cheap then \chosen else ""
    chosen-auto  = if send.fee-type is \auto then \chosen else ""
    chosen-custom  = if send.fee-type is \custom then \chosen else ""
    send-options = send.coin.tx-types ? []
    pending = wallet.pending-sent + ' ' + token
    calc-amount-and-fee = (amount-send, trials, cb)->
        return cb "Cannot estimate max amount. Please try to type manually" if trials <= 0
        return cb "Balance is not enough to send tx" if +amount-send is 0
        account = { wallet.address, wallet.private-key }
        err, amount-send-fee <- calc-fee { token, send.network, amount: amount-send, send.fee-type, send.tx-type, send.to, send.data, account }
        if send.fee-type is \custom
            amount-send-fee = send.amount-send-fee
        return cb null, { amount-send, amount-send-fee } if not err?
        return cb err if err? and err isnt "Balance is not enough to send tx"
        return cb "Fee cannot be calculated" if not amount-send-fee?
        cb null 
    flag = no   
    use-max = (cb)!->
        min-fee = send.wallet.network.txFeeOptions.cheap       
        amount-send = wallet.balance `minus` (wallet.pending-sent ? 0)
        amount-send = amount-send `minus` min-fee if not flag 
        amount-send = 0 if amount-send < 0 
        flag = yes   
        <- change-amount-send store, amount-send, no
    use-max-try-catch = (cb)->
        try
            use-max cb
        catch err
            cb err
    export use-max-amount = ->
        err <- use-max-try-catch
        alert "#{err}" if err?
    export has-send-error = ->  
        error = store.current.send.error.toString!
        error? and error.length > 0 and error.toLowerCase! isnt "not enough funds"    
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
    export swap-back    
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