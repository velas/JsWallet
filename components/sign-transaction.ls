require! {
    \react
    \bignumber.js
}
click-provide-address = ->
    if !window.store
        return
    wallets = window.store.current.account.wallets
    vlx2 = wallets.find (.coin.token is \vlx2)
    message = JSON.stringify {type: \address , address: vlx2.address}
    window.parent.post-message message, window.store.interop.origin
    return
    data = store.url-hash-params.transaction
    if not data.starts-with \0x
        data = \0x + data
    amount = store.url-hash-params.amount || '0'
    to = store.url-hash-params.to
    err, tx-hash <- web3t.vlx2.send-transaction { to, data, amount }
    message = JSON.stringify {type: \tx , err, tx-hash}
    window.parent.post-message message, '*'
query-address = (data, event) ->
    if !window.store
        return
    window.store.interop.is-address-queried = yes
    window.store.interop.origin = event.origin
send = (data, event) ->
    if !window.store
        return
    transaction = data.transaction
    if not transaction.starts-with \0x
        data = \0x + data
    amount = data.amount || '0'
    to = data.to
    err, tx-hash <- web3t.vlx2.send-transaction { to, data: transaction, amount }
    message = JSON.stringify {type: \tx , err: err?.to-string!, tx-hash}
    window.parent.post-message message, '*'
message-handlers = Object.create null
message-handlers.query-address = query-address
message-handlers.send = send
on-message = (event) ->
    console.log(event.data);
    if typeof event.data isnt \string
        return
    data = JSON.parse event.data
    message-handlers[data.type] data, event
try
    if window isnt window.parent
        window.add-event-listener \message, on-message
catch e
    console.log e
module.exports = ({store, web3t})->
    is-in-iframe = window != window.parent
    return null if !store.interop.is-address-queried or !is-in-iframe
    #set-timeout click-sign, 0
    #return null
    .pug(on-click=click-provide-address) Website #{store.interop.origin} request your address. Click to provide it.