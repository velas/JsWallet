require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \prelude-ls : { map, split, filter, find, foldl, sort-by, unique, head }
    \../math.ls : { div, times, plus, minus }
    \../velas/velas-web3.ls
    \../velas/velas-node-template.ls
    \../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \../menu-funcs.ls
    \btoa
    \safe-buffer : { Buffer }
    \../copied-inform.ls
    \../copy.ls
    \../round5.ls
    \../../web3t/addresses.js : { ethToVlx }
    \./switch-account.ls
    \../round-human.ls
    \./exit-stake.ls
    \../icons.ls
    \./placeholder.ls
    \./claim-stake.ls
    \../staking/can-make-staking.ls
    \./epoch.ls
    \./confirmation.ls : { alert }
    \../components/button.ls
    \../components/address-holder.ls
    \./alert-txn.ls
}
.staking
    @import scheme
    color: white
    position: relative
    display: block
    width: auto
    margin-left: 60px
    top: 0
    height: auto
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    .loader
        svg
            width: 12px
            cursor: pointer
    .icon-right
        height: 12px
        top: 2px
        position: relative
    .pad
        padding: 0 5px
    .pad-bottom
        padding-bottom: 5px
    @media(max-width:800px)
        width: 100%
        margin: 0
    .staking-content
        overflow: hidden
        background: transparent
        width: 100%
        border-radius: 0px
        position: relative
        box-sizing: border-box
        .claim-table
            max-height: 100px
            width: 300px
            overflow-y: auto
            background: rgb(90, 26, 154)
            @media(max-width:800px)
                margin: 15px auto
            tbody
                background: rgb(45, 15, 85)
            table
                width: 100%
                tr
                    padding: 0
                    margin: 0
                    td
                        width: 33%
                        &:first-child
                            text-align: center
        .left-proxy, .right-proxy
            width: 15px
            height: 16px
            line-height: 10px
            display: inline-block
            color: white
            padding: 9px
            border-radius: 0px
            cursor: pointer
            vertical-align: top
            text-align: center
        .form-group
            text-align: center
            padding-top: 0px
            overflow-y: auto
            input, textarea
                margin: 5px 0
                outline: none
            .section
                border-bottom: 1px solid rgba(240, 237, 237, 0.16)
                padding: 30px 20px
                display: flex
                .chosen-pool
                    .buttons
                        text-align: left
                        @media(max-width:800px)
                            text-align: center
                    .check
                        width: 15px
                        height: 15px
                        margin-left: 10px
                        vertical-align: middle
                        animation: pulse_check 1s linear
                        transform-origin: 50% 50%
                    @keyframes pulse_check
                        0%
                            transform: scale(0)
                        25%
                            transform: scale(0.5)
                        50%
                            transform: scale(1.6)
                        100%
                            transform: scale(1)
                @media (max-width: 800px)
                    display: flow-root
                    padding: 20px
                &:last-child
                    border: 0
                &.reward
                    background-image: $reward
                    background-repeat: no-repeat
                    background-position: 80%
                    background-size: auto
                    background-color: rgba(111, 50, 162, 0.15)
                    @media(max-width: 800px)
                        background-position: 5%
                    @media(max-width: 540px)
                        background-image: none
                .title
                    padding: 0px
                    width: 20%
                    text-align: left
                    text-transform: uppercase
                    font-size: 14px
                    @media (max-width: 800px)
                        width: 100%
                        margin-bottom: 20px
                        text-align: center
                    .less
                        font-size: 10px
                        opacity: 0.9
                .description
                    padding: 0px
                    font-size: 14px
                    width: 80%
                    text-align: left
                    hr
                        margin: 15px auto
                        border: 1px solid rgba(240, 237, 237, 0.16)
                        border-top: 0
                    .chosen-pool
                        margin-bottom: 10px
                        .color
                            color: orange
                            font-weight: 600
                    &.table-scroll
                        overflow-x: scroll
                        background: linear-gradient(#321260 30%, rgba(50, 18, 96, 0)), linear-gradient(rgba(50, 18, 96, 0), #321260 70%) 0 100%, radial-gradient(farthest-side at 50% 0, #594aaa, rgba(0, 0, 0, 0)), radial-gradient(farthest-side at 50% 100%, #594aaa, rgba(0, 0, 0, 0)) 0 100%
                        background-repeat: no-repeat
                        background-attachment: local, local, scroll, scroll
                        background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                        animation: breathe 3s ease-in infinite
                        -moz-transition: breathe 3s ease-in infinite
                        -web-kit-transition: breathe 3s ease-in infinite
                        height: calc(100vh - 105px)
                        thead
                            th
                                @media(min-width:800px) and (max-width: 900px)
                                    font-size: 11px !important
                        td
                            &:nth-child(2)
                                cursor: pointer
                        tr
                            &.active
                                color: #b6efe1
                            &.inactive
                                color: orange
                            &.banned
                                color: red
                            .circle
                                border-radius: 0px
                                width: 20px
                                height: 20px
                                display: inline-block
                                color: white
                                background: gray
                                &.active
                                    background: rgb(38, 219, 85)
                                &.inactive
                                    background: orange
                                &.banned
                                    background: red
                        button
                            width: 100%
                            height: 30px
                            margin-top: 0
                    table
                        width: 100%
                        border-collapse: collapse
                        margin: 0px auto
                    tr:nth-of-type(odd)
                        background: rgba(107, 38, 142, 0.2)
                    th
                        background: rgb(67, 32, 124)
                        color: white
                        font-weight: 400
                        &:first-child
                            text-align: center
                            width: 5%
                    td
                        &:nth-child(1), &:nth-child(6)
                            text-align: center
                        img.copy
                            height: 12px
                            margin-right: 5px
                    td, th
                        padding: 8px
                        max-width: 200px
                        border: 1px solid rgba(240, 237, 237, 0.16)
                        white-space: nowrap
                        font-size: 13px
                        @media(max-width:800px)
                            text-align: left
                    .left
                        position: relative
                        .small-btns
                            line-height: 36px
                            button.small
                                outline: none
                                border-radius: 0px
                                line-height: 10px
                                text-align: center
                                height: 16px
                                font-size: 10px
                                font-weight: 600
                                margin-top: 0
                                width: auto
                                margin-right: 10px
                                padding: 2px 5px
                                cursor: pointer
                    @media (max-width: 800px)
                        width: 100%
                        text-align: center
                    .important
                        color: orange
                    .left-node
                        width: 40%
                        float: left
                        @media (max-width: 800px)
                            width: 100%
                            text-align: center
                            margin-bottom: 20px
                        @media (min-width: 801px) and (max-width: 992px)
                            width: 50%
                        img
                            width: 240px
                    .right-node
                        width: 60%
                        float: right
                        @media (max-width: 800px)
                            width: 100%
                            text-align: center
                        @media (min-width: 801px) and (max-width: 992px)
                            width: 50%
                            text-align: left
                    &.node
                        width: 80%
                    .tabs
                        display: inline-block
                        margin: 20px 0 20px
                        width: 100%
                        .tab
                            width: 25%
                            display: inline-block
                            opacity: 0.5;
                            text-align: center
                            border-bottom: 1px solid
                            line-height: 37px
                            text-transform: uppercase
                            font-size: 10px
                            font-weight: bold
                            cursor: pointer
                            height: 36px
                            background: #2c0d5f
                            border-color: #6b258e
                            @media (max-width: 800px)
                                width: 50%
                            &.active
                                opacity: 1
                                border-bottom: 1px solid #6e1d96
                                background: #37156d
                    .btn
                        margin: 10px 0
                    .code
                        overflow: scroll
                        background: #1b1b1b
                        text-align: left
                        .copy
                            float: right
                            margin-top: 11px
                            margin-right: 10px
                            width: 15px
                        .cursor
                            -webkit-animation: blink 0.9s infinite
                            animation: blink 0.9s infinite
                            font: initial
                            display: inline-block
                            opacity: 1
                            margin-left: 5px
                        @-webkit-keyframes blink
                            0%
                                opacity: 1
                            50%
                                opacity: 0
                            100%
                                opacity: 1
                        @keyframes blink
                            0%
                                opacity: 1
                            50%
                                opacity: 0
                            100%
                                opacity: 1
                        &.comming
                            background: transparent
                            text-align: center
                    .window
                        position: sticky
                        top: 0
                        left: 0
                        height: 39px
                        background: #040404
                        .icons
                            padding: 0.75em
                            position: absolute
                            span
                                background: #040404
                            &:before
                                content: ""
                                background: #040404
                            &:after
                                content: ""
                                background: #040404
                            span, &:before, &:after
                                display: inline-block
                                float: left
                                width: 1em
                                height: 1em
                                border-radius: 50%
                                margin-right: 0.5em
                    .balance
                        font-size: 14px
                        .color
                            color: orange
                            font-weight: 600
                        .label-coin
                            left: 3px
                            top: 2px
                            padding-right: 2px
                            height: 15px
                            position: relative
                            color: orange
                            font-weight: 600
                    textarea
                        border: 0
                        padding: 10px
                        font-size: 13px
                        width: 100%
                        box-sizing: border-box
                        min-height: 120px
                        font-family: monospace
                .content
                    width: 30%
                    position: relative
                    button, .switch-index
                        margin: 0
                        position: absolute
                        top: 50%
                        left: 40%
                        -ms-transform: translateY(-50%)
                        transform: translateY(-50%)
            .center
                text-align: center
            .left
                text-align: left
            label
                font-size: 13px
            h3
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                opacity: .8
                font-weight: 400
                margin: 0
            input[type="radio"]
                height: auto
                width: auto
                margin: 0 40%
                cursor: pointer
            input[type="checkbox"]
                height: auto
                width: auto
                margin: 0 40%
                cursor: pointer
            input
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: 0
                padding: 0px 10px
                font-size: 14px
                margin: 5px 0
                border: 0px
                box-shadow: none
                &.change-index
                    margin: 0 !important
                    border-radius: 0px
                    height: 36px
                    width: 55px
                    line-height: 36px
                    text-align: center
                    font-size: 13px
    ul
        padding: 0
        margin: 0
        min-width: 100%
        max-width: 300px
        li 
            list-style: none
            margin-left: 0
            font-size: 13px
            color: #6f6fe2
            font-size: 16px
            list-style-position: inside
            white-space: nowrap
            overflow: hidden
            text-overflow: ellipsis
            @media (max-width: 800px)
                text-align: center
    .yesno
        &.Yes
            background: rgba(60, 213, 175, 0.2)
            color: #3cd5af
        &.No
            background: rgba(236, 146, 146, 0.2)
            color: #d85757
    .noyes
        &.Yes
            background: rgba(236, 146, 146, 0.2)
            color: #d85757
        &.No
            background: rgba(60, 213, 175, 0.2)
            color: #3cd5af
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 125px
        padding: 0 6px
        margin-top: 10px
        text-decoration: none
        text-transform: uppercase
        font-size: 10px
        font-weight: bold
        cursor: pointer
        outline: none
        display: inline-block
        text-overflow: ellipsis
        overflow: hidden
        white-space: nowrap
        &.mt-0
            margin-top: 0
        &:hover
            background: transparent
            color: $primary
        &.link
            min-width: 190px
    >.title
        position: sticky
        position: -webkit-sticky
        z-index: 1
        background: linear-gradient(100deg, rgb(51, 20, 98) 4%, rgb(21, 6, 60) 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
        >.close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            &:hover
                color: #CCC
        &:checked + label:before
            background-color: #3cd5af
            border-color: #3cd5af
            color: #fff
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
    mnemonic = store.current.seed
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
staking-content = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
        overflow-x: \auto
        margin-top: \10px
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    filter-icon=
        filter: style.app.filterIcon
    comming-soon =
        opacity: ".3"
    pairs = store.staking.keystore
    become-validator = ->
        err <- can-make-staking store, web3t
        return alert store, err, cb if err?
        return alert store, "please choose the pool", cb if not store.staking.chosen-pool?
        type = typeof! store.staking.add.add-validator-stake
        #console.log \correct_amount , type, store.staking.add.add-validator-stake
        return alert store, "please enter correct amount, got #{type}", cb if type not in <[ String Number ]>
        stake = store.staking.add.add-validator-stake `times` (10^18)
        #console.log { stake }
        #console.log stake, pairs.mining.address
        #data = web3t.velas.Staking.stake.get-data pairs.staking.address, stake
        #console.log "Staking.getData('#{store.staking.chosen-pool}', '#{stake}')"
        data = web3t.velas.Staking.stake.get-data store.staking.chosen-pool.address, stake
        #console.log \after-stake
        to = web3t.velas.Staking.address
        #console.log \to, { to, data, amount }
        amount = store.staking.add.add-validator-stake
        #console.log \after-stake, to, amount
        err <- web3t.vlx2.send-transaction { to, data, amount }
        #return cb err if err?
        return store.staking.add.result = "#{err}" if err?
        #store.staking.add.result = "success"
        <- staking.init { store, web3t }
    change-address = ->
        store.staking.add.add-validator = it.target.value
    change-stake = ->
        store.staking.add.add-validator-stake = it.target.value
    velas-node-applied-template = 
        pairs
            |> velas-node-template 
            |> split "\n"
    velas-node-applied-template-line = 
        pairs
            |> velas-node-template
            |> btoa
            |> -> "echo '#{it}' | base64 --decode | sh"
    return null if not pairs.mining?
    show-script = ->
        store.staking.keystore = to-keystore store, yes
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    update-current = (func)-> (data)->
        func data
        <- staking.init { store, web3t }
        store.staking.keystore = to-keystore store, no
    account-left-proxy   = update-current account-left
    account-right-proxy  = update-current account-right
    change-account-index-proxy = update-current change-account-index
    build-template-line = ->
        index = velas-node-applied-template.index-of(it)
        line-style =
            padding: "10px" 
            width: \100%
            margin-bottom: \2px
            background: if index % 2 then 'rgba(255, 255, 255, 0.04)' else ''
        .pug(style=line-style) #{it}
    line-style =
        padding: "10px" 
        width: \100%
    activate = (tab)-> ->
        store.staking.tab = tab 
    activate-line = activate \line
    activate-string = activate \string
    activate-ssh = activate \ssh 
    activate-do = activate \do
    active-class = (tab)->
        if store.staking.tab is tab then 'active' else ''
    active-line = active-class \line
    active-string = active-class \string
    active-ssh = active-class \ssh
    active-do = active-class \do
    get-balance = ->
        wallet =
            store.current.account.wallets 
                |> find -> it.coin.token is \vlx2
        wallet.balance
    get-options = (cb)->
        #err, data <- web3t.velas.Staking.candidateMinStake
        #return cb err if err?
        #min = 
        #    | +store.staking.stake-amount-total >= 1000000 => 1
        #    | _ => data `div` (10^18)
        min = 10000
        max = get-balance! `minus` 0.1
        return cb "You balance is less than minimum staking amount" if +min > + max
        cb null, { min, max }
    use-min = ->
        err, options <- get-options
        return alert store, err, cb if err?
        store.staking.add.add-validator-stake = options.min
    use-max = ->
        err, options <- get-options
        return alert store, err, cb if err?
        store.staking.add.add-validator-stake = options.max
    vote-for-change = ->
        err, can <- web3t.velas.ValidatorSet.emitInitiateChangeCallable
        return alert store, err, cb if err?
        return alert store, "Please wait for epoch change", cb if can isnt yes
        data = web3t.velas.ValidatorSet.emitInitiateChange.get-data!
        #console.log { data }
        to = web3t.velas.ValidatorSet.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount }
        store.current.page = \staking
    your-balance = " #{round-human get-balance!} "
    your-staking-amount = store.staking.stake-amount-total `div` (10^18)
    your-staking = " #{round-human your-staking-amount}"
    vlx-token = "VLX2"
    #calc-reward-click = ->
    #    calc-reward store, web3t
    build-staker = (store, web3t)-> (item)->
        checked = item.checked
        stake = round-human item.stake
        my-stake = 
            | +item.my-stake is 0 => round-human item.withdraw-amount
            | _ => round-human item.my-stake
        index = store.staking.pools.index-of(item) + 1
        choose-pull = ->
            cb = (err, data)->
                alert store, err, console~log if err?
            #store.staking.data-generation += 1
            store.staking.pools |> map (-> it.checked = no)
            item.checked = yes
            store.staking.chosen-pool = item
            claim-stake.calc-reward store, web3t
            staking-address = store.staking.keystore.staking.address
            err, amount <- web3t.velas.Staking.stakeAmount item.address, staking-address
            return cb err if err?
            store.staking.stake-amount-total = amount.to-fixed!
            err, amount <- web3t.velas.Staking.orderedWithdrawAmount store.staking.chosen-pool.address, staking-address
            return cb err if err?
            store.staking.withdraw-amount = amount.to-fixed!
            err, max-withdraw-ordered <- web3t.velas.Staking.maxWithdrawOrderAllowed store.staking.chosen-pool.address, staking-address
            return cb err if err?
            store.staking.max-withdraw-ordered = max-withdraw-ordered.to-fixed!
            err, max-withdraw <- web3t.velas.Staking.maxWithdrawAllowed store.staking.chosen-pool.address, staking-address
            return cb err if err?
            store.staking.max-withdraw = max-withdraw.to-fixed!
            err, last-epoch <- web3t.velas.Staking.orderWithdrawEpoch(store.staking.chosen-pool.address, staking-address)
            return cb "#{err}" if err?
            err, staking-epoch <- web3t.velas.Staking.stakingEpoch
            return cb "#{err}" if err?
            res = staking-epoch `minus` last-epoch
            store.staking.wait-for-epoch-change = if +res is 0 then yes else no
        to-eth = ->
            item.eth = not item.eth
        cut-tx = (tx)->
            return \none if not tx?
            t = tx.to-string!
            r = t.substr(0, 4) + \.. + t.substr(tx.length - 25, 0) + \.. + t.substr(t.length - 4, 4)
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
        tr.pug(class="#{item.status}")
            td.pug 
                span.pug.circle(class="#{item.status}") #{index}
            td.pug(data-column='Staker Address' title="#{ethToVlx item.address}")
                address-holder { store, wallet }
            td.pug(data-column='Amount') #{stake}
            td.pug(data-column="Filled" style=filled-color) #{filled}
            td.pug(data-column='Amount') #{my-stake}
            td.pug(data-column='Stakers') #{item.stakers}
            td.pug
                button { store, on-click: choose-pull , type: \secondary , icon : \arrowRight }
    cancel-pool = ->
        store.staking.chosen-pool = null
    activate = (step)-> ->
        store.current.step = step 
    activate-first = activate \first
    activate-second = activate \second
    activate-third = activate \third
    active-class = (step)->
        if store.current.step is step then 'active' else ''
    active-first = active-class \first
    active-second = active-class \second
    active-third = active-class \third
    refresh = ->
        store.staking.pools.length = 0
        err <- staking.init { store, web3t }
        err <- staking.focus { store, web3t }
    icon-style =
        color: style.app.loader
        margin-top: "10px"
        width: "inherit"
    staker-pool-style =
        max-width: 200px
    .pug.staking-content
        .form-group.pug
            alert-txn { store }
            .pug.section
                .title.pug
                    h3.pug #{lang.select-pool}
                    if not store.staking.chosen-pool?    
                        .pug
                            .loader.pug(on-click=refresh style=icon-style title="refresh")
                                icon \Sync, 25
                if not store.staking.chosen-pool?
                    .description.pug.table-scroll
                        table.pug
                            thead.pug
                                tr.pug
                                    th.pug(width="3%") #
                                    th.pug(width="10%" style=staker-pool-style) #{lang.staker-pool}
                                    th.pug(width="25%") #{lang.total-stake}
                                    th.pug(width="5%" title="When more filled then less award for staker") #{lang.filled}
                                    th.pug(width="25%") #{lang.my-stake}
                                    th.pug(width="5%") #{lang.stakers}
                                    th.pug(width="4%") #{lang.selectPool}
                            tbody.pug
                                store.staking.pools |> map build-staker store, web3t
                else
                    .pug.chosen-pool(title="#{store.staking.chosen-pool}")
                        span.pug
                            | #{ethToVlx store.staking.chosen-pool.address}
                            img.pug.check(src="#{icons.img-check}")
                        .buttons.pug
                            button { store, on-click: cancel-pool , type: \secondary , icon : \choose , text: \ "#{lang.btn-select}" }
            if store.staking.chosen-pool? and +store.staking.stake-amount-total is 0
                .pug.section
                    .title.pug
                        h3.pug #{lang.validator}
                    .description.pug
                        .pug.left
                            label.pug #{lang.stake}
                            input.pug(type='text' value="#{store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="#{lang.stake}")
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) #{lang.min}
                                    button.small.pug(style=button-primary3-style on-click=use-max) #{lang.max}
                                span.pug #{lang.balance}: 
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                        button { store, on-click: become-validator , type: \secondary , icon : \apply , text: \btnApply }
            if store.staking.chosen-pool? and +store.staking.stake-amount-total > 0
                .pug.section
                    .title.pug
                        h3.pug Staking
                    .description.pug
                        .pug.left
                            .pug.balance
                                span.pug Your staking: 
                                span.pug.color #{your-staking}
                                span.pug.color #{vlx-token}
                            hr.pug
                            label.pug Stake More
                            input.pug(type='text' value="#{store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="#{lang.stake}")
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) Min
                                    button.small.pug(style=button-primary3-style on-click=use-max) Max
                                span.pug Your balance: 
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                        button { store, on-click: become-validator , type: \secondary , icon : \apply , text: \btnApply }
            claim-stake store, web3t
            exit-stake store, web3t
staking = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    lightText=
        color: info.app.addressText
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.staking
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") #{lang.delegateStake}
            .pug.close(on-click=goto-search)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            epoch store, web3t
            switch-account store, web3t
        staking-content store, web3t
staking.init = ({ store, web3t }, cb)->
    #store.staking.data-generation += 1
    store.staking.max-withdraw-ordered = 0
    store.staking.max-withdraw = 0
    random = ->
        Math.random!
    store.staking.withdraw-amount = 0
    store.staking.stake-amount-total = 0
    #0x7bcec192f4147867c100ff7e5cd16c6079d6febc - pool 
    #0x30A0AA46d734336473b75A84b962EF61255f6440 - delegatore
    #err, reward-long <- web3t.velas.Staking.getRewardAmount([], "0x7bcec192f4147867c100ff7e5cd16c6079d6febc", "0x30A0AA46d734336473b75A84b962EF61255f6440")
    #return cb err if err?
    #console.log \reward-long , reward-long.to-fixed!
    store.staking.keystore = to-keystore store, no
    store.staking.reward = null
    store.staking.chosen-pool = null
    #exit for now
    #return cb null
    store.staking.add.add-validator-stake = 0
    return cb null if store.staking.pools.length > 0
    err, pools-inactive <- web3t.velas.Staking.getPoolsInactive
    return cb err if err?
    err, pools <- web3t.velas.Staking.getPools
    return cb err if err?
    err, active-pools <- web3t.velas.Staking.getPoolsToBeElected
    return cb err if err?
    store.staking.pools-inactive = pools-inactive
    store.staking.pools-active = active-pools
    all-pools = pools ++ pools-inactive
    store.staking.pools =
        all-pools
            |> unique
            |> map -> { address: it , checked: no, stake: '..', stakers: '..', eth: no, is-validator: '..', status: '', reward-amount: '..', validator-reward-percent: '..', my-stake: '..' }
    err, epoch <- web3t.velas.Staking.stakingEpoch
    store.staking.epoch = epoch.to-fixed!
    #err, amount <- web3t.velas.Staking.stakeAmountTotal(store.staking.keystore.staking.address)
    #store.staking.stake-amount-total = amount.to-fixed!
    cb null
module.exports = staking
human-bool = ->
    if it then 'Yes' else 'No'
fill-pools = ({ store, web3t }, [item, ...rest], cb)->
    staking-address = store.staking.keystore.staking.address
    return cb null if not item?
    err, data <- web3t.velas.Staking.stakeAmountTotal item.address
    return cb err if err?
    item.stake = data `div` (10^18)
    err, delegators <- web3t.velas.Staking.poolDelegators(item.address)
    return cb err if err?
    item.stakers = delegators.length + 1
    err, mining-address <- web3t.velas.ValidatorSet.miningByStakingAddress(item.address)
    return cb err if err?
    item.mining-address = mining-address
    err, validator-reward-percent <- web3t.velas.BlockReward.validatorRewardPercent item.address
    return cb err if err?
    item.validator-reward-percent = validator-reward-percent `div` 10000
    err, is-validator-banned <- web3t.velas.ValidatorSet.isValidatorBanned(mining-address)
    return cb err if err?
    err, amount <- web3t.velas.Staking.stakeAmount item.address, staking-address
    return cb err if err?
    err, withdraw-amount <- web3t.velas.Staking.orderedWithdrawAmount item.address, staking-address
    return cb err if err?
    item.withdraw-amount = withdraw-amount `div` (10^18)
    item.my-stake = amount `div` (10^18)
    item.status =
        | is-validator-banned => \banned
        | store.staking.pools-active.index-of(item.address) > -1 => \active
        | store.staking.pools-inactive.index-of(item.address) > -1 => \inactive
        | _ => \pending
    fill-pools { store, web3t }, rest, cb
staking.focus = ({ store, web3t }, cb)->
    #return cb null if store.staking.pools.0.stake isnt '...'
    err <- fill-pools { store, web3t }, store.staking.pools
    cb null
#V31V1kD7DpT9eoRcdXf7T1fbFqcNh