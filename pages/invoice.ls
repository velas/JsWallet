require! {
    \react
    \../invoice-funcs.ls
    \prelude-ls : { map }
    \./receive.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../copied-inform.ls
    \../copy.ls
    \../icons.ls
    \../components/button.ls
    \../components/address-holder.ls
}
.content
    position: relative
    @import scheme
    $border-radius: $border
    $label-padding: 3px
    $label-font: 13px
    margin-left: $left-margin
    @media(max-width: 992px)
        margin: 60px 0 0
    .address-holder
        width: 320px
        >.identicon
            width: 25px
            height: 25px
            margin: 2px 0px 0 2px
        div
            >a
                padding-right: 30px
                padding-left: 10px
        span
            width: 320px
            background: var(--bg-primary-light)
    .pending
        color: orange
    >*
        display: inline-block
        text-align: center
        width: 100%
        box-sizing: border-box
        border-radius: $border-radius
    >.content-body
        top: 15px
        padding: 12px 12px 0px 12px
        @import scheme
        color: gray
        a
            color: gray
    .button-container
        text-align: center
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
    img.ill
        width: 160px
        display: block
form-group = (title, icon-style, content)->
    .pug.form-group
        label.pug.control-label(style=icon-style) #{title}
        content!
address-link = (store, web3t)->
    return null if store.preference.disableInvoice is yes
    { wallet } = invoice-funcs store, web3t
    address-holder { store, wallet }
ill-qr = (store, web3t)->
    .pug.ill-qr
        img.ill.pug.ill-top(src="#{icons.invoice-ill-top}")
        img.ill.pug.ill-middle.move(src="#{icons.invoice-ill-middle}")
        img.ill.pug(src="#{icons.invoice-ill-down}")
send = ({ store, web3t })->
    { wallet, cancel } = invoice-funcs store, web3t
    .pug.content
        ill-qr store, web3t
        address-link store, web3t
        receive store, wallet
        button { store, text: \cancel , on-click: cancel, icon: \close2 }
module.exports = send