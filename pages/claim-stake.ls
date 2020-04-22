require! {
    \react
    \../get-lang.ls
    \../round5.ls
    \../icons.ls
    \../get-primary-info.ls
    \../math.ls : { div, times, plus, minus }
    \prelude-ls : { map, split, filter, find, foldl, drop }
    \../round-human.ls
}
get-checked-amount = (store)->
    store.staking.rewards
        |> filter (.checked) 
        |> map (.reward)
        |> foldl plus, 0 
calc-reward-epoch = (store, web3t, check, [epoch, ...epochs], cb)->
    mining-address =  store.staking.keystore.mining.address
    return cb null, [] if not epoch?
    err, reward-long <- web3t.velas.BlockReward.getValidatorReward(epoch, mining-address)
    return cb err if err?
    next-check = check - 1
    err, rest <- calc-reward-epoch store, web3t, next-check, epochs
    return cb err if err?
    reward = reward-long `div` (10^18)
    checked = +store.staking.epoch isnt +epoch and check > 0
    all = [{ epoch, reward, checked }] ++ rest
    cb null, all
calc-reward = (store, web3t)->
    cb = (err, data)->
        store.staking.reward-loading = no
    store.staking.reward-loading = yes
    mining-address =  store.staking.keystore.mining.address
    staking-address = store.staking.keystore.staking.address
    err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(store.staking.chosen-pool.address, staking-address)
    return cb err if err?
    err, rewards <- calc-reward-epoch store, web3t , 25, epochs
    reward =
        rewards |> map (.reward) |> foldl plus, 0
    return cb err if err?
    store.staking.rewards = rewards
    store.staking.reward = round5 reward
    store.staking.reward-claim = round5 get-checked-amount store
    cb null
build-claim-reward = (store, web3t)-> (item)->
    style = get-primary-info store
    lang = get-lang store
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    checked = item.checked
    check = ->
        item.checked = not item.checked
        store.staking.reward-claim = round5 get-checked-amount store
    tr.pug
        td.pug
            input.pug(type='checkbox' checked=checked on-change=check)
        td.pug #{item.epoch}
        td.pug(title="#{item.reward}") #{round-human item.reward}
module.exports = (store, web3t)->
    return null if not store.staking.chosen-pool? or +store.staking.stake-amount-total is 0
    check-uncheck = ->
        change = not store.staking.rewards.0.checked
        store.staking.rewards |> map (-> it.checked = change)
    style = get-primary-info store
    lang = get-lang store
    calc-reward-click = ->
        calc-reward store, web3t
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    claim = ->
        epochs =
            store.staking.rewards
                |> filter (.checked) 
                |> map (.epoch)
        max = 25
        rest = epochs.length - max
        return alert "The maximum length of epoch is #{max}. Please uncheck #{rest} epochs" if rest > 0
        #staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimReward.get-data(epochs, store.staking.chosen-pool.address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 9600000, gas-price: 1000000 }
    .pug.section.reward
        .title.pug
            h3.pug #{lang.u-rewards} 
        .description.pug
            if store.staking.reward?
                .pug
                    .pug.balance
                        span.pug #{lang.available-reward}: 
                        span.color.pug #{store.staking.reward}
                        img.label-coin.pug(src="#{icons.vlx-icon}")
                        span.color.pug  VLX
                    .pug.claim-table
                        table.pug
                            tr.pug
                                td.pug(on-click=check-uncheck) #{lang.use}
                                td.pug #{lang.epoch}
                                td.pug #{lang.award}
                            store.staking.rewards |> map build-claim-reward store, web3t
                    .pug.balance
                        span.pug #{lang.claim-reward}: 
                        span.color.pug #{store.staking.reward-claim}
                        img.label-coin.pug(src="#{icons.vlx-icon}")
                        span.color.pug  VLX
                    button.pug(on-click=claim style=button-primary2-style)
                        span.pug
                            img.icon-svg.pug(src="#{icons.reward}")
                            | #{lang.claim-reward}
            else if store.staking.reward-loading is yes
                .pug.placeholder Loading... Please wait
            else
                button.mt-0.pug(style=button-primary2-style on-click=calc-reward-click)
                    span.pug
                        img.icon-svg.pug(src="#{icons.calculate}")
                        | #{lang.calculate-reward}
module.exports.calc-reward = calc-reward