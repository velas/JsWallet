require! {
    \react
    \react-dom
    \bignumber.js
    \../../get-primary-info.ls
    \../../get-lang.ls
    \../../history-funcs.ls
    \../../stake-funcs.ls : { query-pools }
    \../icon.ls
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head, each }
    \../../math.ls : { div, times, plus, minus }
    \../../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \safe-buffer : { Buffer }
    \../../../web3t/addresses.js : { ethToVlx }
    \../../round-human.ls
    #\./exit-stake.ls
    \../../icons.ls
    \../placeholder.ls
    \../../staking/can-make-staking.ls
    \../confirmation.ls : { alert }
    \../../components/button.ls
    \../../components/address-holder.ls
    \../alert-txn.ls
    \../../components/amount-field.ls
    \../../seed.ls : seedmem
    \moment
}
cb = console.log
get-pair = (wallet, path, index, password, with-keystore)->
    w = wallet.derive-path(path).derive-child(index).get-wallet!
    address  = "0x" + w.get-address!.to-string(\hex)
    salt = Buffer.from('dc9e4a98886738bd8aae134a1f89aaa5a502c3fbd10e336136d4d5fe47448ad6', 'hex')
    iv = Buffer.from('cecacd85e9cb89788b5aab2f93361233', 'hex')
    uuid = Buffer.from('7e59dc028d42d09db29aa8a0f862cc81', 'hex')
    kdf = 'pbkdf2'
    #console.log \keystore, with-keystore
    keystore =
        | with-keystore => w.toV3String(password, { salt, iv, uuid, kdf })
        | _ => ""
    { address, keystore }
to-keystore = (store, with-keystore)->
    mnemonic = seedmem.mnemonic
    seed = bip39.mnemonic-to-seed(mnemonic)
    wallet = hdkey.from-master-seed(seed)
    index = store.current.account-index
    password = md5 wallet.derive-path("m1").derive-child(index).get-wallet!.get-address!.to-string(\hex)
    staking =
        | store.url-params.anotheracc? => { address: window.toEthAddress(store.url-params.anotheracc) }
        | _ => get-pair wallet, \m0 , index, password, no
    mining  = get-pair wallet, \m0/2 , index, password, with-keystore
    { staking, mining, password }
show-validator = (store, web3t)-> (validator)->
    li.pug #{validator}
lockups-content = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    return if store.lockups.lockupContracts.length is 0
    info = get-primary-info store
    style = get-primary-info store
    { go-back } = history-funcs store, web3t
    lang = get-lang store
    pairs = store.staking.keystore
    withdraw = ->
        {address, lockedPool, maxWithdrawAllowed} = store.lockups.chosen-lockup
        lockup-address = store.lockups.chosen-lockup.address
        Timelock = web3t.velas.Timelock.at(lockup-address)
        contract-address = Timelock.address
        amount = maxWithdrawAllowed.to-fixed! `div` (10^18)
        return alert store, lang.actionProhibited, cb if +amount is 0 
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        vlx-address = vlx2.address2    
        data = Timelock.withdraw.get-data(vlx-address, amount)     
        to = contract-address
        err <- web3t.vlx2.send-transaction { to, data, amount: 0 }
    stake-to-contract = ->
        err, options <- get-options
        return alert store, err, cb if err?
        #err <- can-make-staking store, web3t
        #return alert store, err, cb if err?
        return alert store, "please choose the contract", cb if not store.lockups.chosen-lockup?
        type = typeof! store.lockups.add.add-validator-stake
        return alert store, "please enter correct amount, got #{type}", cb if type not in <[ String Number ]>
        stake-amount = store.lockups.add.add-validator-stake `times` (10^18)
        contract = store.lockups.chosen-lockup.address
        TimeLock = web3t.velas.Timelock.at(contract)
        #console.log "before we stake: " store.lockups.chosen-lockup.lockedPool, stake-amount
        err, lockedPool <- TimeLock.getDefaultPool!
        return cb err if err?
        data = TimeLock.stake.get-data store.lockups.chosen-lockup.address, stake-amount
        console.log "data sifn" data
        to = TimeLock.address
        console.log "web3t.vlx2.send-transaction ... to:" to
        amount = store.lockups.add.add-validator-stake
        err <- web3t.vlx2.send-transaction { to, data, amount } 
        return cb err if err?
