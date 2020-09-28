require! {
    \react
    \bignumber.js
}
click-sign = ->
    data = store.url-hash-params.transaction
    if not data.starts-with \0x
        data = \0x + data
    amount = store.url-hash-params.amount || '0'
    to = store.url-hash-params.to
    err <- web3t.vlx2.send-transaction { to, data, amount }
module.exports = ({store, web3t})->
    have-transaction-to-sign = (
        store.url-hash-params.transaction and
        store.url-hash-params.to
    )
    debugger
    is-in-iframe = window != window.parent
    return null if !have-transaction-to-sign or !is-in-iframe
    .pug(on-click=click-sign) Click to sign the transaction