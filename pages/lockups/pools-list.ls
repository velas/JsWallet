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
    \./request-stake.ls
    \../../components/checkbox.ls
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
stringify = (value) ->
    if value? then
        round-human(parse-float value `div` (10^18))
    else
        '..'
pools-content = (store, web3t)->
    return null if !store.staking.pools? or (store.staking.pools.length is 0)
    return null if not store.lockups.chosen-lockup?
    current-contract = store.lockups.chosen-lockup
    lockup-action-choose = store.lockups.chosen-lockup-action is \choose
    style = get-primary-info store
    lang = get-lang store
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    icon-style =
        color: style.app.loader
        margin-top: "10px"
        width: "inherit"
    staker-pool-style =
        max-width: 200px
        background: style.app.stats
    stats=
        background: style.app.stats
    { address, lockedFunds, lockedPool, stake, lockedFundsReleaseTime } = store.lockups.chosen-lockup 
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
        change-default-pool = ->
            cb = (err, data)->
                alert store, err, console~log if err? 
            store.lockups.success-cb = ->
                console.log "       success-cb"
                store.current.page = \choosestaker 
                store.lockups.chosen-lockup = current-contract  
                store.lockups.chosenLockup.chosen-lockup-action = 'choose'    
            store.lockups.error = ""
            lockup-address = store.lockups.chosen-lockup.address
            Timelock = web3t.velas.Timelock.at(lockup-address)
            contract-address = Timelock.address
            #err <- Timelock.changeDefaultPool item.address
            #return cb err if err?
            data = Timelock.changeDefaultPool.get-data item.address
            to = contract-address
            err <- web3t.vlx2.send-transaction { to, data, amount: 0 }
            store.lockups.success-cb!            
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
        mystake-class = if +my-stake > 0 then "with-stake" else ""
        pointer-class = if store.lockups.lockupStakingAddress? and (store.lockups.lockupStakingAddress is item.address) then "stake-pointer" else ""
        button-label = if not lockup-action-choose then \Select else \Choose
        is-disabled = current-contract.lockedPool is item.address  and not lockup-action-choose
        locked-until =  if current-contract.lockedFundsReleaseTime? then moment(current-contract.lockedFundsReleaseTime * 1000).format("DD/MM/YYYY hh:mm") else ".."
        lockedFunds = store.lockups.chosenLockup.lockedFunds
        tr.pug(class="#{item.status} #{pointer-class}")
            td.pug
                span.pug.circle(class="#{item.status}") #{index}
            td.pug(datacolumn='Staker Address' title="#{ethToVlx item.address}")
                address-holder { store, wallet }
            if lockup-action-choose
                td.pug #{lockedFunds}
            else
                td.pug #{stake}
            td.pug(class="#{mystake-class}") #{stringify my-stake}
            if lockup-action-choose
                td.pug #{locked-until}
            if not lockup-action-choose  
                td.pug
                    button { classes:"choose-pool", store, on-click: change-default-pool , text: button-label, type: \secondary, make-disabled: is-disabled  } 
    table.pug
        thead.pug
            tr.pug
                td.pug(width="3%" style=stats) #
                td.pug(width="30%" style=staker-pool-style) #{lang.staker-pool}
                if lockup-action-choose
                    td.pug(width="20%" style=stats) Non-Staked Amount
                else
                    td.pug(width="20%" style=stats) Total Stake
                td.pug(width="20%" style=stats) Staked Amount
                if lockup-action-choose
                    td.pug(width="10%" style=stats) Locked Until    
                if not lockup-action-choose
                    td.pug(width="4%" style=stats) Action
        tbody.pug
            store.staking.pools
                |> filter (it)->
                    return no if it.status is \banned
                    if store.lockups.chosenLockupAction is \select then
                        return yes
                    else
                        if not current-contract.lockedPool? or (+current-contract.lockedPool is 0) then
                            return yes
                        it.address is current-contract.lockedPool
                |> map build-pool store, web3t
pools-list = ({ store, web3t })->
    .pug.lockups-content
        pools-content store, web3t
pools-list.init = ({ store, web3t, select-action }, cb)->
    action = if select-action then \select else \choose
    store.lockups.chosen-lockup-action = \choose
    current-contract = store.lockups.chosen-lockup
    if selected-action? then
        store.lockups.chosen-lockup-action = action
    else    
        if not current-contract.lockedPool? or (current-contract.lockedPool? and +current-contract.lockedPool is 0) then
            store.lockups.chosen-lockup-action = \select   
    cb null
module.exports = pools-list