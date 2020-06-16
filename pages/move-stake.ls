require! {
    \react
    \../components/amount-field.ls
    \../components/text-field.ls
    \../components/button.ls
    \./confirmation.ls : { alert }
    \../staking/can-make-staking.ls
    \../../web3t/addresses.js : { vlxToEth, ethToVlx }
    \../get-lang.ls
}
.move-stake
    padding: 30px
    text-align: left
try-parse-address = (address, cb)->
    try 
        cb null, vlxToEth(address)
    catch err
        cb err
module.exports = (store, web3t)->
    return null if not store.staking.chosen-pool?
    return null if +store.staking.stake-amount-total is 0
    staking-address = store.staking.keystore.staking?address
    return null if not staking-address?
    lang = get-lang store
    move-stake = ->
        pool-address = store.staking.chosen-pool.address
        err, new-pool-address <- try-parse-address store.staking.chosen-pool.new-address
        return alert store, err, cb if err?
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        stake = store.staking.add.add-validator-stake
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
        return cb err if err?
        max-allowed = max.to-fixed! `div` (10^18)
        return cb "stake must be lower or equal to max allowed #{max-allowed}" if +stake > +max-allowed
        data = web3t.velas.Staking.move-stake.get-data pool-address, store.staking.chosen-pool.new-address, stake
        to = web3t.velas.Staking.address
        err <- web3t.vlx2.send-transaction { to, data, amount: 0 }
    change-stake = (it)->
        store.staking.add.add-validator-stake = it.target.value
    change-address = (it)->
        store.staking.chosen-pool.new-address = it.target.value
    .pug.section
        .title.pug
            h3.pug Move Stake
        .description.pug
            .pug
                label.pug Move Amount
                amount-field { store, value: store.staking.add.add-validator-stake , on-change: change-stake , placeholder: lang.stake }
            .pug
                label.pug New Pool Address
                text-field { store, value: store.staking.chosen-pool.new-address , on-change: change-address , placeholder: lang.stake }
            .pug
                button { store, on-click: move-stake , type: \secondary , icon : \apply , text: \btnApply }