require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \prelude-ls : { map, split, filter, find, foldl }
    \../math.ls : { div, times, plus, minus }
    \../velas/velas-node-template.ls
    \../../web3t/providers/deps.js : { hdkey, bip39 }
    \md5
    \../menu-funcs.ls
    \btoa
    \safe-buffer : { Buffer }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../round5.ls
    \../round-human.ls
    \../../web3t/addresses.js : { ethToVlx }
    \./switch-account.ls
    \../icons.ls
    \./exit-stake.ls
    \./placeholder.ls
    \./claim-stake.ls
    \../staking/can-make-staking.ls
    \mobx : { transaction }
    \./epoch.ls
    \../components/button.ls
    \./alert-txn.ls
    \../components/amount-field.ls
    \../seed.ls : seedmem
    \../components/burger.ls
}
.staking
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
    .pad
        padding: 0 5px
    .pad-bottom
        padding-bottom: 5px
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
        .input-area
            margin: 10px 0
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
                    @media (max-width: 800px)
                        padding-bottom: $ios-m-b
                &.reward
                    background-image: $reward
                    background-repeat: no-repeat
                    background-position: 16% 20%
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
                    .table
                        width: 240px
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
                                border-radius: $border
                                line-height: 10px
                                text-align: center
                                height: 16px
                                font-size: 10px
                                font-weight: 600
                                margin-top: 0
                                width: auto
                                border-radius: 5px
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
                            opacity: 0.6;
                            text-align: center
                            border-right: 1px solid
                            line-height: 37px
                            text-transform: uppercase
                            font-size: 10px
                            font-weight: bold
                            cursor: pointer
                            height: 36px
                            background: var(--dark-theme)
                            border-color: #ffffff21
                            box-sizing: border-box
                            &:first-child
                                border-radius: $border 0 0 $border
                            &:last-child
                                border-radius: 0 $border $border 0
                                border-right: 0
                            @media (max-width: 800px)
                                width: 50%
                            &.active
                                opacity: 1
                                border-bottom: 0
                                background: var(--dark-theme)
                    .btn
                        margin: 10px 0
                    .code
                        overflow: scroll
                        background: #1b1b1b
                        text-align: left
                        border-radius: $border
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
                border-radius: $border
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
        background: rgba(orange, 0.1)
        margin: 10px 0
        display: inline-block
    ol
        padding: 0 25px
        margin: 5px 0
    ul
        padding: 0
        margin: 0
        min-width: 100%
        max-width: 300px
        li
            list-style: none
            margin-left: 0
            font-size: 13px
            font-size: 14px
            margin-bottom: 5px
            list-style-position: inside
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
        &.btn-width
            width: auto
            padding: 0 10px
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
    .staking-info
        display: block
        overflow-y: scroll
        scrollbar-width: none
        margin-top: 0
        display: flex
        flex-wrap: wrap
        margin-right: -5px
        margin-left: -5px
        .value
            color: orange
            text-align: center
            &.green
                color: rgb(60, 213, 175)
                text-align: center
        .header
            font-size: 12px
            text-transform: uppercase
            letter-spacing: 2px
            opacity: .8
            font-weight: 400
            margin-top: 10px
            text-align: center
        .col
            box-sizing: border-box
            padding: 0 5px
            margin-bottom: 10px
            &.col-4
                -webkit-box-flex: 0
                flex: 0 0 25%
                max-width: 25%
                @media(max-width: 992px)
                    -webkit-box-flex: 0
                    flex: 0 0 50%
                    max-width: 50%
                @media(max-width: 400px)
                    -webkit-box-flex: 0
                    flex: 0 0 100%
                    max-width: 100%
            > div
                padding: 30px 20px
    .staking-reward
        display: block
        overflow-y: scroll
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
    .section-reward
        @import scheme
        border-bottom: 1px solid rgba(240, 237, 237, 0.16)
        padding: 30px 20px
        display: flex
        button
            float: left
            background-color: #6595F5
            border: 1px solid #6595F5
            border-radius: 0px
            color: white
            height: 36px
            width: auto
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
            background-position: 16% 20%
            background-size: auto
            background-color: rgba(111, 50, 162, 0.15)
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
                        background: var(--bg-secondary)
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
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    button-primary4-style=
        border: "0"
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
        console.log \pools, pool
        if +store.staking.stake-amount-total is 0
            return cb null, web3t.velas.Staking.add-pool.get-data(stake, pairs.mining.address)
        return cb null, web3t.velas.Staking.stake.get-data(pairs.staking.address, stake)
        #if pool.length is 0
        #cb null, web3t.velas.Staking.stake.get-data(pairs.staking.address, stake)
    become-validator = ->
        err <- can-make-staking store, web3t
        return alert err if err?
        stake = store.staking.add.add-validator-stake `times` (10^18)
        #console.log stake, pairs.mining.address
        #data = web3t.velas.Staking.stake.get-data pairs.staking.address, stake
        err, data <- become-or-extend-validator stake, pairs
        return alert "#{err}" if err?
        to = web3t.velas.Staking.address
        #console.log \to, { to, data, amount }
        amount = store.staking.add.add-validator-stake
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
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
    hide-script = ->
        pairs.mining.keystore = ""
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
        err, data <- web3t.velas.Staking.candidateMinStake
        return cb err if err?
        min =
            | +store.staking.stake-amount-total >= 1000000 => 1
            | _ => data `div` (10^18)
        max = get-balance! `minus` 0.1
        return cb lang.balanceLessStaking if +min > + max
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
        return alert lang.actionProhibited if can isnt yes
        data = web3t.velas.ValidatorSet.emitInitiateChange.get-data!
        to = web3t.velas.ValidatorSet.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 4600000, gas-price: 1000000 }
        store.current.page = \staking
    your-balance = " #{round-human get-balance!} "
    your-staking-amount = store.staking.stake-amount-total `div` (10^18)
    your-staking = " #{round-human your-staking-amount}"
    vlx-token = "VLX2"
    staker-status = if store.staking.is-active-staker then \Active else \Inactive
    check-uncheck = ->
        change = not store.staking.rewards.0.checked
        store.staking.rewards |> map (-> it.checked = change)
    box-background =
        background: style.app.bg-primary-light
    .pug.staking-content
        #placeholder store, web3t
        alert-txn { store }
        .form-group.pug
            label.active-network.pug
                .track.thumb.pug
            .pug.section
                .title.pug
                    h3.pug #{lang.install-node}
                .description.pug
                    .pug.left-node
                        img.pug(src="#{icons.img-node-staking}")
                    .pug.right-node
                        .pug #{lang.txt-install-node}
                        br.pug
                        .pug
                            span.important.pug #{lang.important}:
                            | #{lang.important-dont}
                        if pairs.mining.keystore.length is 0
                            .pug
                                .pug.btn
                                    button { store, type : \secondary , on-click: show-script , icon : \generate , text: "generateScript" }
                                .pug #{lang.pls-allow}
                        else
                            .pug
                                .pug.btn
                                    button { store, on-click: hide-script , icon: \close2 }
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
                                        | #{lang.coming-soon}
                                        span.cursor.pug |
                            if active-do is \active
                                .pug.code
                                    section.pug.window
                                        section.pug.icons
                                            span.pug
                                        CopyToClipboard.pug.copy(text="some code" on-copy=copied-inform(store) style=filter-icon)
                                            copy store
                                    .pug(style=line-style)
                                        | #{lang.coming-soon}
                                        span.cursor.pug |
            if store.staking.is-active-staker is no
                .pug.section
                    .title.pug
                        h3.pug #{lang.check-node}
                    .description.pug
                        .pug.left
                            ul.pug
                                li.pug 1. #{lang.check-node1}
                                li.pug 2. #{lang.check-node2}
                                li.pug 3. #{lang.check-node3}
                                li.pug 4. #{lang.check-node4}
            if +store.staking.stake-amount-total is 0
                .pug.section
                    .title.pug
                        h3.pug #{lang.validator}
                    .description.pug
                        .pug.left
                            label.pug #{lang.stake}
                            amount-field { store, value: store.staking.add.add-validator-stake , on-change: change-stake , placeholder: lang.stake }
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) Min
                                    button.small.pug(style=button-primary3-style on-click=use-max) Max
                                span.pug #{lang.balance}:
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                        button { store, on-click: become-validator , icon: \apply , text : \btnApply , type : \secondary }
            if +store.staking.stake-amount-total > 0
                .pug.section
                    .title.pug
                        h3.pug #{lang.staking}
                    .description.pug
                        .pug.left
                            .staking-info.pug
                                .col.col-4.pug
                                    div.pug(style=box-background)
                                        .value.pug
                                            .number.pug
                                                span.pug #{your-staking}
                                                span.pug #{vlx-token}
                                        .header.pug
                                            | #{lang.staking}
                                .col.col-4.pug
                                    div.pug(style=box-background)
                                        .value.pug.green
                                            .number.pug
                                                | #{staker-status}
                                        .header.pug
                                            | #{lang.your-status}
                                .col.col-4.pug
                                    div.pug(style=box-background)
                                        .value.pug
                                            .number.pug
                                                | #{store.staking.delegators}
                                        .header.pug
                                            | #{lang.delegators}
                                .col.col-4.pug
                                    div.pug(style=box-background)
                                        .value.pug
                                            .number.pug
                                                | #{store.staking.epoch}
                                        .header.pug
                                            | #{lang.epoch}
                            .table.pug
                                if store.staking.is-active-staker is no
                                    .pug.warning
                                        ol.pug
                                            li.pug #{lang.your-status1}
                                            li.pug #{lang.your-status2}
                            hr.pug
                            label.pug #{lang.stake-more}
                            amount-field { store, value: store.staking.add.add-validator-stake , on-change: change-stake , placeholder: lang.stake }
                            .pug.balance
                                span.pug.small-btns
                                    button.small.pug(style=button-primary3-style on-click=use-min) #{lang.min}
                                    button.small.pug(style=button-primary3-style on-click=use-max) #{lang.max}
                                span.pug Your balance:
                                span.pug.color #{your-balance}
                                    img.label-coin.pug(src="#{icons.vlx-icon}")
                                    span.pug.color #{vlx-token}
                        button { store, on-click: become-validator , type : \secondary , text: \btnApply , icon : \apply }
            if window.location.href.index-of('emit') > -1
                .pug.section
                    .title.pug
                        h3.pug #{lang.emit-change}
                    .description.pug
                        .pug.pad-bottom #{lang.propose}
                        button { store, on-click: vote-for-change, text : \emit }
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
        background: info.app.background
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
        color: info.app.color3
    icon-color=
        filter: info.app.icon-filter
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.staking
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") #{lang.staking}
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}" style=icon-color)
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        staking-content store, web3t
staking.init = ({ store, web3t }, cb)->
    err <- web3t.refresh
    store.staking.keystore = to-keystore store, no
    store.staking.chosen-pool =
        address: store.staking.keystore.staking.address
    store.staking.reward = null
    store.staking.withdraw-amount = 0
    store.staking.stake-amount-total = 0
    staking-address = store.staking.keystore.staking.address
    err, staking-epoch <- web3t.velas.Staking.stakingEpoch
    return cb err if err?
    store.staking.add.add-validator-stake = 0
    store.staking.epoch = staking-epoch.to-fixed!
    err, amount <- web3t.velas.Staking.stakeAmount(staking-address, staking-address)
    store.staking.stake-amount-total = amount.to-fixed!
    err, is-active <- web3t.velas.Staking.isPoolActive(staking-address)
    return cb err if err?
    store.staking.is-active-staker = is-active
    err, delegators <- web3t.velas.Staking.poolDelegators(staking-address)
    return cb err if err?
    store.staking.delegators = delegators.length
    err <- exit-stake.init { store, web3t }
    return cb err if err?
    cb null
module.exports = staking
staking.focus = ({ store, web3t }, cb)->
    claim-stake.calc-reward store, web3t
    cb null
#V31V1kD7DpT9eoRcdXf7T1fbFqcNh