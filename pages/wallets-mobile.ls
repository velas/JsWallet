require! {
    \react
    \./wallet.ls
    \prelude-ls : { map, take, drop }
    \./menu.ls
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \../icons.ls
    \./icon.ls
}
.wallet-mobile
    $mobile: 425px
    $tablet: 800px
    button.btn
        min-width: auto
        margin: 0
    .your-account
        position: relative
        display: block
        max-width: 450px
        border: 0 !important
        .tor
            right: 0px
            bottom: -27px
            .tor-content
                right: -55px
                &:after, &:before
                    right: 33%
                    top: -10%
        .switch-menu
            right: -1px
            top: 165px
            @media(max-width: 480px)
                right: -2px
    @media(max-width: 800px)
        margin-top: 0px
    .wallets
        @import scheme
        $real-height: 300px
        $cards-height: 296px
        $pad: 20px
        $radius: 15px    
        height: 395px
        box-sizing: border-box
        position: relative
        left: 0
        $cards-pad: 15px
        right: 0
        margin: 0 $cards-pad
        z-index: 2
        @media(max-width: $mobile)
            margin: 0
            height: calc(100vh - 100px)
        >*
            width: 100%
        >.arrow
            position: absolute
            text-align: center
            cursor: pointer
            &.arrow-t
                top: 0
                margin-top: 10px
            &.arrow-d
                bottom: 0
                margin-bottom: 10px
                transform: rotate(180deg)
            &:not(.true)
                >.arrow-d
                    visibility: hidden
            >.arrow-container
                display: inline-block
                width: 100%
                max-width: 450px
                position: relative
        padding-top: 20px
        >.wallet-container
            overflow: hidden
            overflow-y: auto
            border-radius: 0 0 $border $border
            max-height: 268px
            height: 100%
            max-width: 450px
            border-top: 1px solid #213040
            display: inline-block
            @media(max-width: $mobile)
                max-height: 100vh
                height: auto
                margin-bottom: 0px
            .wallet
                background: var(--bg-secondary)
                &:last-child
                    margin-bottom: -1px
                &.big
                    background: var(--bg-secondary)
            @media(max-width: $mobile)
                border-width: 1px 0 0 0 !important
        .switch-account
            float: right
            line-height: 2
            right: 20px
            position: relative
            display: inline-flex
            .ckeck
                color: #3cd5af
            .cancel
                color: #c25b5f
            .name
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                width: 90px
                text-align: right
                cursor: default
            input
                outline: none
                width: 100px
                margin-top: -6px
                height: 36px
                line-height: 36px
                border-radius: 0px
                padding: 0px 10px
                font-size: 12px
                opacity: 1
            span
                cursor: pointer
            .icon
                vertical-align: middle
                margin-left: 20px
                transition: transform .5s
                &.rotate
                    transform: rotate(180deg)
                    transition: transform .5s
        .h1
            font-size: 12px
            text-transform: uppercase
            letter-spacing: 2px
            opacity: .8
        .icon-svg1
            position: relative
            height: 16px
            top: 2px
        .icon-svg2
            position: relative
            height: 10px
        .header
            max-width: 450px
            margin: 0 auto
            border-left: 1px solid var(--border)
            border-right: 1px solid var(--border)
            @media(max-width: $mobile)
                border: 0
    .wallet
        .wallet-middle
            width: 100%
            padding: 10px 12px
            box-sizing: border-box
            color: #A8BACB
            font-size: 14px
            margin-top: 5px
            text-align: center
            position: relative
            display: inline-block
            height: auto
            border: 0 !important
            .address-holder
                div
                    a
                        padding-right: 20px
            &.title-balance
                display: none
mobile = ({ store, web3t })->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    border-style-w =
        border: "1px solid #{style.app.border}"
        background: "#{style.app.input}99"
    border-style =
        border-top: "1px solid #{style.app.border}"
    row =
        display: "flex"
        height: "100vh"
        margin-left: "60px"
    left-side =
        width: "45%"
    right-side =
        width: "55%"
        border-left: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    border-right=
        border-right: "1px solid #{style.app.border}"
    open-account = ->
        store.current.switch-account = not store.current.switch-account
    edit-account-name = ->
        store.current.edit-account-name = current-account-name!
    default-account-name = -> "Account #{store.current.account-index}"
    edit-account = (e)->
        #console.log e
        store.current.edit-account-name = e.target.value
    done-edit = ->
        local-storage.set-item default-account-name!, store.current.edit-account-name
        cancel-edit-account-name!
    cancel-edit-account-name = ->
        store.current.edit-account-name = ""
    current-account-name = ->
        local-storage.get-item(default-account-name!) ? default-account-name!
    account-name = current-account-name!
    rotate-class =
        if store.current.switch-account then \rotate else \ ""
    view-account-template = ->
        .pug.switch-account.h1
            span.name.pug(on-click=open-account) #{account-name}
            span.pug.icon(on-click=edit-account-name)
                img.icon-svg1.pug(src="#{icons.create}")
            span.pug.icon(on-click=open-account class="#{rotate-class}")
                img.icon-svg2.pug(src="#{icons.arrow-down}")
    edit-account-template = ->
        .pug.switch-account.h1
            input.h1.pug(value="#{store.current.edit-account-name}" on-change=edit-account style=input)
            span.ckeck.pug.icon(on-click=done-edit)
                icon "Check", 20
            span.cancel.pug.icon(on-click=cancel-edit-account-name)
                icon "X", 20
    chosen-account-template =
        if store.current.edit-account-name is "" then view-account-template! else edit-account-template!
    .pug.wallet-mobile(key="wallets")
        menu { store, web3t }
        manage-account { store, web3t }
        token-migration { store, web3t }
        add-coin-page { store, web3t }
        .wallets.pug(key="wallets-body")
            .header.pug(style=header-style)
                span.pug.head.left.h1.hidden(style=header-left) #{lang.your-wallets}
                chosen-account-template
            .wallet-container.pug(key="wallets-viewport" style=border-style-w)
                wallets |> map wallet store, web3t, wallets
module.exports = mobile