#        data = web3t.velas.Staking.stake.get-data store.staking.chosen-pool.address, stake
#        to = web3t.velas.Staking.address
#        amount = store.staking.add.add-validator-stake
#        err <- web3t.vlx2.send-transaction { to, data, amount }
        #return cb err if err?
        return store.lockups.add.result = "#{err}" if err?
        <- lockups.init { store, web3t }
    change-address = ->
        store.staking.add.add-validator = it.target.value
    change-withdraw = ->
        store.lockups.withdrawAmount = it.target.value 
    change-stake = !->
        try
            value = new bignumber(it.target.value).toFixed!.to-string!
            store.lockups.add.add-validator-stake = value
        catch err
            console.log "[Change-stake]: #{err}"
    return null if not pairs.mining?
    get-options = (cb)->
        #i-am-staker = i-stake-choosen-pool!
        #return cb null if i-am-staker
        err, data <- web3t.velas.Staking.candidateMinStake
        return cb err if err?
        min =
            | +store.lockups.stake-amount-total >= 10000 => 1
            | _ => data `div` (10^18)
        balance = (store.lockups.chosen-lockup.locked-funds-raw `div` (10^18)) `minus` 0.1
        stake = store.lockups.add.add-validator-stake
        return cb lang.amountLessStaking if 10000 > +stake
        return cb lang.balanceLessStaking if +balance < +stake
        max = +balance
        cb null, { min, max }
    use-min = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        store.lockups.add.add-validator-stake = 10000
    use-max = ->
        #err, options <- get-options
        #return alert store, err, cb if err?
        balance = store.lockups.chosen-lockup.locked-funds-raw `div` (10^18)
        store.lockups.add.add-validator-stake = Math.max (balance `minus` 0.1), 0
    vote-for-change = ->
        err, can <- web3t.velas.ValidatorSet.emitInitiateChangeCallable
        return alert store, err, cb if err?
        return alert store, lang.actionProhibited, cb if can isnt yes
        data = web3t.velas.ValidatorSet.emitInitiateChange.get-data!
        #console.log { data }
        to = web3t.velas.ValidatorSet.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount }
        store.current.page = \staking
    vlx-token = "VLX"
    hide-stake-place = ->
        console.log "hide()"
        store.lockups.lockupStakingAddress = null
        null
    build = (store, web3t)-> (item)->
        { address, lockedFunds, lockedPool, stake, lockedFundsReleaseTime } = item
        stake = round-human(parse-float item.stake `div` (10^18))
        index = store.lockups.lockupContracts.index-of(item) + 1  
        vlx2 =
            store.current.account.wallets |> find (.coin.token is \vlx2)
        wallet =
            address: ethToVlx item.address
            network: vlx2.network
            coin: vlx2.coin
        choose = ->
            item.checked = yes
            store.lockups.error = ""
            lockedPool = item.lockedPool
            contract = item.address
            err, amount <- web3t.velas.Staking.stakeAmount lockedPool, contract
            store.lockups.stake-amount-total = amount.to-fixed! 
            store.lockups.chosen-lockup = item         
            cb null
        show-stake-place = ->
            store.lockups.lockupStakingAddress = lockedPool  
            null
        lockedUntil = if lockedFundsReleaseTime? then moment(lockedFundsReleaseTime * 1000).format("DD/MM/YYYY hh:mm") else ".."
        tr.pug(class="#{item.status}" key="#{item.address}" on-mouse-enter=show-stake-place on-mouse-leave=hide-stake-place)
            td.pug
                span.pug.circle(class="#{item.status}") #{index}
            td.pug(datacolumn='Staker Address' title="#{ethToVlx item.address}")
                address-holder { store, wallet }
            td.pug #{lockedFunds}
            td.pug #{stake} 
            td.pug #{lockedUntil}               
            td.pug
                button { store, on-click: choose , type: \secondary , icon : \arrowRight }
    cancel = ->
        store.lockups.chosen-lockup = null
        store.lockups.add.add-validator-stake = 0
    refresh = ->
        store.staking.all-pools-loaded = no
        if ((store.staking.all-pools-loaded is no or !store.staking.all-pools-loaded?) and store.staking.pools-are-loading is yes)
            return no
        store.staking.pools-are-loading = yes
        cb = console.log
        cb null, \done
    icon-style =
        color: style.app.loader
        margin-top: "10px"
        width: "inherit"
    staker-pool-style =
        max-width: 200px
        background: style.app.stats
    stats=
        background: style.app.stats
    .pug.staking-content.delegate
        if not store.staking.chosen-pool? and not store.lockups.chosen-lockup?
            .pug.main-sections
                .form-group.pug(id="lockups")
                    .pug.section
                        .title.pug
                            h3.pug Lock-up contracts
                        .description.pug.table-scroll.lockup(on-mouse-leave=hide-stake-place)
                            table.pug
                                thead.pug
                                    tr.pug
                                        td.pug(width="3%" style=stats) #
                                        td.pug(width="40%" style=staker-pool-style) Address
                                        td.pug(width="20%" style=stats) Non-staked Amount
                                        td.pug(width="20%" style=stats) Staked Amount
                                        td.pug(width="10%" style=stats) Locked Until
                                        td.pug(width="9%" style=stats) Select
                                tbody.pug
                                    store.lockups.lockupContracts |> map build store, web3t 
        if store.lockups.chosen-lockup?
            lang-stake = if store.lockups.stake-amount-total > 0 then lang.stakeMore else lang.stake
            .pug.single-section.form-group(id="choosen-lockup")
                .pug.section
                    .title.pug
                        h3.pug Lock-up contract
                    .pug.chosen-pool(title="#{store.lockups.chosen-lockup.address}")
                        span.pug
                            | #{ethToVlx store.lockups.chosen-lockup.address}
                            img.pug.check(src="#{icons.img-check}")
                        .buttons.pug
                            button { store, on-click: cancel , type: \secondary , icon : "back" , text: "Back" id="cancel-pool"}    
                .pug.section
                    .title.pug
                        h3.pug #{lang.withdraw}
                    .description.pug
                        if store.lockups.chosen-lockup.maxWithdrawAllowed > 0   
                            .pug.left
                                label.pug
                                .pug.balance
                                button { store, on-click: withdraw , type: \secondary , icon : \apply , text: \Withdraw }    
                        else
                            span.pug You have no available VLX to withdraw
                .pug.section
                    .title.pug
                        h3.pug #{lang.stake}
                    .description.pug
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
                            button { store, on-click: stake-to-contract , type: \secondary , icon : \apply , text: \btnApply }
                # if we have some funds to unstake
                if  +store.lockups.stake-amount-total > 0
                    unstake = ->
                        {address, lockedPool} = store.lockups.chosen-lockup
                        lockup-address = store.lockups.chosen-lockup.address
                        Timelock = web3t.velas.Timelock.at(lockup-address)
                        staking-address = Timelock.address
                        pool-address = lockedPool                      
                        amount = store.lockups.unstakeAmount `times` (10^18)
                        return alert store, "#{lang.max} #{max.to-fixed! `div` (10^18)}" if +amount > +store.lockups.stake-amount-total
                        return alert store, lang.actionProhibited, cb if +amount is 0     
                        data = Timelock.stake.get-data(address, amount)
                        vlx2 =
                            store.current.account.wallets |> find (.coin.token is \vlx2)
                        to = vlx2.address2
                        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
                    change-unstake = ->
                        store.lockups.unstakeAmount = it.event.value
                    .pug.section
                        .title.pug
                            h3.pug Unstake
                        .description.pug
                            .pug.left
                                label.pug Unstake
                                amount-field { store, value: store.lockups.unstakeAmount , on-change: change-unstake , placeholder: lang.unstake, token: "vlx2", id:"unstake-vlx-input" }
                                .pug.balance
                                    span.pug.small-btns
                                        button.small.pug(style=button-primary3-style on-click=use-min) #{lang.min}
                                        button.small.pug(style=button-primary3-style on-click=use-max) #{lang.max}
                                    span.pug #{lang.balance}:
                                    span.pug.color #{round-human (store.lockups.chosen-lockup.stake `div` (10^18))}
                                        img.label-coin.pug(src="#{icons.vlx-icon}")
                                        span.pug.color #{vlx-token}
                                button { store, on-click: unstake , type: \secondary , icon : \apply , text: \btnApply }
