require! {
    \react
    \react-dom
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \prelude-ls : { map, split, filter, find, foldl }
    \../math.ls : { div, times, plus, minus }
    \../velas/velas-web3.ls
    \../velas/velas-node-template.ls
    \../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \../menu-funcs.ls
    \btoa
    \safe-buffer : { Buffer }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../address-link.ls : { get-address-link, get-address-title }
    \../round5.ls
    \../round-human.ls
    \../../web3t/addresses.js : { ethToVlx }
    \./switch-account.ls
    \../icons.ls
    \./exit-stake.ls
}
.staking
    @import scheme
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
            margin: 15px 0
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
                @media (max-width: 800px)
                    display: flow-root
                    padding: 20px
                &:last-child
                    border: 0
                &.reward
                    background-image: url("data:image/png;base64,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")
                    background-repeat: no-repeat
                    background-position: 16%
                    background-size: auto
                    background-color: rgba(111, 50, 162, 0.15)
                    @media(max-width: 800px)
                        background-position: 5%
                    @media(max-width: 540px)
                        background-image: none
                .title
                    padding: 0px
                    width: 30%
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
                    width: 70%
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
                            &.green
                                color: green
                    &.table-scroll
                        overflow-x: scroll
                        max-height: 200px
                        background: linear-gradient(#321260 30%, rgba(50, 18, 96, 0)), linear-gradient(rgba(50, 18, 96, 0), #321260 70%) 0 100%, radial-gradient(farthest-side at 50% 0, #594aaa, rgba(0, 0, 0, 0)), radial-gradient(farthest-side at 50% 100%, #594aaa, rgba(0, 0, 0, 0)) 0 100%
                        background-repeat: no-repeat
                        background-attachment: local, local, scroll, scroll
                        background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                        animation: breathe 3s ease-in infinite
                        -moz-transition: breathe 3s ease-in infinite
                        -web-kit-transition: breathe 3s ease-in infinite
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
                        &:nth-child(2)
                            width: 25%
                        &:nth-child(3)
                            width: 45%
                        &:nth-child(4)
                            width: 15%
                    td, th
                        padding: 10px
                        border: 1px solid rgba(240, 237, 237, 0.16)
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
                            &.icon-svg
                                height: 12px
                                width: auto
                                padding-right: 5px
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
    .warning
        border: 1px solid orange
        padding: 5px
        color: 1px solid orange
        background: rgba(orange, 0.1)
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
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 130px
        margin-top: 10px
        padding: 0 6px
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
    staking = get-pair wallet, \m0 , index, password, no
    mining  = get-pair wallet, \m0/2 , index, password, with-keystore
    { staking, mining, password }
show-validator = (store, web3t)-> (validator)->
    li.pug #{validator}
calc-reward-epoch = (store, web3t, [epoch, ...epochs], cb)->
    mining-address =  store.staking.keystore.mining.address
    return cb null, [] if not epoch?
    err, reward-long <- web3t.velas.BlockReward.getValidatorReward(epoch, mining-address)
    return cb err if err?
    err, rest <- calc-reward-epoch store, web3t, epochs
    return cb err if err?
    reward = reward-long `div` (10^18)
    all = [{ epoch, reward, checked: yes }] ++ rest
    cb null, all
calc-reward = (store, web3t)->
    cb = (err, data)->
        store.staking.reward-loading = no
    store.staking.reward-loading = yes
    mining-address =  store.staking.keystore.mining.address
    staking-address = store.staking.keystore.staking.address
    err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(staking-address, staking-address)
    #console.log { epochs }
    return cb err if err?
    err, rewards <- calc-reward-epoch store, web3t ,epochs
    reward =
        rewards |> map (.reward) |> foldl plus, 0
    return cb err if err?
    store.staking.reward = round5 reward
    store.staking.reward-claim = store.staking.reward
    store.staking.rewards = rewards
    store.staking.rewards |> map (-> it.checked = yes)
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
        reward =
            store.staking.rewards
                |> filter (.checked) 
                |> map (.reward)
                |> foldl plus, 0
        store.staking.reward-claim = round5 reward
    tr.pug
        td.pug
            input.pug(type='checkbox' checked=checked on-change=check)
        td.pug #{item.epoch}
        td.pug(title="#{item.reward}") #{round-human item.reward}
staking-content = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
        overflow-x: \auto
        margin-top: \10px
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    filter-icon=
        filter: style.app.filterIcon
    comming-soon =
        opacity: ".3"
    pairs = store.staking.keystore
    become-or-extend-validator = (stake, pairs, cb)->
        err, pool <- web3t.velas.Staking.getStakerPools(pairs.staking.address)
        return cb err if err?
        console.log pool
        return cb null, web3t.velas.Staking.add-pool.get-data(stake, pairs.mining.address) if pool.length is 0
        cb null, web3t.velas.Staking.stake.get-data(pairs.staking.address, stake)
    become-validator = ->
        stake = store.staking.add.add-validator-stake `times` (10^18)
        #console.log stake, pairs.mining.address
        #data = web3t.velas.Staking.stake.get-data pairs.staking.address, stake
        err, data <- become-or-extend-validator stake, pairs
        return alert "#{err}" if err?
        to = web3t.velas.Staking.address
        #console.log \to, { to, data, amount }
        amount = store.staking.add.add-validator-stake
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
    #claim = ->
    #    staking-address = store.staking.keystore.staking.address
    #    mining-address =  store.staking.keystore.mining.address
    #    err, epochs <- web3t.velas.BlockReward.epochsPoolGotRewardFor(mining-address)
    #    #console.log { epochs }
    #    err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(staking-address, staking-address)
    #    #console.log { epochs }
    #    return alert err if err?
    #    data = web3t.velas.Staking.claimReward.get-data(epochs, staking-address)
    #    to = web3t.velas.Staking.address
    #    amount = 0
    #    err <- web3t.vlx2.send-transaction { to, data, amount, gas: 1600000, gas-price: 1000000 }
    exit = ->
        staking-address = store.staking.keystore.staking.address
        #err, data <- web3t.velas.Staking.maxWithdrawAllowed store.staking.chosen-pool.address, staking-address 
        #res = data `minus` store.staking.stake-amount-total 
        #console.log { res }
        #return alert "Not allowed to claim `#{store.staking.stake-amount-total}`. Only allowed #{data.to-fixed!}" if +res < 0
        err, last-epoch <- web3t.velas.Staking.orderWithdrawEpoch(staking-address, staking-address)
        return alert "#{err}" if err?
        err, staking-epoch <- web3t.velas.Staking.stakingEpoch
        return alert "#{err}" if err?
        res = staking-epoch `minus` last-epoch
        return alert "Please wait for epoch change" if +res is 0
        data =
            | +store.staking.withdraw-amount > 0 => web3t.velas.Staking.claimOrderedWithdraw.get-data(store.staking.chosen-pool.address)
            | _ => web3t.velas.Staking.order-withdraw.get-data(staking-address, store.staking.stake-amount-total)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 1600000, gas-price: 1000000 }
    get-balance = ->
        wallet =
            store.current.account.wallets 
                |> find -> it.coin.token is \vlx2
        wallet.balance
    get-options = (cb)->
        err, data <- web3t.velas.Staking.candidateMinStake
        return cb err if err?
        min = 
            | +store.staking.stake-amount-total >= 1000000 => 1
            | _ => data `div` (10^18)
        max = get-balance! `minus` 0.1
        return cb "You balance is less than minimum staking amount" if +min > + max
        cb null, { min, max }
    use-min = ->
        err, options <- get-options
        return alert err if err?
        store.staking.add.add-validator-stake = options.min
    use-max = ->
        err, options <- get-options
        return alert err if err?
        store.staking.add.add-validator-stake = options.max
    vote-for-change = ->
        err, can <- web3t.velas.ValidatorSet.emitInitiateChangeCallable
        return alert err if err?
        return alert "Please wait for epoch change" if can isnt yes
        data = web3t.velas.ValidatorSet.emitInitiateChange.get-data!
        console.log { data }
        to = web3t.velas.ValidatorSet.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount }
        store.current.page = \staking
    img=
        node: "data:image/png;base64,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"
    image-token = "data:image/png;base64,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"
    your-balance = " #{round-human get-balance!} "
    your-staking-amount = store.staking.stake-amount-total `div` (10^18)
    your-staking = " #{round-human your-staking-amount}"
    vlx-token = "VLX"
    calc-reward-click = ->
        calc-reward store, web3t
    claim = ->
        epochs =
            store.staking.rewards
                |> filter (.checked) 
                |> map (.epoch)
        staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimReward.get-data(epochs, staking-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 1600000, gas-price: 1000000 }
    staker-status = if store.staking.is-active-staker then 'Active' else 'Inactive'
    .pug.staking-content
        .form-group.pug
            .pug.section
                .title.pug
                    h3.pug #{lang.install-node}
                .description.pug
                    .pug.left-node
                        img.pug(src="#{img.node}")
                    .pug.right-node
                        .pug #{lang.txt-install-node}
                        br.pug
                        .pug 
                            span.important.pug #{lang.important}: 
                            | #{lang.important-dont}
                        if pairs.mining.keystore.length is 0
                            .pug
                                .pug.btn
                                    button.pug(style=button-primary2-style on-click=show-script)
                                        span.pug
                                            img.icon-svg.pug(src="#{icons.generate}")
                                            | #{lang.generate-script}
                                .pug #{lang.pls-allow}
                    if pairs.mining.keystore.length > 0 or window.location.href.index-of('dev') > -1
                        .pug
                            .pug.tabs
                                span.tab.pug(on-click=activate-line class="#{active-line}") #{lang.line-by-line}
                                span.tab.pug(on-click=activate-string class="#{active-string}") #{lang.as-one}
                                span.tab.pug(on-click=activate-ssh class="#{active-ssh}") #{lang.install-ssh}
                                span.tab.pug(on-click=activate-do class="#{active-do}") #{lang.install-do}
                            if active-line is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="#{velas-node-applied-template.join('\n')}" on-copy=copied-inform(store) style=filter-icon)
                                            copy store
                                    velas-node-applied-template |> map build-template-line
                            if active-string is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="#{velas-node-applied-template-line}" on-copy=copied-inform(store) style=filter-icon)
                                            copy store
                                    .pug(style=line-style)
                                        velas-node-applied-template-line
                            if active-ssh is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="some code" on-copy=copied-inform(store) style=filter-icon)
                                            copy store
                                    .pug(style=line-style)
                                        | Comming Soon
                                        span.cursor.pug |
                            if active-do is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="some code" on-copy=copied-inform(store) style=filter-icon)
                                            copy store
                                    .pug(style=line-style)
                                        | Comming Soon
                                        span.cursor.pug |
            if store.staking.is-active-staker is no
                .pug.section
                    .title.pug
                        h3.pug #{lang.check-node}
                    .description.pug
                        .pug.left
                            ol.pug
                                li.pug #{lang.check-node1}
                                li.pug #{lang.check-node2}
                                li.pug #{lang.check-node3}
                                li.pug #{lang.check-node4}
            if +store.staking.stake-amount-total is 0
                .pug.section
                    .title.pug
                        h3.pug #{lang.validator}
                    .description.pug
                        .pug.left
                            label.pug #{lang.stake}
                            input.pug(type='text' value="#{round5 store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="#{lang.stake-placeholder}")
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) Min
                                    button.small.pug(style=button-primary3-style on-click=use-max) Max
                                span.pug #{lang.your-balance}: 
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{image-token}")
                                    span.pug.color #{vlx-token}
                        button.pug(style=button-primary2-style on-click=become-validator)
                            span.pug
                                img.icon-svg.pug(src="#{icons.apply}")
                                | #{lang.btn-apply}
            if +store.staking.stake-amount-total > 0
                .pug.section
                    .title.pug
                        h3.pug #{lang.your-staking}
                    .description.pug
                        .pug.left
                            .pug.balance
                                span.pug #{lang.your-staking}: 
                                span.pug.color #{your-staking}
                                span.pug.color.green #{vlx-token}
                            .pug.balance
                                span.pug #{lang.your-status}:
                                span.pug.color.green #{staker-status}
                            if store.staking.is-active-staker is no
                                .pug.warning
                                    ol.pug
                                        li.pug #{lang.your-status1}
                                        li.pug #{lang.your-status2}
                            .pug.balance
                                span.pug #{lang.current-epoch}:
                                span.pug.color.green #{store.staking.epoch}
                            hr.pug
                            label.pug #{lang.stake-more}
                            input.pug(type='text' value="#{round5 store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="#{lang.stake-placeholder}")
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) Min
                                    button.small.pug(style=button-primary3-style on-click=use-max) Max
                                span.pug Your balance: 
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{image-token}")
                                    span.pug.color #{vlx-token}
                        button.pug(style=button-primary2-style on-click=become-validator)
                            span.pug
                                img.icon-svg.pug(src="#{icons.apply}")
                                | #{lang.btn-apply}      
            if window.location.href.index-of('emit') > -1
                .pug.section
                    .title.pug
                        h3.pug #{lang.emit-change}
                    .description.pug
                        .pug.pad-bottom #{lang.propose}
                        button.pug(style=button-primary2-style on-click=vote-for-change)
                            span.pug
                                img.icon-svg.pug(src="#{icons.emit}")
                                | #{lang.emit}
            if +store.staking.stake-amount-total > 0
                .pug.section.reward
                    .title.pug
                        h3.pug #{lang.u-rewards} 
                    .description.pug
                        if store.staking.reward?
                            .pug
                                .pug.balance
                                    span.pug #{lang.available-reward}: 
                                    span.color.pug #{store.staking.reward}
                                    img.label-coin.pug(src="#{image-token}")
                                    span.color.pug  VLX
                                .pug.claim-table
                                    table.pug
                                        tr.pug
                                            td.pug #{lang.use}
                                            td.pug #{lang.epoch}
                                            td.pug #{lang.award}
                                        store.staking.rewards |> map build-claim-reward store, web3t
                                .pug.balance
                                    span.pug #{lang.claim-reward}: 
                                    span.color.pug #{store.staking.reward-claim}
                                    img.label-coin.pug(src="#{image-token}")
                                    span.color.pug  VLX
                                button.pug(on-click=claim style=button-primary2-style)
                                    span.pug
                                        img.icon-svg.pug(src="#{icons.reward}")
                                        | #{lang.claim-reward}
                        else if store.staking.reward-loading is yes
                            .pug Loading... Please wait
                        else
                            button.mt-0.pug(style=button-primary2-style on-click=calc-reward-click)
                                span.pug
                                    img.icon-svg.pug(src="#{icons.calculate}")
                                    | #{lang.calculate-reward}
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
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    lightText=
        color: info.app.addressText
    .pug.staking
        .pug.title(style=border-style)
            .pug.header #{lang.title-staking}
            .pug.close(on-click=goto-search)
                icon "ChevronLeft", 20
            switch-account store, web3t
        staking-content store, web3t
