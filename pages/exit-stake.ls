require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../icons.ls
    \../math.ls : { div, times, plus, minus }
    \../staking/can-make-staking.ls
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
max-withdraw-ordered = (store, web3t)->
    return null if not store.staking.chosen-pool?
    return null if +store.staking.stake-amount-total is 0 and +store.staking.withdraw-amount is 0
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    activate = (step)-> ->
        store.current.step = step 
    activate-first = activate \first
    activate-second = activate \second
    activate-third = activate \third
    active-class = (step)->
        active-tab =
            | +store.staking.withdraw-amount is 0 => \first
            | store.staking.wait-for-epoch-change is yes => \second
            | +store.staking.withdraw-amount > 0 => \third
        if active-tab is step then 'active' else ''
    active-first = active-class \first
    active-second = active-class \second
    active-third = active-class \third
    order = ->
        err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        return cb err if err?
        return alert store, "Stake and Withdraw is not allowed right now", cb if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawOrderAllowed(pool-address, staking-address)
        amount = max.to-fixed!
        return alert store, "Max Withdraw Orer Allowed is 0 now", cb if +amount is 0
        data = web3t.velas.Staking.order-withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    exit = ->
        #maxWithdrawOrderAllowed
        return alert store, "No Ordered Amount", cb if +store.staking.withdraw-amount is 0
        pool-address = store.staking.chosen-pool.address
        #staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimOrderedWithdraw.get-data(pool-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
    .pug.section
        .title.pug
            h3.pug Exit
        .description.pug
            .pug.left
                .steps.pug
                    .pug.step(on-click=activate-first class="#{active-first}")
                        .pug.step-count 1
                        .pug.step-content
                            .pug Please click the "Request exit" button
                            if active-first is \active
                                button.pug(style=button-primary4-style on-click=order)
                                    span.pug
                                        img.icon-svg.pug(src="#{icons.exit}")
                                        | Request exit
                    .pug.step(on-click=activate-second class="#{active-second}")
                        .pug.step-count 2
                        .pug.step-content Come back in later for a your staking amount
                    .pug.step(on-click=activate-third class="#{active-third}")
                        .pug.step-count 3
                        .pug.step-content
                            .pug Withdraw the staking amount
                            if active-third is \active
                                button.pug(style=button-primary4-style on-click=exit)
                                    span.pug
                                        img.icon-svg.pug(src="#{icons.exit}")
                                        | Withdraw
max-withdraw = (store, web3t)->
    return null if +store.staking.stake-amount-total is 0 and +store.staking.withdraw-amount is 0
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    exit = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        #err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
        #return cb err if err?
        #return alert "Exit is not allowed. Please wait for epoch change" if data isnt yes
        staking-address = store.staking.keystore.staking.address
        pool-address = store.staking.chosen-pool.address
        err, max <- web3t.velas.Staking.maxWithdrawAllowed(pool-address, staking-address)
        amount = max.to-fixed!
        #console.log "web3t.velas.Staking.maxWithdrawAllowed('#{pool-address}', '#{staking-address}')"
        return alert store, "Max Withdraw Allowed is 0", cb if +amount is 0
        data = web3t.velas.Staking.withdraw.get-data(pool-address, amount)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }        
    .pug.section
        .title.pug
            h3.pug Exit
        .description.pug
            .pug Withdraw the staking amount
            button.pug(style=button-primary4-style on-click=exit)
                span.pug
                    img.icon-svg.pug(src="#{icons.exit}")
                    | Withdraw
module.exports = (store, web3t)->
    if +store.staking.max-withdraw-ordered > 0 or +store.staking.withdraw-amount > 0
        max-withdraw-ordered store, web3t
    else 
        max-withdraw store, web3t