lockups = ({ store, web3t })->
    .pug.lockups-content
        lockups-content store, web3t
stringify = (value) ->
    if value? then
        round-human(parse-float value `div` (10^18))
    else
        '..'
fill-lockup-contract = ({web3t, store},[contract, ...contracts], cb)->
    return cb null, [] if not contract? 
    item = {}
    TimeLock = web3t.velas.Timelock.at(contract)
    console.log "Timelock" TimeLock
    err, lockedFunds <- TimeLock.getNonStakedFunds!
    return cb err if err? 
    item.address = contract
    item.lockedFundsRaw = lockedFunds
    item.lockedFunds = if (+lockedFunds isnt 0) then round-human(parse-float lockedFunds `div` (10^18)) else 0
    item.status = \inactive
    err, lockedPool <- TimeLock.getDefaultPool!
    return cb err if err?
    item.lockedPool = lockedPool
    err, amount <- web3t.velas.Staking.stakeAmount lockedPool, contract
    return cb err if err?
    store.lockups.lockupStaking[lockedPool] = store.lockups.lockupStaking[lockedPool] ? []
    store.lockups.lockupStaking[lockedPool].push amount
    item.stake = amount
    err, lockedFundsReleaseTime <- TimeLock.getLockedFundsReleaseTime!
    return cb err if err?
    item.lockedFundsReleaseTime = lockedFundsReleaseTime
    err, isForwardingEnabled <- TimeLock.isForwardingEnabled!
    return cb err if err?
    item.isForwardingEnabled = isForwardingEnabled
    err, max <- TimeLock.maxWithdrawAllowed!
    return cb err if err?
    item.maxWithdrawAllowed = max
    _item = [item]
    err, rest <- fill-lockup-contract {web3t, store}, contracts
    all = _item ++ rest
    cb null, all
fill-lockup-contracts = ({web3t, store}, contracts, cb)->
    err, res <- fill-lockup-contract {web3t, store}, contracts
    return cb err if err?
    cb null, res
lockups.init = ({ store, web3t }, cb)->
    store.lockups.withdrawAmount = 0
    store.lockups.unstakeAmount = 0
    store.lockups.lockup-was-choosed = no
    store.staking.pool-was-choosed = no
    store.lockups.chosen-lockup = null
    vlx2 = store.current.account.wallets |> find (.coin.token is \vlx2)
    err, lockups <- web3t.velas.Resolver.getLockups vlx2.address2  
    return cb err if err?
    store.lockups.lockupStaking = {}
    err, result <- fill-lockup-contracts {web3t, store}, lockups
    store.lockups.lockupContracts = result
    cb null 
module.exports = lockups
#V31V1kD7DpT9eoRcdXf7T1fbFqcNh