staking.init = ({ store, web3t }, cb)->
    store.staking.keystore = to-keystore store, no
    store.staking.chosen-pool =
        address: store.staking.keystore.staking.address
    store.staking.reward = null
    store.staking.withdraw-amount = 0
    #exit for now
    #return cb null
    err, amount <- web3t.velas.Staking.orderedWithdrawAmount store.staking.keystore.staking.address, store.staking.keystore.staking.address
    return cb err if err?
    err, last-epoch <- web3t.velas.Staking.orderWithdrawEpoch(store.staking.chosen-pool.address, staking-address)
    return alert "#{err}" if err?
    err, staking-epoch <- web3t.velas.Staking.stakingEpoch
    return alert "#{err}" if err?
    res = staking-epoch `minus` last-epoch
    store.staking.wait-for-epoch-change = if +res is 0 then yes else no
    store.staking.withdraw-amount = amount.to-fixed!
    store.staking.add.add-validator-stake = 0
    err, epoch <- web3t.velas.Staking.stakingEpoch
    store.staking.epoch = epoch.to-fixed!
    err, amount <- web3t.velas.Staking.stakeAmount(store.staking.keystore.staking.address, store.staking.keystore.staking.address)
    store.staking.stake-amount-total = amount.to-fixed!
    err, is-active <- web3t.velas.Staking.isPoolActive(store.staking.keystore.staking.address)
    return cb err if err? 
    store.staking.is-active-staker = is-active
    cb null
module.exports = staking
staking.focus = ({ store, web3t }, cb)->
    calc-reward store, web3t
    cb null
#V31V1kD7DpT9eoRcdXf7T1fbFqcNh