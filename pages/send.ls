require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map, find, keys, filter }
    \../get-primary-info.ls
    \./icon.ls
    \../get-lang.ls
    \./switch-account.ls
    \../icons.ls
    \../round-human.ls
    \../round-number.ls
    \../wallets-funcs.ls
    \./epoch.ls
    \../components/button.ls
    \../components/address-holder.ls
    \../components/identicon.ls
    \../components/trx-fee.ls
    \./send-contract.ls
    \../history-funcs.ls
    \../components/burger.ls
    \../components/amount-field.ls
    \../components/sliders/network-slider.ls
    \../math.ls : { times }
    \ethereumjs-util : {BN}
    \../velas/addresses.ls
    \../contracts.ls
}
.content
    position: relative
    @import scheme
    $border-radius: var(--border-btn)
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
        background: var(--background)
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
        border-radius: var(--border-btn)
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
                border-radius: 0 0 var(--border-btn) var(--border-btn)
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
                &:nth-child(2), &:nth-child(3)
                    div
                        position: relative
                        img
                            position: absolute
                            right: auto
                            left: 4px
                            top: 3px
                            height: 30px
                            border-radius: var(--border-btn)
                            margin: 0px
                        input
                            text-align: center
                .control-label
                    padding-top: 5px
                    padding-left: $label-padding
                    font-size: $label-font
                &.network
                    div
                        position: relative
                    .button
                        width: 12px
                        height: 16px
                        display: inline-block
                        padding: 9px
                        border-radius: var(--border-btn)
                        cursor: pointer
                        vertical-align: top
                        position: absolute
                        &.left
                            left: 0
                        &.right
                            right: 0
                        svg
                            vertical-align: inherit !important
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
                        border-radius: var(--border-btn) 0 0 var(--border-btn)
                        &.choose-currency
                            display: inline-flex
                            width: 45% !important
                        .input-area
                            margin: 0
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
                            border-radius: 0 var(--border-btn) var(--border-btn) 0
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
                            &:disabled
                                opacity:.2
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
form-group = (classes, title, style, content)->
    .pug.form-group(class="#{classes}")
        label.pug.control-label(style=style) #{title}
        content!
