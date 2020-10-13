require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \prelude-ls : { map, split, filter }
    \../math.ls : { div, times, plus }
    \../velas/velas-node-template.ls
    \../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \../menu-funcs.ls
    \btoa
    \safe-buffer : { Buffer }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \./switch-account.ls
    \../icons.ls
    \./placeholder.ls
    \./epoch.ls
    \./alert-demo.ls
    \../seed.ls : seedmem
    \../components/burger.ls
}
.staking-res
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: $left-margin
    top: 0
    height: auto
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    .staking-content
        overflow: hidden
        background: transparent
        width: 100%
        border-radius: 0px
        position: relative
        box-sizing: border-box
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
                                background: #ca912e
                            &:before
                                content: ""
                                background: #e25f5d
                            &:after
                                content: ""
                                background: #3ec930
                            span, &:before, &:after
                                display: inline-block
                                float: left
                                width: 1em
                                height: 1em
                                border-radius: 50%
                                margin-right: 0.5em
                    .balance
                        font-weight: 600
                        font-size: 16px
                        span:first-child
                            color: orange
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
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 130px
        border: 0
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
        &.btn-width
            width: auto
            padding: 0 10px
        &:hover
            background: transparent
            color: $primary
        &.link
            min-width: 190px
    >.title
        position: sticky
        position: -webkit-sticky
        z-index: 1
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
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
    seed = bip39.mnemonic-to-seed(seedmem.mnemonic)
    wallet = hdkey.from-master-seed(seed)
    index = store.current.account-index
    password = md5 wallet.derive-path("m1").derive-child(index).get-wallet!.get-address!.to-string(\hex)
    staking = get-pair wallet, \m0 , index, password, no
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
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
        margin: "0"
    filter-icon=
        filter: style.app.filterIcon
    comming-soon =
        opacity: ".3"
    pairs = store.staking.keystore
    become-validator = ->
        stake = store.staking.add.add-validator-stake `times` (10^18)
        #console.log stake, pairs.mining.address
        #data = web3t.velas.Staking.stake.get-data pairs.staking.address, stake
        data = web3t.velas.Staking.add-pool.get-data stake, pairs.mining.address
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
    calc-reward-epoch = ([epoch, ...epochs], cb)->
        mining-address =  store.staking.keystore.mining.address
        return cb null, 0 if not epoch?
        err, reward <- web3t.velas.BlockReward.getValidatorReward(epoch, mining-address)
        return cb err if err?
        err, rest <- calc-reward-epoch epochs
        return cb err if err?
        all = reward `plus` rest
        cb null, all
    calc-reward = ->
        cb = alert
        mining-address =  store.staking.keystore.mining.address
        staking-address = store.staking.keystore.staking.address
        err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(staking-address, mining-address)
        return cb err if err?
        err, reward <- calc-reward-epoch epochs
        return cb err if err?
        store.staking.reward = reward
    claim = ->
        staking-address = store.staking.keystore.staking.address
        mining-address =  store.staking.keystore.mining.address
        err, epochs <- web3t.velas.BlockReward.epochsPoolGotRewardFor(mining-address)
        #console.log { epochs }
        err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(staking-address, mining-address)
        #console.log { epochs }
        return alert err if err?
        data = web3t.velas.Staking.claimReward.get-data(epochs, staking-address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount }
    exit = ->
        staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.withdraw.get-data(staking-address, store.staking.add.add-validator-stake)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount }
    .pug.staking-content
        #placeholder store, web3t
        .form-group.pug
            .pug.section
                .title.pug
                    h3.pug Install Node
                .description.pug
                    .pug.left-node
                        img.pug(src="#{icons.img-node}")
                    .pug.right-node
                        .pug This script automatically deploys your node through the terminal. Also, it uses addresses associated with your current account to manage the node in the wallet.
                        br.pug
                        .pug 
                            span.important.pug Important: 
                            | Do not transfer this script to anyone, as it is generated in your wallet, using personal wallet data.
                        if pairs.mining.keystore.length is 0
                            .pug
                                .pug.btn
                                    button.btn-width.pug(style=button-primary2-style on-click=show-script)
                                        span.pug
                                            img.icon-svg.pug(src="#{icons.generate}")
                                            | Generate Script
                                .pug Please allow 30 seconds
                    if pairs.mining.keystore.length > 0 or store.url-params.dev?
                        .pug
                            .pug.tabs
                                span.tab.pug(on-click=activate-line class="#{active-line}") Line by Line
                                span.tab.pug(on-click=activate-string class="#{active-string}") As one single string
                                span.tab.pug(on-click=activate-ssh class="#{active-ssh}") Install via ssh
                                span.tab.pug(on-click=activate-do class="#{active-do}") Install on Digital Ocean
                            if active-line is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="#{velas-node-applied-template}" on-copy=copied-inform(store) style=filter-icon)
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
            .pug.section
                .title.pug
                    h3.pug Become Validator
                .description.pug
                    .pug.left
                        label.pug Your Mining Address
                        input.pug(type='text' value="#{pairs.mining.address}" readonly="readonly" style=input-style placeholder="mining address")
                    .pug.left
                        label.pug Your Stake (VLX)
                        input.pug(type='text' value="#{store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="stake")
                    button.pug(style=button-primary2-style on-click=become-validator)
                        span.pug
                            img.icon-svg.pug(src="#{icons.apply}")
                            | Apply
            if store.staking.validators.pending.length > 0
                .pug.section
                    .title.pug
                        h3.pug Pending Validators
                    .description.pug
                        ul.pug
                            store.staking.validators.pending |> filter (-> store.staking.validators.active.index-of(it) is -1) |> map show-validator store, web3t
            .pug.section
                .title.pug
                    h3.pug Active Validators. Current epoch: #{store.staking.epoch}
                .description.pug
                    ul.pug
                        store.staking.validators.active |> map show-validator store, web3t
            .pug.section
                .title.pug
                    h3.pug Your Rewards 
                .description.pug
                    if store.staking.reward?
                        .pug
                            .pug.balance
                                span.pug #{store.staking.reward}
                                span.pug  VLX
                            button.pug(style=button-primary2-style on-click=claim)
                                span.pug
                                    img.icon-svg.pug(src="#{icons.reward}")
                                    | Claim Reward
                    else
                        button.btn-width.pug(style=button-primary2-style on-click=calc-reward)
                            span.pug
                                img.icon-svg.pug(src="#{icons.calculate}")
                                | Calculate Reward
            .pug.section
                .title.pug
                    h3.pug Account Index
                .description.pug
                    .switch-index.pug
                        span.pug.button.left-proxy(on-click=account-left-proxy style=button-primary2-style)
                            icon \ChevronLeft, 15
                        span.pug.bold
                            input.pug.change-index(value="#{store.current.account-index}" style=input-style on-change=change-account-index-proxy)
                        span.pug.button.right-proxy(on-click=account-right-proxy style=button-primary2-style)
                            icon \ChevronRight, 15
            .pug.section
                .title.pug
                    h3.pug Exit from Validator Pool
                .description.pug
                    button.pug(style=button-primary4-style on-click=exit)
                        span.pug
                            img.icon-svg.pug(src="#{icons.exit}")
                            | Exit
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
        background: info.app.background
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
        color: info.app.color3
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.staking-res
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") Resource Staking
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        staking-content store, web3t
staking.init = ({ store, web3t }, cb)->
    store.staking.keystore = to-keystore store, no
    #exit for now
    #return cb null
    err, data <- web3t.velas.Staking.candidateMinStake
    return cb err if err?
    store.staking.add.add-validator-stake = data `div` (10^18)
    err, data <- web3t.velas.ValidatorSet.getValidators
    return cb err if err?
    store.staking.validators.active = data
    err, data <- web3t.velas.ValidatorSet.getPendingValidators
    return cb err if err?
    store.staking.validators.pending = data
    err, epoch <- web3t.velas.Staking.stakingEpoch
    store.staking.epoch = epoch.to-fixed!
    cb null
module.exports = staking