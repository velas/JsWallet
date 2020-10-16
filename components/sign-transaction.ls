require! {
    \react
    \bignumber.js
}
click-provide-address = ->
    if !window.store
        return
    wallets = window.store.current.account.wallets
    message = {type: \address , address: wallets.vlx2}
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
    debugger
    if !window.store
        return
    window.store.interop.is-address-queried = yes
    window.store.interop.origin = event.origin
message-handlers = Object.create null
message-handlers.query-address = query-address
on-message = (event) ->
    debugger
    data = JSON.parse event.data
    message-handlers[data.type] data, event
try
    debugger
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