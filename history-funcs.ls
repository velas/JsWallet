require! {
    \prelude-ls : { sort-by, reverse, filter, map, find }
    \moment
    \./navigate.ls
    \react
    \./pending-tx.ls : { remove-tx }
    \./api.ls : { get-transaction-info }
    \./web3.ls
    \mobx : { toJS }
    \./pages/confirmation.ls : { confirm, prompt }
    \./apply-transactions.ls
    \./get-lang.ls
    \./icons.ls
    \./round-human.ls
}
module.exports = (store, web3t)->
    return null if not store? or not web3t?
    ago = (time)->
        moment(time * 1000).from-now!
    date = (time)->
        moment(time * 1000).format!
    filt = store.current.filter
    lang = get-lang store
    arrow = (type)->
        | type is \IN => \ "#{lang.in}"
        | _ => \ "#{lang.out}"
    arrow-lg = (type)->
        | type is \IN => \ "#{icons.get}"
        | _ => \ "#{icons.send}"
    sign = (type)->
        | type is \IN => \+
        | _ => \-
    go-back = ->
        return null if store.pages.length <= 1
        store.pages.splice(-1, 1)
        prev = store.pages[store.pages.length - 1]
        page = prev ? \wallets
        navigate store, web3t, page
    extended = (str)->
        | str.index-of('.') > -1 => "#{str}0"
        | _ => "#{str}.0"
    cut-amount = (amount, max)->
        str = (amount ? "")to-string!
        res =
            | str.length is max => str
            | str.length >= max => str.substr(0, max - 1) + ".."
            | _ => cut-amount extended(str), max
        res
    amount-beautify = (amount, max)->
        str = cut-amount amount, max
        data = str.match(/(.+[^0])(0+)$/)
        return
            .pug.balance
                span.color.pug #{round-human str}
        if not data?
            return
                .pug.balance
                    span.color.pug #{round-human str}
        [_, first, last] = data
        span.pug.balance
            span.color.pug #{round-human first}
            span.rest.pug #{round-human last}
    is-active = (value)->
        if value in filt then \active else ''
    switch-filter  = (value, event)-->
        if value not in filt
            filt.push value
        else
            filt.splice(filt.index-of(value), 1)
        apply-transactions store
    switch-type-in = switch-filter \IN
    switch-type-out = switch-filter \OUT
    delete-pending-tx = (tx)-> (event)->
        agree <- confirm store, "Would you like to remove pending transaction? Your balance will be increased till confirmed transaction"
        return if not agree
        err <- remove-tx { store, ...tx }
        <- web3t.refresh
    transaction-info = (config)-> (event)->
        err, info <- get-transaction-info config
        console.log err, info
    { go-back, switch-type-in, transaction-info, switch-type-out, store.coins, is-active, switch-filter, arrow, arrow-lg, sign, delete-pending-tx, amount-beautify, ago }