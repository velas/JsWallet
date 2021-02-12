require! {
    \react
    \react-dom
    \bignumber.js
    \../../navigate.ls
    \../../get-primary-info.ls
    \../../web3.ls
    \../../get-lang.ls
    \../../icons.ls
    \../../../web3t/addresses.js : { ethToVlx, vlxToEth }
    \../../math.ls : { div, times, plus, minus }
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
    \../../staking/can-make-staking.ls
    \../../components/amount-field.ls
    \../../components/checkbox.ls
    \../../components/address-holder.ls
    \../alert-txn.ls
    \../../components/button.ls
    \../confirmation.ls : { alert }
    \../../round-human.ls
    \../../seed.ls : seedmem
    \moment
    \./lockups.ls
}
.steps
    @media(max-width:800px)
        text-align: center
    .step
        display: inline-block
        vertical-align: text-top
        text-align: center
        padding: 0 20px 0 0
        margin-right: 20px
        margin-bottom: 20px
        width: 140px
        opacity: .6
        position: relative
        cursor: pointer
        transition: all .5s
        @media(max-width:800px)
            padding: 0 10px
            width: auto
            margin: 0 auto 30px
            display: block
        &:last-child
            &:after
                content: none !important
        &:after
            display: block
            left: 150px
            top: 18px
            position: absolute
            border-top: 2px solid grey
            width: 20%
            content: ""
            @media(max-width:800px)
                content: none
        .step-content
            font-size: 13px
            button
                width: 125px
        button
            width: auto
            display: block
            margin: 15px auto 0
        .step-count
            display: inline-block
            background: grey
            padding: 10px 15px
            border-radius: 50px
            margin-bottom: 20px
        &.active
            opacity: 1
            .step-count
                background: #39dcb4
                animation: pulse_step 1s linear
                transform-origin: 50% 50%
            &:after
                display: block
                left: 150px
                top: 18px
                position: absolute
                border-top: 2px solid #3cd5af
                width: 20%
                content: ""
                @media(max-width:800px)
                    content: none
            &:last-child
                &:after
                    content: none !important
    @keyframes pulse_step
        0%
            transform: scale(0.8)
        25%
            transform: scale(0.9)
        50%
            transform: scale(1.1)
        100%
            transform: scale(1)
cb = console~log
stringify = (value) ->
    if value? then
        round-human(parse-float value `div` (10^18))
    else
        '..'
