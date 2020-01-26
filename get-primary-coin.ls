require! {
    \prelude-ls : { head, drop, take, find }
}
load-first = (store)->
    return null if store.coins.length is 0
    store.coins |> head
max = 4
get-list = (store)->
    return [] if not store.current?account?
    { list } = store.current
    store.current.account.wallets
        |> drop list
        |> take max
get-important = (store)->
    return null if store.coins.length is 0
    store.coins |> find (.branding?important)
get-wallet-by-index = (store)->
    { send, account, wallet-index } = store.current
    items = get-list store
    items[wallet-index]?coin
module.exports = (store)->
    { send, account, wallet-index } = store.current
    get-important(store) ? send?wallet?coin ? get-wallet-by-index(store) ? load-first(store)