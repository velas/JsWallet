require! {
    \react
    \react-dom
    \../../get-primary-info.ls
    \../../web3.ls
    \../../get-lang.ls
    \../../icons.ls
    \../../math.ls : { div, times, plus, minus }
    \../../staking/can-make-staking.ls
    \../../components/amount-field.ls
    \../../components/button.ls
    \../confirmation.ls : { alert }
    \moment
}
.steps-holder    
    @media(max-width:800px)
        text-align: center
    .status-note
        text-align: center
    .steps
        display: flex
        .step
            flex: 1
            display: inline-block
            vertical-align: text-top
            text-align: center
            padding: 0 20px 20px 20px
            margin-bottom: 20px
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
order-withdraw-process = (store, web3t)->
    lang = get-lang store
    activate = (step)-> ->
        store.lockups.exit-tab = step
    activate-first = activate \exit_order
    activate-second = activate \exit_wait
    activate-third = activate \exit_ordered
    active-class = (step)->
        if store.lockups.exit-tab is step then \active else ''
    active-first = active-class \exit_order
    active-second = active-class \exit_wait
    active-third = active-class \exit_ordered
    order = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert store, lang.exitNotAllowed, cb if data isnt yes
        Timelock = store.lockups.currentTimelock
        lockedPoolAddress = store.lockups.chosen-lockup.lockedPool
        lockup-address = Timelock.address
        #
        err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(lockedPoolAddress, lockup-address)
        console.log "maxWithdrawOrderAllowed" max
        amount = store.lockups.withdrawAmount `times` (10^18)
        return alert store, "#{lang.max} #{max.to-fixed! `div` (10^18)}" if +amount > +max.to-fixed!
        return alert store, lang.actionProhibited, cb if +amount is 0
        #
        console.log "Timelock 1" Timelock
        data = Timelock.requestUnstake.get-data(lockedPoolAddress, amount)
        to = lockup-address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    exit = ->
        console.log "exit request unstake"
        return alert store, lang.actionProhibited, cb if +store.lockups.orderedWithdrawAmount is 0
        pool-address = store.lockups.chosen-lockup.lockedPool
        #pool-address = store.lockups.currentTimelock.address
        data = store.lockups.currentTimelock.claimUnstakeRequest.get-data(pool-address)
        to = store.lockups.currentTimelock.address
        #to = store.lockups.chosen-lockup.lockedPool
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.lockups.withdrawAmount = it.target.value
    epoch-next = store.dashboard.epoch-next ? 'loading...'
    amount-requested = +store.lockups.orderedWithdrawAmount > 0 and store.lockups.wait-for-epoch-change
    unstake-is-allowed = +store.lockups.orderedWithdrawAmount > 0 and not store.lockups.wait-for-epoch-change
    unstake-wait-time = store.lockups.chosen-lockup.unstake-wait-time
    .pug.section
        .title.pug
            h3.pug Unstake
        .description.pug
            .pug.left
                .pug.steps-holder
                    .steps.pug
                        .pug.step(on-click-commented=activate-first class="#{active-first}")
                            .pug.step-count 1
                            .pug.step-content
                                .pug Request Unstake
                                if active-first is \active
                                    .pug
                                        .pug
                                            amount-field { store, value: store.lockups.withdrawAmount, on-change: change-max }
                                        button { store, text: "Request Unstake", icon: 'exit', on-click: order, type: "secondary" }
                        .pug.step(on-click-commented=activate-second class="#{active-second}")
                            .pug.step-count 2
                            .pug.step-content  Come back later for your unstaking amount
                        .pug.step(on-click-commented=activate-third class="#{active-third}")
                            .pug.step-count 3
                            .pug.step-content
                                .pug Unstake
                                if active-third is \active
                                    button { store, text: "Unstake", icon: 'exit', on-click: exit, type: "secondary" }
                    .pug.status-note
                        if amount-requested then
                            .pug.note.balance 
                                span.pug.color #{(store.lockups.orderedWithdrawAmount `div` (10^18) )} 
                                span.pug.color VLX 
                                span.pug were requested to unstake and will be available
                                span.pug.color #{unstake-wait-time}
                        if unstake-is-allowed then
                            .pug.note.balance 
                                span.pug.color #{(store.lockups.orderedWithdrawAmount `div` (10^18) )} 
                                span.pug.color VLX 
                                span.pug are available to unstake 
