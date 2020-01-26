require! {
    \prelude-ls : { map, join }
}
module.exports = (store)->
    store.current.account.wallets 
        |> map -> it.coin.token + ':' + it.address
        |> join \,