order-withdraw-process = (store, web3t)->
    style = get-primary-info store
    staker-pool-style =
        max-width: 200px
        background: style.app.stats
    stats=
        background: style.app.stats
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    get-balance = ->
        wallet =
            store.current.account.wallets
                |> find -> it.coin.token is \vlx2
        wallet.balance
    your-balance = " #{round-human get-balance!} "
    vlx-token = "VLX"
    current-contract = store.lockups.chosen-lockup
    lockedFunds = current-contract.lockedFunds
    lockedFundsRaw = parse-float current-contract.lockedFundsRaw `div` (10^18)
    lang = get-lang store
    current-step = store.lockups.stake.step
    activate = (step)-> ->
        if step is \stake then
            return if not current-contract-has-defaultPool
        store.lockups.stake.step = step
    if lockedFundsRaw > 0 then
        activate \choose-pool
    if store.lockups.stake.choosen-pull? then
        activate \stake  
    activate-first = activate \topup
    activate-second = activate \choose-pool
    activate-third = activate \stake
    active-class = (step)->
        if current-step is step then \active else ''
    active-first = active-class \topup
    active-second = active-class \choose-pool
    active-third = active-class \stake
    current-contract-has-defaultPool = current-contract.lockedPool? and (+current-contract.lockedPool isnt 0) 
    build-pool = (store, web3t)-> (item)->
        checked = item.checked
        stake = item.stake
        my-stake =
            | +item.my-stake is 0 => item.withdraw-amount
            | _ => item.my-stake
        my-stake = 0 if !my-stake?
        lockupStaking = store.lockups.lockupStaking[item.address]
        if (not !my-stake?) and lockupStaking? and lockupStaking.length > 0 then
            extra-stake = lockupStaking |> foldl plus, 0
            my-stake = extra-stake `plus` my-stake
        index = store.staking.pools.index-of(item) + 1
        choose-pull = ->
            cb = (err, data)->
                alert store, err, console~log if err?   
            store.lockups.success-cb = ->
                store.current.page = \choosestaker 
                store.lockups.chosen-lockup = current-contract    
            store.lockups.error = ""
            lockup-address = store.lockups.chosen-lockup.address
            Timelock = web3t.velas.Timelock.at(lockup-address)
            contract-address = Timelock.address
            #err <- Timelock.changeDefaultPool item.address
            #return cb err if err?
            data = Timelock.changeDefaultPool.get-data item.address
            to = contract-address
            current-contract = store.lockups.chosen-lockup
            err <- web3t.vlx2.send-transaction { to, data, amount: 0 }
            store.lockups.success-cb! if store.lockups.success-cb?
            #err <- lockups.init { store, web3t }
            #return cb err if err?
        to-eth = ->
            item.eth = not item.eth
        reward =
            | item.validator-reward-percent is ".." => ".."
            | _ => (100 - +item.validator-reward-percent) * 1.4285714286
        filled = "#{round-human reward}%"
        filled-color =
            color:
                | reward > 95 => \red
                | reward > 75 => \orange
                | reward > 40 => "rgb(165, 174, 81)"
                | _ => "rgb(38, 219, 85)"
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        wallet =
            address: ethToVlx item.address
            network: vlx2.network
            coin: vlx2.coin
        vote-power =
            | item.vote-power? => "#{item.vote-power}%"
            | _ => "..."
        mystake-class = if +my-stake > 0 then "with-stake" else ""
        pointer-class = if store.lockups.lockupStakingAddress? and (store.lockups.lockupStakingAddress is item.address) then "stake-pointer" else ""
        tr.pug(class="#{item.status} #{pointer-class}")
            td.pug
                span.pug.circle(class="#{item.status}") #{index}
            td.pug(datacolumn='Staker Address' title="#{ethToVlx item.address}")
                address-holder { store, wallet }
            td.pug #{stake}
            td.pug(class="#{mystake-class}") #{stringify my-stake}
            td.pug
                button { classes:"choose-pool", store, on-click: choose-pull , type: \secondary , icon : \arrowRight } 
    is-enough-to-stake = (stake, balance, cb)->
        stake = +stake
        balance = +balance
        min-amount-stake = 10000
        return cb "Staking amount more than Locked amount" if stake > balance
        total = (store.lockups.stake-amount-total `div` (10^18)) `plus` store.staking.stake-amount-total
        return cb null if total >= min-amount-stake
        min =
            | +total >= 10000 => 1
            | _ => min-amount-stake
        balance = balance `minus` 0.1
        return cb lang.amountLessStaking if 10000 > +stake
        return cb lang.balanceLessStaking if +balance < +stake
        max = +balance
        cb null, { min, max }  
    topup-the-contract = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        return alert store, "please choose the contract", cb if not store.lockups.chosen-lockup?
        type = typeof! store.lockups.add.add-validator-topup
        return alert store, "please enter correct amount, got #{type}", cb if type not in <[ String Number ]>
        stake = store.lockups.add.add-validator-topup `times` (10^18)
        contract-address = store.lockups.chosen-lockup.address
        TimeLock = web3t.velas.Timelock.at(contract-address)
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        vlx-address = vlx2.address2
        err, lockedPool <- TimeLock.getDefaultPool!
        return cb err if err?
        data = TimeLock.stakeAmount.get-data vlx-address, stake
        to = TimeLock.address
        amount = store.lockups.add.add-validator-topup
        err <- web3t.vlx2.send-transaction { to, amount } 
        return cb err if err?
        return store.lockups.add.result = "#{err}" if err?
        #<- lockups.init { store, web3t }
        #store.lockups.stake.step = \stake
        cb null
    stake-locked-to-contract = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        return alert store, "please choose the contract", cb if not store.lockups.chosen-lockup?
        type = typeof! store.lockups.add.add-validator-stake
        return alert store, "please enter correct amount, got #{type}", cb if type not in <[ String Number ]>
        stake = store.lockups.add.add-validator-stake `times` (10^18)
        err <- is-enough-to-stake(store.lockups.add.add-validator-stake, (store.lockups.chosen-lockup.locked-funds-raw `div` (10^18)))
        return alert store, "#{err}", cb if err? 
        contract-address = store.lockups.chosen-lockup.address
        TimeLock = web3t.velas.Timelock.at(contract-address)
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        vlx-address = vlx2.address2
        err, lockedPool <- TimeLock.getDefaultPool!
        return cb err if err?
        data = TimeLock.stake.get-data lockedPool, stake
        to = TimeLock.address
        amount = store.lockups.add.add-validator-stake
        err <- web3t.vlx2.send-transaction { to, data, amount: 0 } 
        return cb err if err?
#        data = web3t.velas.Staking.stake.get-data store.staking.chosen-pool.address, stake
#        to = web3t.velas.Staking.address
#        amount = store.staking.add.add-validator-stake
#        err <- web3t.vlx2.send-transaction { to, data, amount }
        #return cb err if err?
        return store.lockups.add.result = "#{err}" if err?
        #<- lockups.init { store, web3t }
    stake-to-contract = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        return alert store, "please choose the contract", cb if not store.lockups.chosen-lockup?
        type = typeof! store.lockups.add.add-validator-stake
        return alert store, "please enter correct amount, got #{type}", cb if type not in <[ String Number ]>
        err <- is-enough-to-stake(store.lockups.add.add-validator-stake, (get-balance! `times`(10^18)))
        return alert store, "#{err}", cb if err?
        stake = store.lockups.add.add-validator-stake `times` (10^18)
        contract-address = store.lockups.chosen-lockup.address
        TimeLock = web3t.velas.Timelock.at(contract-address)
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        vlx-address = vlx2.address2
        err, lockedPool <- TimeLock.getDefaultPool!
        return cb err if err?
        data = TimeLock.stakeAmount.get-data vlx-address, stake
        to = TimeLock.address
        amount = store.lockups.add.add-validator-stake
        err <- web3t.vlx2.send-transaction { to, amount } 
        return cb err if err?