send = ({ store, web3t })->
    { token, name, fee-token, network, send, wallet, pending, recipient-change, amount-change, amount-usd-change, amount-eur-change, use-max-amount, show-data, show-label, history, cancel, send-anyway, swap-back, choose-auto, round5edit, round5, is-data, encode-decode, change-amount, invoice } = send-funcs store, web3t
    return send-contract { store, web3t } if send.details is no
    send.sending = false
    { go-back } = history-funcs store, web3t
    return go-back! if not wallet?
    round-money = (val)->
        +val |> (-> it * 100) |> Math.round |> (-> it / 100)
    style = get-primary-info store
    menu-style=
        background: style.app.background
        background-color: style.app.bgspare
        border: "1px solid #{style.app.border}"
    input-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    border-style=
        border: "1px solid #{style.app.border}"
    amount-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    icon-style =
        color: style.app.icon
    use-max-style =
        color: style.app.text2
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    crypto-background =
        background: style.app.wallet
        width: "50%"
    just-crypto-background =
        background: style.app.wallet
    more-text=
        color: style.app.text
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
        background-color: style.app.bgspare
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
    token-display = if token == \VLX2 then \VLX else token
    fee-token-display = if fee-token == \VLX2 then \VLX else fee-token
    go-back-from-send = ->
        send.error = ''
        go-back!  
    makeDisabled = send.amount-send <= 0
    token = store.current.send.coin.token
    send-func = if token is \vlx_erc20 then swap-back else send-anyway
    disabled = not send.to? or send.to.trim!.length is 0 or (send.error.index-of "address") > -1     
    receiver-is-swap-contract = contracts.is-swap-contract(store, send.to)
    get-recipient = (address)->
        return "" if not address? or "#{address}".trim! is ""
        address = "#{address}".trim!  
        if receiver-is-swap-contract
            recipient = to-eth-address(wallet.address)
            #if ["0x164fC3c7237fC6ADf78411B7B87D54154370AA14","0xD6933C1aE9E20A536D793E25Ea1C3ba38ce02c2D","0x3e0Aa75a75AdAfcf3cb800C812b66B4aaFe03B52"].index-of(address) isnt -1
                #recipient = "TokenBridge: " + recipient
            return recipient 
        address
    disabled-recipient-input = contracts.is-swap-contract(store, send.to) 
    recipient = get-recipient(send.to)
    .pug.content
        .pug.title(style=border-header)
            .pug.header(class="#{show-class}") #{lang.send}
            .pug.close(on-click=go-back-from-send)
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
                form-group \sender, lang.from, icon-style, ->
                    .address.pug(style=border-style)
                        address-holder { store, wallet }
                .pug.slider.network.form-group
                    if token is \vlx2 and receiver-is-swap-contract then
                        slider-style = {
                            background: style.app.input
                            color: style.app.text
                            border: "0"
                        }     
                        network-slider { store, style=slider-style }
                form-group \receiver, lang.to, icon-style, ->
                    .pug
                        identicon { store, address: send.to }
                        input.pug(type='text' style=input-style on-change=recipient-change value="#{recipient}" placeholder="#{store.current.send-to-mask}" id="send-recipient" )
                form-group \send-amount, lang.amount, icon-style, ->
                    .pug
                        .pug.amount-field
                            .input-wrapper.pug(style=input-style)
                                .label.crypto.pug
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    | #{token-display}
                                amount-field { store, value: "#{round5edit send.amount-send}", on-change: amount-change, placeholder="0", id="send-amount", token, disabled }
                            if active-usd is \active
                                .input-wrapper.small.pug(style=amount-style)
                                    .label.lusd.pug $
                                    input.pug.amount-usd(type='text' style=just-crypto-background on-change=amount-usd-change placeholder="0" title="#{send.amount-send-usd}" value="#{round-number send.amount-send-usd, {decimals: 8}}" id="send-amount-usd" disabled=disabled)
                            if active-eur is \active
                                .input-wrapper.small.pug(style=amount-style)
                                    .label.lusd.pug €
                                    input.pug.amount-eur(type='text'  style=crypto-background on-change=amount-eur-change placeholder="0" title="#{send.amount-send-eur}" value="#{round-money send.amount-send-eur}" id="send-amount-eur")
                        .pug.usd
                            button.pug.send-all(on-click=use-max-amount style=button-primary3-style type="button" id="send-max") #{lang.use-max}
                            span.pug #{lang.balance}
                            span.pug.balance
                                span.pug(title="#{wallet.balance}") #{round-human wallet.balance}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug #{token-display}
                                if +wallet.pending-sent >0 and no
                                    span.pug.pending #{'(' + pending + ' ' + lang.pending + ')'}
                        .pug.control-label.not-enough.text-left(title="#{send.error}") #{send.error}
                if is-data
                    form-group \contract-data, 'Data', icon-style, ->
                        .pug.smart-contract(style=input-style) #{show-data!}
                trx-fee { store, web3t, wallet }
                table.pug(style=border-style)
                    tbody.pug
                        tr.pug
                            td.pug #{lang.you-spend}
                            td.pug
                                span.pug(title="#{send.amount-charged}") #{round5(send.amount-charged)}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug(title="#{send.amount-charged}") #{token-display}
                                .pug.usd $ #{round5 send.amount-charged-usd}
                        tr.pug.orange
                            td.pug #{lang.fee}
                            td.pug
                                span.pug(title="#{send.amount-send-fee}") #{round5 send.amount-send-fee}
                                    img.label-coin.pug(src="#{send.coin.image}")
                                    span.pug(title="#{send.amount-send-fee}") #{fee-token-display}
                                .pug.usd $ #{round5 send.amount-send-fee-usd}
                        if +store.current.send.foreign-network-fee > 0
                            tr.pug.orange
                                td.pug Token bridge fee
                                td.pug
                                    span.pug(title="#{send.amount-send-fee}") #{send.foreign-network-fee}
                                        img.label-coin.pug(src="#{send.coin.image}")
                                        span.pug(title="#{send.foreign-network-fee}") #{fee-token-display}
                                    .pug.usd $ #{round5 (send.amount-send-foreign-fee-usd ? 0)}
            .pug.button-container
                .pug.buttons
                    button { store, text: \send , on-click: send-func , loading: send.sending, type: \primary, error: send.error, makeDisabled: makeDisabled, id: "send-confirm" }
                    button { store, text: \cancel , on-click: cancel, icon: \close2, id: "send-cancel" }
module.exports = send
module.exports.init = ({ store, web3t }, cb)->
    { wallet } = send-funcs store, web3t
    return cb null if not wallet?
    store.current.send.foreign-network-fee = 0
    is-swap-contract = contracts.is-swap-contract(store, send.to)
    if is-swap-contract then
        contract-address = if wallet.coin.token is \vlx2 then web3t.velas.HomeBridgeNativeToErc.address else web3t.velas.ForeignBridgeNativeToErc.address 
        store.current.send.to = contract-address
        network-type = store.current.network
        networks = wallet.coin["#{network-type}s"]
        store.current.send.networks = networks
        network-keys = networks |> keys
        default-network = networks[network-keys.0].name
        chosen-network = store.current.send.chosen-network["#{network-type}"]
        store.current.send.chosen-network["#{network-type}"] = default-network if chosen-network is ""  
    { wallets } = wallets-funcs store, web3t
    current-wallet =
        wallets |> find (-> it.coin.token is wallet.coin.token)
    err, fee <- contracts.get-home-network-fee({store, web3t}, store.current.send.to)
    return cb err if err?
    store.current.send.foreign-network-fee = fee
    { wallet } = send-funcs store, web3t
    if fee? then
        store.current.send.amount-send-foreign-fee-usd = wallet.usdRate `times` fee
    return cb null if current-wallet.address is wallet.address
    return cb null if not wallet?
    return cb null if not web3t[wallet.coin.token]?   
    { send-transaction } = web3t[wallet.coin.token]
    err <- send-transaction { to: "", value: 0 }
    send.sending = false
    cb null