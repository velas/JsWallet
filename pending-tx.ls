require! {
    \localStorage
    \./json-parse.ls
    \./api.ls
    \moment
    \./math.ls : { plus }
    \prelude-ls : { foldl, map }
}
set = (config, arr, cb)->
    name = get-name config
    value = JSON.stringify arr
    local-storage.set-item name, value
    cb null
#saved = (name)->
#    key = get-key name
#    (local-storage.get-item(key) ? "[]") isnt "[]"
get-all = (config, cb)->
    name = get-name config
    data = local-storage.get-item(name) ? ""
    return cb null, [] if data is ""
    err, arr <- json-parse data
    return cb err if err?
    cb null, arr
get-one = (config, cb)->
    return cb "tx is required to get one" if not config.tx?
    err, arr <- get-all config
    return cb err if err?
    index = arr.map(-> it.0).index-of(config.tx)
    return cb "not found" if index is -1
    cb null, arr[index]
export remove-tx = (config, cb)->
    return cb "network is required to remove tx" if not config.network?
    return cb "store is required to remove tx" if not config.store?
    return cb "token is required to remove tx" if not config.token?
    return cb "tx is required to remove tx" if not config.tx?
    err, arr <- get-all config
    return cb err if err?
    return cb "empty array" if arr.length is 0
    index = arr.map(-> it.0).index-of(config.tx)
    return cb "not found" if index is -1
    arr.splice index, 1
    err <- set config, arr
    return cb err if err?
    cb null, \done
export get-pending-amount = (config, cb)->
    return cb "network is required" if not config.network?
    return cb "store is required" if not config.store?
    return cb "token is required" if not config.token?
    err, arr <- get-all config
    return cb err if err?
    total =
        arr
            |> map (.1)
            |> foldl plus, 0
    cb null, total
#export check-tx = ({ store, network, tx }, cb)->
#    err, item <- get-one { network, store, tx }
#    return cb err if err?
#    cb null
export get-pending-txs = (config, cb)->
    err, arr <- get-all config
    cb null, arr
get-name = ({ network, store, token })->
    mode = store.current.network #testnet or mainnet
    index = store.current.account-index
    "ptx-#{mode}-#{token}-#{index}"
export create-pending-tx = (config, cb)->
    { store, network, token, tx, amount-send, amount-send-fee, from, to, recipient } = config
    return cb "token is required" if typeof! token isnt \String
    return cb "store is required" if typeof! store isnt \Object
    return cb "network is required" if typeof! network isnt \Object
    return cb "tx is required" if typeof! tx isnt \String
    return cb "callback is required" if typeof! cb isnt \Function
    err, arr <- get-all config
    return cb err if err?
    now = moment!.unix!
    to2 = to ? recipient
    arr.push [tx, amount-send, amount-send-fee, now, from, to2, network.token]
    err <- set config, arr
    return cb err if err?
    cb null