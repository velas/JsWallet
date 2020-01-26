require! {
    \prelude-ls : { each }
    \mobx : { toJS }
}
accs = 
    btc: \3AG7ZC6KxfKerviTod2DHqbJ5WDjwMjE6j
    btc-testnet: \mysKEM9kN86Nkcqwb4gw7RqtDyc552LQoq
    ltc: \LajyQBeZaBA1NkZDeY8YT5RYYVRkXMvb2T
    waves: \3P6Qf3N56CEvJrUPzr5WyGokvoNEfN2wtyx
    #eth: \0xe3C2e9512eA8026B68f69012944e89238a011aC7
    zec: \t1VpYecBW4UudbGcy4ufh61eWxQCoFaUrPs
    dash: \XfXzCt8S7atiVyqnGZdeXunjArgnkuLCc5
fake-wallet = (wallet)->
    wallet.address =  accs[wallet.coin.token] ? wallet.address
module.exports = (store)->
    { wallets } = store.current.account
    #console.log toJS wallets
    wallets |> each fake-wallet