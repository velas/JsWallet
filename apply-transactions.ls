require! {
    \prelude-ls : { sort-by, reverse, filter }
}
module.exports = (store)->
    filt = store.current.filter
    filter-txs = (tx)->
        { type, token } = tx
        type in filt and token in filt
    store.transactions.applied = 
        store.transactions.all 
            |> filter filter-txs 
            |> sort-by (.time) 
            |> reverse
    console.log \tx-length, store.transactions.all.length
    console.log \atx-length, store.transactions.applied.length