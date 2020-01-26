require! {
    \../web3t/providers/superagent.ls : { get }
    \prelude-ls : { map, group-by, obj-to-pairs, pairs-to-obj, flatten, filter }
    \./workflow.ls : { task, run }
    \./math.ls : { div }
}
parse-rate-string = (usd-info)->
    [_, div, url, extract] = usd-info.match(/(1\/)?url\(([^)]+)\)(.+)?/)
    { div, url, extract }
parse-usd-info = (val)->
    switch typeof! val
        case \Object then val
        case \String then parse-rate-string val
        case \Number then { val }
        else val: 0
make-loader = (wallet)->
    { usd-info, token } = wallet.coin
    info = parse-usd-info usd-info
    { token, ...info }
invalid-url = (url)->
    return yes if typeof! url isnt \String
    return yes if url.index-of(\http) isnt 0
    no
create-task = ([url, items])->
    exec = task (cb)->
        return cb { items } if invalid-url url
        err, data <- get url .end
        cb { err, data, items }
    [url, exec]
extract-val = (data, [head, ...tail])->
    return data if not head?
    extract-val data[head], tail
modify-item = (data, item)-->
    res = 
        | data?body? => extract-val data.body, item.extract.split('.').splice(1)
        | _ => ""
    val =
        | item.div is "1/" => 1 `div` res 
        | _ => res
    { val, item.extract, item.token }
set-val = (info)->
    [url, { err, data, items }] = info
    return info if invalid-url url
    return null if err?
    modified-items =
        items |> map modify-item data
    [url, { items: modified-items }]
set-vals = (res, cb)->
    item =
        res |> obj-to-pairs
            |> map set-val
            |> filter -> it?
            |> map -> it.1.items
            |> flatten
            |> map -> [it.token, it.val]
            |> pairs-to-obj
    cb null, item
get-data = (wallets, cb)->
    tasks =
        wallets
            |> map make-loader
            |> group-by (.url)
            |> obj-to-pairs
            |> map create-task
            |> pairs-to-obj
    res <- run [tasks] .then
    set-vals res, cb
load-rates = (store, cb)->
    { wallets } = store.current.account
    err, rates <- get-data wallets
    return cb err if err?
    store.rates = rates
    cb null
module.exports = load-rates