#        data = web3t.velas.Staking.stake.get-data store.staking.chosen-pool.address, stake
#        to = web3t.velas.Staking.address
#        amount = store.staking.add.add-validator-stake
#        err <- web3t.vlx2.send-transaction { to, data, amount }
        #return cb err if err?
        return store.lockups.add.result = "#{err}" if err?
        #<- lockups.init { store, web3t }
    isForwardingEnabled = store.lockups.chosen-lockup.isForwardingEnabled
    stake-func = stake-locked-to-contract 
    stake-func = stake-to-contract if isForwardingEnabled 
    change-stake = ->
        try
            value = new bignumber(it.target.value).toFixed!.to-string!
            store.lockups.add.add-validator-stake = value
        catch err
            console.log "[Change-stake]: #{err}"
    use-min = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        store.lockups.add.add-validator-stake = 10000
    use-max = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        balance = store.lockups.chosen-lockup.locked-funds-raw `div` (10^18)
        store.lockups.add.add-validator-stake = Math.max (balance `minus` 0.1), 0
    epoch-next = store.dashboard.epoch-next ? 'loading...'
    if not current-contract-has-defaultPool then
        .pug.section
            .title.pug
                h3.pug #{lang.stake}
            .description.pug 
                span.pug No locked pool was found. Please select one before proceed
    .pug
        if store.lockups.chosen-lockup.isForwardingEnabled is no
            use-min-topup = ->
                store.lockups.add.add-validator-topup = 1
            use-max-topup = ->
                balance = get-balance!
                store.lockups.add.add-validator-topup = Math.max (balance `minus` 0.1), 0
            change-topup = ->
                try
                    value = new bignumber(it.target.value).toFixed!.to-string!
                    store.lockups.add.add-validator-topup = value
                catch err
                    console.log "[Change-topup]: #{err}"
            .pug.section
                .title.pug
                    h3.pug Topup
                .description.pug
                    .pug.step-content
                        .pug.left
                            .pug.balance
                                span.pug Your non-staked amount:
                                span.pug.color #{lockedFunds}
                                span.pug.color #{vlx-token}
                            amount-field { store, value: store.lockups.add.add-validator-topup , on-change: change-topup , placeholder: \Topup, token: "vlx2", id:"choose-staker-vlx-input" }
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min-topup) #{lang.min}
                                    button.small.pug(style=button-primary3-style on-click=use-max-topup) #{lang.max}
                                span.pug #{lang.balance}:
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                            button { store, on-click: topup-the-contract , type: \secondary , icon : \apply , text: \btnApply }
        if lockedFundsRaw > 0 and store.lockups.chosen-lockup.isForwardingEnabled is no
            .pug.section
                .title.pug
                    h3.pug #{lang.stake}
                .description.pug
                    .pug.step-content
                        .pug.left
                            .pug.balance
                                span.pug #{lang.yourStaking}:
                                span.pug.color #{round-human (store.lockups.stake-amount-total `div` (10^18))}
                                span.pug.color #{vlx-token}
                            amount-field { store, value: store.lockups.add.add-validator-stake , on-change: change-stake , placeholder: lang.stake, token: "vlx2", id:"choose-staker-vlx-input" }
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) #{lang.min}
                                    button.small.pug(style=button-primary3-style on-click=use-max) #{lang.max}
                                span.pug Locked Amount:
                                span.pug.color #{round-human store.lockups.chosen-lockup.locked-funds}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                            button { store, on-click: stake-func , type: \secondary , icon : \apply , text: \btnApply }    
        if store.lockups.chosen-lockup.isForwardingEnabled is yes    
            .pug.section
                .title.pug
                    h3.pug #{lang.stake}
                .description.pug
                    .pug.step-content
                        .pug.left
                            .pug.balance
                                span.pug #{lang.yourStaking}:
                                span.pug.color #{round-human (store.lockups.stake-amount-total `div` (10^18))}
                                span.pug.color #{vlx-token}
                            amount-field { store, value: store.lockups.add.add-validator-stake , on-change: change-stake , placeholder: lang.stake, token: "vlx2", id:"choose-staker-vlx-input" }
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) #{lang.min}
                                    button.small.pug(style=button-primary3-style on-click=use-max) #{lang.max}
                                span.pug #{lang.balance}:
                                span.pug.color #{round-human store.lockups.chosen-lockup.locked-funds}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                            button { store, on-click: stake-func , type: \secondary , icon : \apply , text: \btnApply }    
not-available-right-now = (store)->
    lang = get-lang store
    .pug.section
        .title.pug
            h3.pug #{lang.exit}
        .description.pug
            .pug #{lang.actionProhibited}
module.exports = (store, web3t)->
    order-withdraw-process store, web3t