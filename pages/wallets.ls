require! {
    \react
    \../seed.ls : seedmem
    \../web3.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \./wallets-desktop.ls : desktop
    \./wallets-mobile.ls : mobile
    \../components/sign-transaction.ls
}
wallets = ({ store, web3t })->
    func = choise[store.current.device]
    return null if typeof! func isnt \Function
    return (sign-transaction { store, web3t }) || (func { store, web3t })
wallets.init = ({ store, web3t }, cb)->
    delete store.current.send?wallet
    store.current.send?tx-type = \regular
    return cb null if store.current.account?
    #TODO: fix this seedmem.get! but before need to ask users to make backup wallets
    seedmem.mnemonic = seedmem.get!
    err <- web3t.init
    #console.log err
    cb null
wallets.focus = ({ store, web3t }, cb)->
    err <- web3t.refresh
    cb err
choise = { mobile, desktop }
module.exports = wallets