fast-withdraw-process = (store, web3t)->
    lang = get-lang store
    exit = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        staking-address = store.lockups.keystore.lockups.address
        lockup-address = store.lockups.chosen-pool.address
        lockedPoolAddress = store.lockups.chosen-pool.lockedPool
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(lockup-address, staking-address)
        return alert store, "Max amount to withdraw is #{max `div` (10^18)}"
        amount = store.lockups.withdrawAmount `times` (10^18)
        return alert store, "Max amount to withdraw is #{max `div` (10^18)}" if +amount > +max.to-fixed!
        return alert store, lang.actionProhibited, cb if +amount is 0
        Timelock = store.lockups.currentTimelock
        data = Timelock.unstake.get-data(lockedPoolAddress, amount)
        to = lockup-address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    change-max = (it)->
        store.lockups.withdrawAmount = it.target.value
    .pug.section
        .title.pug
            h3.pug #{lang.exit}
        .description.pug
            .pug #{lang.withdraw}
            .pug
                amount-field { store, value: store.lockups.withdrawAmount, on-change: change-max }
            button { store, text: lang.withdraw, icon: 'exit', on-click: exit, type: "secondary" }
not-available-right-now = (store)->
    lang = get-lang store
    .pug.section
        .title.pug
            h3.pug Unstake
        .description.pug
            .pug.balance
                span.pug The action is not available till next epoch 
                span.pug.color (#{store.lockups.chosen-lockup.till-next-epoch})
registry =
    \exit_ordered : order-withdraw-process
    \exit_order   : order-withdraw-process
    \exit_wait    : order-withdraw-process
    \exit         : fast-withdraw-process
    \exit_closed  : not-available-right-now
module.exports = (store, web3t)->
    func = registry[store.lockups.exit-tab]
    return null if not func?
    func store, web3t
module.exports.init = ({ store, web3t}, cb)->
    console.log "init unstake" store
    store.lockups.exit-tab = ''
    store.lockups.maxWithdrawAllowed = 0
    store.lockups.maxWithdrawOrderAllowed = 0
    store.lockups.orderedWithdrawAmount = 0
    store.lockups.chosen-lockup.unstake-wait-time = 0
    return cb null if not store.lockups?chosen-lockup?
    lockup-address = store.lockups.chosen-lockup.address
    lockedPoolAddress = store.lockups.chosen-lockup.lockedPool
    #console.log \ext-stake, staking-address, lockup-address
    TimeLock = web3t.velas.Timelock.at(lockup-address)
    #
    err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(lockedPoolAddress, lockup-address)
    return cb err if err?
    store.lockups.maxWithdrawOrderAllowed = max.to-fixed! `div` (10^18)
    store.lockups.withdrawAmount = store.lockups.maxWithdrawOrderAllowed if +store.lockups.maxWithdrawOrderAllowed > 0
    err, amount <- web3t.velas.Staking.orderedWithdrawAmount lockedPoolAddress, lockup-address
    return cb err if err?
    store.lockups.orderedWithdrawAmount = amount.to-fixed!
    #
    err, last-epoch <- web3t.velas.Staking.orderWithdrawEpoch(lockedPoolAddress, lockup-address)
    return cb "#{err}" if err?
    console.log "last-epoch" last-epoch
    err, staking-epoch <- web3t.velas.Staking.stakingEpoch
    return cb "#{err}" if err?
    err, next-block <- web3t.velas.Staking.stakingEpochEndBlock
    block = next-block `plus` 1
    err, current-block <- web3t.velas.web3.getBlockNumber
    seconds = (block `minus` current-block) `times` 5
    return cb err if err?
    next = moment!.add(seconds, 'seconds').from-now!
    store.lockups.chosen-lockup.till-next-epoch = next
    store.lockups.chosen-lockup.unstake-wait-time = next
    console.log "staking-epoch" staking-epoch
    res = staking-epoch `minus` last-epoch
    store.lockups.wait-for-epoch-change = if +res <= 0 then yes else no
    store.lockups.exit-tab =
        | +store.lockups.orderedWithdrawAmount > 0 and store.lockups.wait-for-epoch-change => \exit_wait
        | +store.lockups.orderedWithdrawAmount > 0 => \exit_ordered
        | +store.lockups.maxWithdrawAllowed > 0 => \exit
        | +store.lockups.maxWithdrawOrderAllowed > 0 => \exit_order
        | +store.lockups.stake-amount-total > 0 => \exit_closed
        | _ => ''
    cb null