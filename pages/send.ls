require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map, find }
    \../get-primary-info.ls
    \./icon.ls
    \../get-lang.ls
    \./switch-account.ls
    \../icons.ls
    \../round-human.ls
    \../wallets-funcs.ls
    \./epoch.ls
    \../components/button.ls
    \../components/address-holder.ls
    \../components/identicon.ls
    \../components/trx-fee.ls
    \./send-contract.ls
    \../history-funcs.ls
    \../components/burger.ls
}
.content
    position: relative
    @import scheme
    $border-radius: $border
    $label-padding: 3px
    $label-font: 13px
    width: calc(100% - 0px) !important
    margin-left: 0px !important
    max-width: none !important
    @media(max-width:800px)
        margin-left: 0 !important
    .icon-svg
        position: relative
        height: 12px
        top: 2px
    .icon-svg-history
        width: auto !important
        height: 20px
    .content-body
        max-width: 450px !important
    >.title
        position: sticky
        position: -webkit-sticky
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        z-index: 2
        @media(max-width:800px)
            left: 0
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
    .h1
        font-size: 17px
        text-transform: uppercase
        letter-spacing: 2px
        opacity: .8
    .pending
        color: orange
    >*
        display: inline-block
        text-align: center
        width: 100%
        box-sizing: border-box
        border-radius: $border-radius
    .more-buttons
        top: 30px
        right: 0
        width: 150px
        box-shadow: 0px 0px 2px black
        border-radius: $border
        text-align: left
        padding-bottom: 3px
        >.more
            display: block
            cursor: pointer
            padding: 5px 0
            &:last-child
                border-bottom: 0px
            .more-icon
                width: 50px
                text-align: center
                display: inline-block
                vertical-align: middle
            .more-text
                width: 80px
                display: inline-block
                vertical-align: middle
    >.content-body
        margin-top: 15px
        height: 531px
        @import scheme
        color: gray
        a
            color: #6f6fe2
        >form
            >table
                background: transparent
                border-radius: 0 0 $border $border
                width: 100%
                border-spacing: 0
                tr
                    &.gray
                        color: #CCC
                    &.orange
                        color: #cf952c
                    &.green
                        color: #23b723
                    td
                        padding: 3px 10px
                        font-size: 14px
                        .label-coin
                            left: 3px
                            top: 3px
                            padding: 0 2px 0 2px
                            height: 16px
                            position: relative
                        &:last-child
                            text-align: right
            text-align: left
            margin: auto 10px
            >.form-group
                .identicon
                    ~ span
                        background: var(--input)
                &:nth-child(2)
                    div
                        position: relative
                        img
                            position: absolute
                            right: auto
                            left: 4px
                            top: 3px
                            height: 30px
                            border-radius: 5px
                            margin: 0px
                        input
                            text-align: center
                >.control-label
                    padding-top: 5px
                    padding-left: $label-padding
                    font-size: $label-font
                margin-top: 4px
                .address
                    padding: 0px
                    height: 36px
                    line-height: 36px
                    overflow: hidden
                    text-overflow: ellipsis
                    background: transparent
                    border-radius: $border-radius
                    font-size: 14px
                    overflow: hidden
                    text-overflow: ellipsis
                    color: #677897
                input
                    outline: none
                    width: 100%
                    box-sizing: border-box
                    height: 36px
                    line-height: 36px
                    border-radius: $border-radius
                    padding: 0px 10px
                    font-size: 14px
                    border: 0px
                    box-shadow: none
                .amount-field
                    position: relative
                    >.input-wrapper
                        position: relative
                        width: 65%
                        &.choose-currency
                            display: inline-flex
                            width: 45% !important
                        select
                            -webkit-appearance: none
                            -moz-appearance: none
                            padding-right: 30px
                            padding-left: 10px
                            background-position: right 5px top 50%
                            background-repeat: no-repeat
                            display: block
                            width: 30%
                            height: 36px
                            font-size: 14px
                            line-height: 1.5
                            color: #fff
                            background-color: #421f7c
                            background-clip: padding-box
                            border-radius: 0
                            border-color: #6b258e
                            border-left: 0 solid
                            margin-left: -1px
                        &.small
                            width: 35%
                        display: inline-block
                        box-sizing: border-box
                        margin: 0
                        >.label
                            position: absolute
                            top: 8px
                            display: inline
                            &.lusd
                                left: 5px
                            &.crypto
                                right: 5px
                                top: 7px
                                height: 22px
                        .label-coin
                            height: 18px
                            top: 3px
                            position: relative
                            padding: 0 0px 0 8px;
                        input
                            width: 100%
                            color: white
                            box-shadow: none
                            outline: none
                            ::placeholder
                                color: #eee
                            &.amount
                                border-radius: $border-radius 0 0 $border-radius
                                border-right: 0
                            &.amount-eur
                                background: #f1eeee
                                padding-left: 20px
                                border-radius: 0 $border-radius $border-radius 0
                                border-left: 0
                            &.amount-usd
                                background: #f1eeee
                                border-radius: 0 $border-radius $border-radius 0
                                padding-left: 20px
        .smart-contract
            overflow: hidden
            padding: 2px
            box-sizing: border-box
        >.header
            padding: 10px
            min-height: 40px
            text-align: left
            padding: 0
            margin: 0 10px
            >.head
                box-sizing: border-box
                width: 70%
                line-height: 70px
                font-size: 27px
                font-weight: 600
                vertical-align: middle
                line-height: 29px
                display: inline-block
                color: #677897
                width: 80%
                &.center
                    padding-left: 10px
                &.left
                    width: 10%
                    text-align: center
                &.right
                    width: 10%
                    text-align: right
                    cursor: pointer
                    >*
                        vertical-align: middle
            img
                width: 34px
                border-radius: 0px
        .field
            font-size: 12px
            padding-left: 3px
            color: gray
            margin-top: 5px
            &.type
                font-size: 14px
                color: #fff
                text-transform: capitalize
            &.coin
                font-size: 14px
                color: #fff
        .usd
            font-size: 11px
            padding-left: 3px
            color: gray
            margin-top: 5px
            .switch-currency
                float: right
                &.active
                    background: var(--primary3)
                &:last-child
                    margin-right: 2px
            .label-coin
                left: 3px
                top: 3px
                padding: 0 2px 0 2px
                height: 13px
                position: relative
        .balance
            color: #5E72E4
        .send-all
            background: transparent
            outline: none
            border: 0
            border-radius: $border
            font-size: 12px
            line-height: 16px
            text-align: center
            padding: 2px 5px
            cursor: pointer
        .not-enough
            color: red
            min-height: 33px
            padding: 0 4px
            font-size: 12px
            max-height: 20px
            overflow: hidden
        .bold
            font-weight: bold
        .button-container
            text-align: center
            .buttons
                margin-top: 40px
                text-align: center
                border-radius: $border
                width: 100%
                display: inline-block
                overflow: hidden
                .btn
                    width: auto
                    min-width: 80px
                    padding: 0 6px
                    line-height: 36px
                    height: 36px
                    text-transform: uppercase
                    text-align: center
                    font-weight: bold
                    border: 0
                    margin: 5px
                    font-size: 10px
                    border-radius: $border
                    display: inline-block
                    cursor: pointer
                    box-sizing: border-box
                    transaction: all .5s
                    &.btn-primary
                        background: #6CA7ED
                        color: white
                    &:hover
                        background: rgba(#6CA7ED, 0.2)
                        opacity: .9
form-group = (title, style, content)->
    .pug.form-group
        label.pug.control-label(style=style) #{title}
        content!
send = ({ store, web3t })->
    { token, name, fee-token, network, send, wallet, pending, recipient-change, amount-change, amount-usd-change, amount-eur-change, use-max-amount, show-data, show-label, history, cancel, send-anyway, choose-auto, round5edit, round5, is-data, encode-decode, change-amount, invoice } = send-funcs store, web3t
    return send-contract { store, web3t } if send.details is no
    { go-back } = history-funcs store, web3t
    return go-back! if not wallet?
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
    style = get-primary-info store
    menu-style=
        background: style.app.background
        border: "1px solid #{style.app.border}"
    input-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    border-style=
        border: "1px solid #{style.app.border}"
    amount-style=
        border: "1px solid #{style.app.background}"
    icon-style =
        color: style.app.icon
    use-max-style =
        color: style.app.text2
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    crypto-background =
        background: style.app.wallet
    more-text=
        color: style.app.text
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
    lang = get-lang store
    wallet-title = "#{name + network} #{lang.wallet ? 'wallet'}"
    open-invoice = ->
        invoice store, wallet
    activate = (convert)-> ->
        store.current.convert = convert
    activate-usd = activate \usd
    activate-eur = activate \eur
    active-class = (convert)->
        if store.current.convert is convert then 'active' else ''
    active-usd = active-class \usd
    active-eur = active-class \eur
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.content
        .pug.title(style=border-header)
            .pug.header(class="#{show-class}") #{lang.send}
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        .pug.content-body(style=more-text)
            if store.current.device isnt \mobile
                .pug.header
                    span.head.pug.left
                        img.pug(src="#{send.coin.image}")
                    span.pug.head.center(style=more-text) #{wallet-title}
                    if store.current.device is \mobile
                        span.pug.head.right(on-click=history style=icon-style)
                            img.icon-svg-history.pug(src="#{icons.history}")
            if store.current.send-menu-open
                .pug.more-buttons(style=menu-style)
                    if store.preference.invoice-visible is yes
                        if store.current.device is \desktop
                            a.pug.more.receive(on-click=open-invoice)
                                .pug
                                    span.pug.more-icon(style=icon-style)
                                        icon \Mail, 20
                                    span.pug.more-text(style=more-text) #{lang.invoice}
                    if store.current.device is \mobile
                        a.pug.more.history(on-click=history)
                            .pug
                                span.pug.more-icon(style=icon-style)
                                    icon \Inbox, 20
                                span.pug.more-text(style=more-text) #{lang.history}
            form.pug
                form-group lang.from, icon-style, ->
                    .address.pug(style=border-style)
                        address-holder { store, wallet }
                form-group lang.to, icon-style, ->
                    .pug
                        identicon { store, address: send.to }
                        input.pug(type='text' style=input-style on-change=recipient-change value="#{send.to}" placeholder="#{store.current.send-to-mask}")
                form-group lang.amount, icon-style, ->
                    .pug
                        .pug.amount-field
                            .input-wrapper.pug
                                .label.crypto.pug(style=crypto-background)
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    | #{token}
                                input.pug.amount(type='text' style=input-style on-change=amount-change placeholder="0" title="#{send.amount-send}" value="#{round5edit send.amount-send}")
                            if active-usd is \active
                                .input-wrapper.small.pug(style=amount-style)
                                    .label.lusd.pug $
                                    input.pug.amount-usd(type='text' style=input-style on-change=amount-usd-change placeholder="0" title="#{send.amount-send-usd}" value="#{round-money send.amount-send-usd}")
                            if active-eur is \active
                                .input-wrapper.small.pug(style=amount-style)
                                    .label.lusd.pug €
                                    input.pug.amount-eur(type='text'  style=input-style on-change=amount-eur-change placeholder="0" title="#{send.amount-send-eur}" value="#{round-money send.amount-send-eur}")
                        .pug.usd
                            button.pug.send-all(on-click=use-max-amount style=button-primary3-style type="button") #{lang.use-max}
                            span.pug #{lang.balance}
                            span.pug.balance
                                span.pug(title="#{wallet.balance}") #{round-human wallet.balance}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug #{token}
                                if +wallet.pending-sent >0
                                    span.pug.pending #{'(' + pending + ' ' + lang.pending + ')'}
                            button.pug.send-all.switch-currency(on-click=activate-eur class="#{active-eur}" style=use-max-style type="button") eur
                            button.pug.send-all.switch-currency(on-click=activate-usd class="#{active-usd}" style=use-max-style type="button") usd
                        .pug.control-label.not-enough.text-left(title="#{send.error}") #{send.error}
                if is-data
                    form-group 'Data', icon-style, ->
                        .pug.smart-contract(style=input-style) #{show-data!}
                trx-fee { store, web3t, wallet }
                table.pug(style=border-style)
                    tbody.pug
                        tr.pug
                            td.pug #{lang.you-spend}
                            td.pug
                                span.pug(title="#{send.amount-charged}") #{round5(send.amount-charged)}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug(title="#{send.amount-charged}") #{token}
                                .pug.usd $ #{round5 send.amount-charged-usd}
                        tr.pug.orange
                            td.pug #{lang.fee}
                            td.pug
                                span.pug(title="#{send.amount-send-fee}") #{round5 send.amount-send-fee}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug(title="#{send.amount-send-fee}") #{fee-token}
                                .pug.usd $ #{round5 send.amount-send-fee-usd}
            .pug.button-container
                .pug.buttons
                    button { store, text: \send , on-click: send-anyway , loading: send.sending, type: \primary, error: send.error }
                    button { store, text: \cancel , on-click: cancel, icon: \close2 }
module.exports = send
module.exports.init = ({ store, web3t }, cb)->
    { wallet } = send-funcs store, web3t
    return cb null if not wallet?
    { wallets } = wallets-funcs store, web3t
    current-wallet =
        wallets |> find (-> it.coin.token is wallet.coin.token)
    return cb null if current-wallet.address is wallet.address
    { wallet } = send-funcs store, web3t
    return cb null if not wallet?
    return cb null if not web3t[wallet.coin.token]?
    { send-transaction } = web3t[wallet.coin.token]
    err <- send-transaction { to: "", value: 0 }
    cb null