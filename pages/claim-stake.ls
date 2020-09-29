require! {
    \react
    \../get-lang.ls
    \../round5.ls
    \../icons.ls
    \../get-primary-info.ls
    \../math.ls : { div, times, plus, minus }
    \prelude-ls : { map, split, filter, find, foldl, drop, take }
    \../round-human.ls
    \../components/button.ls
}
.section-reward
    @import scheme
    border-bottom: 1px solid rgba(240, 237, 237, 0.16)
    padding: 30px 20px
    display: flex
    .staking-reward
        display: block
        max-height: 424px
        overflow-y: auto
        scrollbar-width: none
        margin-top: 0
        display: flex
        flex-wrap: wrap
        margin-right: -5px
        margin-left: -5px
        .value
            font-size: 12px
            text-transform: uppercase
            font-weight: 400
            color: white
            text-align: center
            input[type="checkbox"]
                margin-bottom: 10px
            &.green
                color: rgb(60, 213, 175)
                text-align: center
            .label
                color: slategrey
                font-size: 10px
                margin-top: 0
        .header
            font-size: 12px
            text-transform: uppercase
            font-weight: 400
            margin-top: 10px
            text-align: center
            overflow: hidden
            text-overflow: ellipsis
            &.label
                color: slategrey
                font-size: 10px
                margin-top: 0
        .col
            box-sizing: border-box
            padding: 0 5px
            margin-bottom: 10px
            &.col-4
                display: inline-block
                -webkit-box-flex: 0
                flex: 0 0 20%
                max-width: 20%
                @media(max-width: 992px)
                    -webkit-box-flex: 0
                    flex: 0 0 33%
                    max-width: 33%
                @media(max-width: 400px)
                    -webkit-box-flex: 0
                    flex: 0 0 50%
                    max-width: 50%
            > div
                background: #3b1771
                padding: 15px
                border-radius: $border
    .claim-table
        margin: 0
        table
            height: 300px !important
    button
        float: left
        background-color: #6595F5
        border: 1px solid #6595F5
        border-radius: $border
        color: white
        height: 36px
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
        @media (max-width: 800px)
            margin: 10px auto
            float: none
    @media (max-width: 800px)
        display: flow-root
        padding: 20px
    &:last-child
        border: 0
    &.reward
        background-image: $reward
        background-repeat: no-repeat
        background-position: 10% 20%
        background-size: auto
        background-color: var(--bg-secondary)
        @media(max-width: 800px)
            background-image: none
        @media(max-width: 540px)
            background-image: none
    .title
        padding: 0px
        width: 30%
        text-align: left
        text-transform: uppercase
        font-size: 14px
        h3
            font-size: 12px
            text-transform: uppercase
            letter-spacing: 2px
            opacity: .8
            font-weight: 400
            margin: 0
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
        .table
            width: 240px
            height: 240px
            .balance
                text-align: right
                .header
                    float: left
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
            height: 200px
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
            margin-bottom: 5px
            span
                margin-right: 5px
                &.green
                    color: #3cd5af
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
get-checked-amount = (store)->
    store.staking.rewards
        |> filter (.checked)
        |> map (.reward)
        |> foldl plus, 0
calc-reward-epoch = (store, web3t, check, [item, ...items], cb)->
    mining-address =  store.staking.keystore.mining.address
    return cb null if not item?
    staking-address = store.staking.keystore.staking.address
    pool-address = store.staking.chosen-pool.address
    err, reward-long <- web3t.velas.Staking.getRewardAmount([item.epoch], pool-address, staking-address)
    return cb err if err?
    next-check = check - 1
    return cb null if next-check < 0
    err, rest <- calc-reward-epoch store, web3t, next-check, items
    return cb err if err?
    item.reward = reward-long `div` (10^18)
    item.checked = +store.staking.epoch isnt +item.epoch and check > 0
    cb null
