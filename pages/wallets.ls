require! {
    \react
    \../seed.ls : { get }
    \../web3.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \./wallets-desktop.ls : desktop
    \./wallets-mobile.ls : mobile
}
wallets = ({ store, web3t })->
    func = choise[store.current.device]
    return null if typeof! func isnt \Function
    func { store, web3t }
wallets.init = ({ store, web3t }, cb)->
    delete store.current.send?wallet
    store.current.send?tx-type = \regular
    return cb null if store.current.account?
    store.current.seed = get!
    err <- web3t.init
    #console.log err
    cb null
wallets.focus = ({ store, web3t }, cb)->
    err <- web3t.refresh
    cb err
choise = { mobile, desktop }
module.exports = wallets