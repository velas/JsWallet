require! {
    \react
    \../send-funcs.ls
    \prelude-ls : { map, find, obj-to-pairs, filter, join }
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
    \./send.ls
    \../get-tx-details.ls
}
.content
    position: relative
    @import scheme
    $border-radius: $border
    $label-padding: 3px
    $label-font: 13px
    width: calc(100% - 0px) !important
    margin-left: 0px
    max-width: none !important
    @media(max-width:800px)
        margin-left: 0 !important
    .icon-svg
        position: relative
        height: 12px
        top: 2px
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
    >.content-body
        margin-top: 130px
        max-width: 450px !important
        height: 531px
        @import scheme
        color: gray
        text-aling: center
        >img
            display: block
            margin: 0 auto 20px
            width: 110px
        a
            color: #6f6fe2
        .contract-body
            display: inline-block
            text-align: left
            ul
                list-style: none
                padding: 0
                text-align: center
                li
                    line-height: 24px
            >.center
                text-align: center
                a
                    display: inline-block
        >.header
            margin: 0
            padding: 10px
            min-height: 40px
            text-align: left
            padding: 0
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
                &.right
                    width: 10%
                    text-align: right
                    cursor: pointer
                    >*
                        vertical-align: middle
            img
                width: 34px
                border-radius: 50px
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
build-part = (store, item)-->
    li.pug #{item}
send-contract = ({ store, web3t })->
    { token, name, fee-token, network, send, wallet, round5, pending, history, cancel, send-anyway, round5, is-data, invoice } = send-funcs store, web3t
    style = get-primary-info store
    border-style=
        border: "1px solid #{style.app.border}"
    icon-style =
        color: style.app.icon
    more-text=
        color: style.app.text
    border-header =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
    lang = get-lang store
    wallet-title = "#{name + network} #{lang.wallet ? 'wallet'}"
    show-class =
        if store.current.open-menu then \hide else \ ""
    text-parts = get-tx-details store, web3t
    see-details = ->
        send.details = yes
    .pug.content
        .pug.title(style=border-header)
            .pug.header(class="#{show-class}") #{lang.send}
            .pug.close(on-click=cancel)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            epoch store, web3t
            switch-account store, web3t
        .pug.content-body(style=more-text)
            img.pug(src="#{icons.attention}")
            .contract-body.pug
                ul.pug
                    text-parts |> map build-part store
                .pug.center
                    .pug.control-label.not-enough.text-left #{send.error}
                    a.pug(on-click=see-details) #{lang.details}
            .pug.button-container
                .pug.buttons
                    button { store, text: \send , on-click: send-anyway , loading: send.sending, type: \primary }
                    button { store, text: \cancel , on-click: cancel, icon: \close2 }
module.exports = send-contract
module.exports.init = send.init