require! {
    \prelude-ls : { each, map, pairs-to-obj, filter, map, find }
    \./api.ls : { get-transactions }
    \./workflow.ls : { run, task }
    \./pending-tx.ls : { get-pending-txs, remove-tx }
    \./apply-transactions.ls
    \./background/background-task.ls : { add-task }
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
    { url, linktx } = config.network?api ? {}
    url = | linktx => linktx.replace \:hash, tx
        | url => "#{url}/tx/#{tx}"
    { tx, amount, url, fee: fee, time, from, to: to2 }
make-not-pending = (store, tx)->
    #console.log \make-not-pending, tx
    tx.pending = no
    #store.transactions.all |> each (.pending = no)
    #store.transactions.applied |> each (.pending = no)
    #apply-transactions store
    #console.log store.transactions
    err, result <- remove-tx { store, tx.token, tx.network, tx: tx.tx }
    apply-transactions store
check-transaction-task = (bg-store, web3, network, token, ptx)-> (store, cb)->
    check = web3[token]?get-transaction-receipt
    return cb null if not check?
    err, data <- check ptx.0
    tx =
        store.transactions.all
            |> find -> it.token is token and it.tx is ptx.0
    return cb null if not tx?
    console.log ptx.0, tx?pending
    tx.checked = tx.checked ? 0
    tx.checked += 1
    return cb null if not tx?
    make-not-pending store, tx if data?.status is \confirmed
    make-not-pending store, tx if data?.status is \reverted
    return cb null if data?.status is \confirmed
    return cb null if data?.status is \reverted
    cb \pending
check-ptx-in-background = (store, web3, network, token, ptx, cb)->
    add-task ptx.0, check-transaction-task(store, web3, network, token, ptx)
    cb null
check-ptxs-in-background = (store, web3, network, token, [ptx, ...rest], cb)->
    return cb null if not ptx?
    err <- check-ptx-in-background store, web3, network, token, ptx
    #return cb err if err?
    console.log \err, err
    <- set-timeout _, 1000
    if err
        rest.push ptx
    check-ptxs-in-background store, web3, network, token, rest, cb
export rebuild-history = (store, web3, wallet, cb)->
    { address, network, coin, private-key } = wallet
    err, data <- get-transactions { address, network, coin.token, account: { address, private-key } }
    #console.log \rebuild-history, coin.token, err, data
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
    err <- check-ptxs-in-background store, web3, network, coin.token, ptxs
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
        |> each extend { address, coin, network, pending: yes, checked: 0 }
        |> each txs~push
    cb!
build-loader = (store, web3)-> (wallet)-> task (cb)->
    err <- rebuild-history store, web3, wallet
    return cb! if err?
    cb null
export load-all-transactions = (store, web3, cb)->
    { wallets } = store.current.account
    loaders =
        wallets |> map build-loader store, web3
    tasks =
        loaders
            |> map -> [loaders.index-of(it).to-string!, it]
            |> pairs-to-obj
    <- run [tasks] .then    
    apply-transactions store
    cb null