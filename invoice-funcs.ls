require! {
    \mobx : { toJS }
    \./math.ls : { times, minus, div }
    \./calc-amount.ls : { change-amount-invoice, calc-crypto }
    \./browser/window.ls
    \./navigate.ls
    \./close.ls
    \./round5edit.ls
    \./get-primary-info.ls
    \prelude-ls : { map }
    \../web3t/providers/superagent.ls : { put }
}
module.exports = (store, web3t)->
    return null if not store? or not web3t?
    { invoice } = store.current
    { wallet } = invoice
    return null if not wallet?
    color = get-primary-info(store).color
    primary-button-style =
        background: color
    default-button-style = { color }
    send-anyway = (response)->
        #{ address } = invoice.wallet
        #{ to, data, amount-send } = invoice
        #err, data <- put "https://web3.space/invoice/send", { response, token, address, to, data, amount: amount-send } .end
        ##alert store, "0 is smallest account index", cb
        #return alert "#{err.message ? err}: #{data.text}" if err?
        #<- alert store, "Your invoice has been sent"
        #cancel!
    cancel = (event)->
        navigate store, web3t, \wallets
    recipient-change = (event)->
        invoice.to = event.target.value ? ""
    get-value = (event)->
        value = event.target.value.match(/^[0-9]+([.]([0-9]+)?)?$/)?0
        value2 = 
            | value?0 is \0 and value?1? and value?1 isnt \. => value.substr(1, value.length)
            | _ => value
        value2
    amount-change = (event)->
        value = get-value event
        <- change-amount-invoice store, value, no
    amount-usd-change = (event)->
        value = get-value event
        to-send = calc-crypto store, value
        <- change-amount-invoice store, to-send, no
    network =
        | store.current.network is \testnet => " (TESTNET) "
        | _ => ""
    token = invoice.coin.token.to-upper-case!
    description-change = (event)->
        invoice.data = event.target.value
    { invoice, description-change, token, wallet, primary-button-style, recipient-change, amount-change, amount-usd-change, cancel, send-anyway, default-button-style, round5edit }