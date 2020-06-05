require! {
    \prelude-ls : { sort-by, reverse, filter }
}
filter-txs = (store, tx)-->
    filt = store.current.filter
    { type, token } = tx
    type in filt and token in filt
module.exports = (store)->
    return store.transactions.applied.length = 0 if store.transactions.all.length is 0
    store.transactions.applied = 
        store.transactions.all 
            |> filter filter-txs store
            |> sort-by (.time) 
            |> reverse