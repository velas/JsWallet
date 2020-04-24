require! {
    \react
    \../invoice-funcs.ls
    \prelude-ls : { map }
    \./receive.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../address-link.ls : { get-address-link, get-address-title }
    \../icons.ls
}
.content
    position: relative
    @import scheme
    $border-radius: $border
    $label-padding: 3px
    $label-font: 13px
    .pending
        color: orange
    >*
        display: inline-block
        text-align: center
        width: 94%
        box-sizing: border-box
        border-radius: $border-radius
        left: 11px
    >.content-body
        top: 15px
        padding: 12px 12px 0px 12px
        @import scheme
        color: gray
        a
            color: gray
        >form
            >table
                background: #e6f0ff
                border-radius: 10px
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
                        &:last-child
                            text-align: right
            max-width: 400px
            text-align: left
            >.form-group
                .grecaptcha-badge
                    z-index: 1
                >.control-label
                    padding-top: 5px
                    padding-left: $label-padding
                    font-size: $label-font
                margin-top: 4px
                text-align: center
                .address
                    padding: 0px 10px
                    overflow: hidden
                    text-overflow: ellipsis
                    border-radius: $border-radius
                    font-size: 14px
                    height: 36px
                    line-height: 36px
                    overflow: hidden
                    text-overflow: ellipsis
                    color: #677897
                    position: relative
                    >img
                        position: absolute
                        right: 0
                        top: 0
                        margin: 10px
                        margin-left: 50px
                        z-index: 2
                        width: auto
                    >a
                        width: 100%
                        z-index: 1
                        position: relative
                        border-radius: $border
                        border: 0
                        box-sizing: border-box
                        vertical-align: top
                        text-align: center
                        padding-left: 20px
                        padding-right: 25px
                        color: #677897
                        font-size: 14px
                        display: inline-block
                        text-overflow: ellipsis
                        overflow: hidden
                input
                    outline: none
                    width: 100%
                    box-sizing: border-box
                    height: 36px
                    line-height: 36px
                    border-radius: $border-radius
                    padding: 0px 10px
                    font-size: 14px
                    margin: 1px
                    border: 1px solid #5E72E4
                    box-shadow: none
                .amount-field
                    >.input-wrapper
                        position: relative
                        width: 50%
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
                        input
                            width: 100%
                            &.amount
                                border-radius: $border-radius 0 0 $border-radius
                                border-right: 0
                            &.amount-usd
                                background: #f1eeee
                                padding-left: 20px
                                border-radius: 0 $border-radius $border-radius 0
        >.header
            margin: 0
            padding: 10px
            text-align: left
            padding: 0
            >.head
                width: 70%
                line-height: 70px
                font-size: 20px
                font-weight: 700
                vertical-align: middle
                line-height: 29px
                display: inline-block
                color: #677897
                &.right
                    text-align: right
                    width: 30%
            img
                width: 34px
        .usd
            font-size: 11px
            padding-left: 4px
            color: gray
        .topup
            display: inline-block
            margin-left: 5px
            color: orange
            vertical-align: top
            padding: 0 5px
            border-radius: $border
            line-height: 12px
            font-size: 12px
        .balance
            color: #5E72E4
        .send-all
            background: #3a63e4
            outline: none
            border: 0
            color: white
            border-radius: $border
            font-size: 10px
            text-align: center
            padding: 0 5px
            cursor: pointer
        .not-enough
            color: red
            min-height: 33px
            padding: 0 4px
            font-size: 12px
            max-height: 20px
            overflow: hidden
        .fast-cheap
            text-align: right
            height: 14px
            line-height: 14px
            padding: 3px
            flex-direction: row
            display: flex
            >*
                padding: 0 5px
                font-size: 10px
                border-radius: $border
                cursor: pointer
                text-align: center
                &.chosen
                    cursor: default
                    background: #3a63e4
                    color: white
                &.space
                    flex: 1
        .escrow
            padding: 5px 11px
            min-height: 20px
            @media screen and (max-width: 290px)
                min-height: 0
            color: #cc625a
            font-size: 14px
        .bold
            font-weight: bold
    .button-container
        text-align: center
        .buttons
            margin-top: 10px
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
                .icon-svg
                    position: relative
                    height: 12px
                    top: 2px
                    padding: 0px 5px 0 0px
    .ill-qr
        position: relative
        width: 160px
        display: block
        margin: 60px auto 10px
        .ill-top
            position: absolute
            top: -30px
            right: 3px
            z-index: 3
            width: 140px
        .ill-middle
            position: absolute
            top: 5px
            right: 36px
            width: 66px
    .move
        -webkit-animation: diagonal 15s infinite
        -moz-animation: diagonal 15s infinite
        -o-animation: diagonal 15s infinite
        animation: diagonal 15s infinite
    @-webkit-keyframes diagonal
        0%
            transform: translatex(-30px) translatey(-15px)
        50%
            transform: translatex(10px) translatey(10px)
        100%
            transform: translatex(-30px) translatey(-15px)
    img
        width: 160px
        display: block
form-group = (title, icon-style, content)->
    .pug.form-group
        label.pug.control-label(style=icon-style) #{title}
        content!
#recaptchaRef = react.createRef!
cancel-button = (store, web3t)->
    style = get-primary-info store
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    btn-icon =
        filter: style.app.btn-icon
        position: "relative"
        height: "12px"
        width: "auto"
        padding: "0px"
        display: "inline-block"
    #return null if store.preference.disableInvoice isnt yes
    lang = get-lang store
    { invoice, token, wallet, primary-button-style, recipient-change, description-change, amount-change, amount-usd-change, cancel, send-anyway, get-address-link, get-address-title, default-button-style, round5edit } = invoice-funcs store, web3t
    .pug.button-container
        .pug.buttons
            button.pug.btn.btn-default(on-click=cancel style=button-primary3-style)
                span.pug
                    img.icon-svg.pug(src="#{icons.close}" style=btn-icon)
                    | #{lang.cancel}
address-link = (store, web3t)->
    return null if store.preference.disableInvoice is yes
    { invoice, token, wallet, primary-button-style, recipient-change, description-change, amount-change, amount-usd-change, cancel, send-anyway, get-address-link, get-address-title, default-button-style, round5edit } = invoice-funcs store, web3t
    style = get-primary-info store
    icon-style =
        color: style.app.icon
    more-text=
        color: style.app.text
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    href-style=
        max-width: "320px"
        margin: "10px auto 0"
    filter-icon=
        filter: style.app.filterIcon
    lang = get-lang store
    .pug.content-body(style=more-text)
        form.pug
            form-group lang.funding-address, icon-style, ->
                .address.pug(style=href-style)
                    a.pug(href="#{get-address-link wallet}" target="_blank" style=default-button-style) #{get-address-title wallet}
                    CopyToClipboard.pug(text="#{get-address-title wallet}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
ill-qr = (store, web3t)->
    .pug.ill-qr
        img.pug.ill-top(src="#{icons.invoice-ill-top}")
        img.pug.ill-middle.move(src="#{icons.invoice-ill-middle}")
        img.pug(src="#{icons.invoice-ill-down}")
send = ({ store, web3t })->
    { wallet } = invoice-funcs store, web3t
    .pug.content
        ill-qr store, web3t
        address-link store, web3t
        receive store, wallet
        cancel-button store, web3t
module.exports = send