calc-next-reward = (store, web3t, cb)->
    unloaded =
        store.staking.rewards |> filter -> it.reward is '..'
    err <- calc-reward-epoch store, web3t , 15, unloaded
    return cb err if err?
    reward =
        store.staking.rewards
            |> filter (.reward isnt '..')
            |> map (.reward)
            |> foldl plus, 0
    store.staking.reward = round5 reward
    store.staking.reward-claim = round5 get-checked-amount store
    cb null
calc-reward = (store, web3t)->
    cb = (err, data)->
        store.staking.reward-loading = no
    store.staking.reward-loading = yes
    mining-address =  store.staking.keystore.mining.address
    staking-address = store.staking.keystore.staking.address
    err, epochs <- web3t.velas.BlockReward.epochsToClaimRewardFrom(store.staking.chosen-pool.address, staking-address)
    return cb err if err?
    epochs = epochs.sort((a,b) -> a.compared-to b)
    store.staking.rewards =
        epochs |> map -> { epoch: it, reward: '..', checked: no }
    err <- calc-next-reward store, web3t
    return cb err if err?
    cb null
build-claim-reward = (store, web3t)-> (item)->
    style = get-primary-info store
    lang = get-lang store
    box-background =
        background: style.app.bg-primary-light
    checked = item.checked
    load-or-skip = (item, cb)->
        return cb null if item.reward isnt '..'
        err <- calc-reward-epoch store, web3t, 1, [item]
        return cb err if err?
        item.checked = no
        cb null
    check = ->
        err <- load-or-skip item
        item.checked = not item.checked
        store.staking.reward-claim = round5 get-checked-amount store
    .col.col-4.pug
        .pug(style=box-background)
            .value.pug
                input.pug(type='checkbox' checked=checked on-change=check)
                .number.pug
                    span.pug #{item.epoch}
                .number.label.pug
                    span.pug #{lang.epoch}
            .header.pug(title="#{item.reward}") #{round-human item.reward}
            .header.label.pug #{lang.award}
module.exports = (store, web3t)->
    return null if not store.staking.chosen-pool? or +store.staking.stake-amount-total is 0
    check-uncheck = ->
        change = not store.staking.rewards.0.checked
        store.staking.rewards |> map (-> it.checked = change)
    style = get-primary-info store
    lang = get-lang store
    calc-reward-click = ->
        calc-reward store, web3t
    claim = ->
        epochs =
            store.staking.rewards
                |> filter (.checked)
                |> map (.epoch)
        max = 25
        rest = epochs.length - max
        return alert lang.epochLength.replace("^", max).replace('^', rest) if rest > 0
        #staking-address = store.staking.keystore.staking.address
        data = web3t.velas.Staking.claimReward.get-data(epochs, store.staking.chosen-pool.address)
        to = web3t.velas.Staking.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 9600000, gas-price: 1000000 }
    bg=
        background-image: if store.staking.reward-loading is yes then 'none' else ' '
    .pug.section-reward.reward(style=bg)
        .title.pug
            h3.pug #{lang.u-rewards}
        .description.pug
            if store.staking.reward?
                .pug
                    .pug.balance
                        span.pug #{lang.available-reward}:
                        span.color.pug #{store.staking.reward}
                        img.label-coin.pug(src="#{icons.vlx-icon}")
                        span.color.pug  VLX2
                    .pug.staking-reward
                        store.staking.rewards |> map build-claim-reward store, web3t
                    .pug.balance
                        span.pug #{lang.claim-reward}:
                        span.color.pug #{store.staking.reward-claim}
                        img.label-coin.pug(src="#{icons.vlx-icon}")
                        span.color.pug  VLX2
                    button { store, on-click: claim , icon : \reward , text : \claimReward , type : \secondary }
            else if store.staking.reward-loading is yes
                .pug.placeholder Loading... Please wait
            else
                button { store, on-click: calc-reward-click , icon : \calculate , text : \calculateReward , type : \secondary }
module.exports.calc-reward = calc-reward