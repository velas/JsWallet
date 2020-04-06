require! {
    \prelude-ls : { each, map, pairs-to-obj, filter, map }
    \./api.ls : { get-transactions }
    \./workflow.ls : { run, task }
    \./pending-tx.ls : { get-pending-txs, remove-tx }
    \superagent : { get }
    \./apply-transactions.ls
}
same = (x, y)->
    x?toUpperCase?! is y?toUpperCase?!
extend = ({ address, coin, pending, network }, tx)-->
    type = 
        | tx.to `same` address => \IN
        | _ => \OUT
    tx.type = type if not tx.type?
    tx.token = coin.token ? tx.token
    tx.pending = pending ? tx.pending
    tx.network = network ? tx.network
transform-ptx = (config, [tx, amount, fee, time, from, to2])-->
    { url } = config.network?api ? {}
    url = "#{url}/tx/#{tx}"
    { tx, amount, url, fee: fee, time, from, to: to2 }
export rebuild-history = (store, wallet, cb)->
    { address, network, coin, private-key } = wallet
    err, data <- get-transactions { address, network, coin.token, account: { address, private-key } }
    #console.log \transactions, coin.token, err, data
    return cb err if err?
    ids = 
        data |> map (.tx.to-upper-case!)
    dummy = (err, data)->
        console.log err, data
    err, ptxs <- get-pending-txs { network, store, coin.token }
    #console.log \ptxs, { err, ptxs, network, coin.token }
    return cb err if err?
    ptxs 
        |> filter -> ids.index-of(it.0.to-upper-case!) isnt -1
        |> each -> remove-tx { store, coin.token, network, tx: it.0 }, dummy
    err, ptxs <- get-pending-txs { network, store, coin.token }
    #console.log { err, ptxs, network, coin.token }
    return cb err if err?
    txs = store.transactions.all
    txs
        |> filter (.token is coin.token)
        |> each -> txs.splice txs.index-of(it), 1
    data 
        |> each extend { address, coin, network }
        |> each txs~push
    ptxs 
        |> map transform-ptx { address, coin, network }
        |> each extend { address, coin, network, pending: yes }
        |> each txs~push
    cb!
window.load-test =->
    err, data <- get "https://gist.githubusercontent.com/askucher/63685e1aa495113fc848bbd112902c61/raw/08ff221d6c0a40681d6b02c53f72764bdfad5f02/test.json" .end
    items = JSON.parse data.text
    #console.log items
    items |> each store.transactions.all~push
    apply-transactions store
build-loader = (store)-> (wallet)-> task (cb)->
    err <- rebuild-history store, wallet
    return cb! if err? 
    cb null
export load-all-transactions = (store, cb)->
    { wallets } = store.current.account
    loaders =
        wallets |> map build-loader store
    tasks =
        loaders
            |> map -> [loaders.index-of(it).to-string!, it]
            |> pairs-to-obj
    err <- run [tasks] .then
    return cb err if err?
    apply-transactions store
    cb null