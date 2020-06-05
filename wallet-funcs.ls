require! {
    \prelude-ls : { each, find }
    \./web3.ls
    \./round5.ls
    \./get-primary-info.ls
    \./navigate.ls
    \./apply-transactions.ls
    \./math.ls : { times }
    \mobx : { transaction }
}
module.exports = (store, web3t, wallets, wallet)->
    return null if not store? or not web3t? or not wallets? or not wallet?coin?token?
    index = wallets.index-of wallet
    #type = 
    #    | index is 0 => \top
    #    | index + 1 is wallets.length => \bottom
    #    | _ => \middle
    return null if not store? or not wallet?
    send = (wallet, event)-->
        #event.stop-propagation!
        return alert "Not yet loaded" if not wallet?
        return alert "Not yet loaded" if not web3t[wallet.coin.token]?
        { send-transaction } = web3t[wallet.coin.token]
        to = ""
        value = 0
        err <- send-transaction { to, value }
        #console.log err if err?
    receive = (wallet, event)-->
        #console.log { event }
        event.stop-propagation!
        store.current.send-menu-open = no
        #{ coin, network, wallet } = store.current.send
        network = wallet.coin[store.current.network]
        store.current.invoice <<<< { wallet.coin, wallet, network }
        navigate store, web3t, \invoice
    usd-rate = wallet?usd-rate ? 0
    uninstall = (e)->
        e.stop-propagation!
        wallet-index = 
            store.current.account.wallets.index-of(wallet)
        return if wallet-index is -1
        store.current.account.wallets.splice wallet-index, 1
        <- web3t.uninstall wallet.coin.token
        <- web3t.refresh
        store.current.wallet-index = 0
    expand = (e)->
        e.stop-propagation!
        return send(wallet, {}) if store.current.wallet-index is index
        store.current.wallet-index = index
        store.current.filter.length = 0
        store.current.filter = [\IN, \OUT, wallet.coin.token]
        apply-transactions store
    active = if index is store.current.wallet-index then \active else ''
    big = 
        | index is store.current.wallet-index => \big
        | wallets.length < 3 => \big
        | _ => ""
    balance = round5(wallet.balance) + ' ' + wallet.coin.token.to-upper-case!
    balance-usd = wallet.balance `times` usd-rate
    pending = round5(wallet.pending-sent) + ' ' + wallet.coin.token.to-upper-case!
    style = get-primary-info store
    button-style=
        color: style.app.text
        background: "#{style.app.background}36"
        border: "1px solid #{style.app.border}"
    last = 
        | wallets.length < 4 and index + 1 is wallets.length => \last
        | _ => ""
    { button-style, wallet, active, big, balance, balance-usd, pending, send, expand, usd-rate, last, receive, uninstall }