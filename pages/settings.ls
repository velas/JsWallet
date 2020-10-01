require! {
    \react
    \../menu-funcs.ls
    \../history-funcs.ls
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
    \../icons.ls
    \../components/button.ls
    \../components/burger.ls
    \./choose-themes.ls
    \prelude-ls : { obj-to-pairs, pairs-to-obj, map }
}
.settings-menu
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: $left-margin
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:$ipad)
        width: 100%
        margin: 0
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
    >.account-body
        overflow: hidden
        background: transparent
        width: 100%
        padding-bottom: 50px
        border-radius: $border
        position: relative
        box-sizing: border-box
        >.settings
            padding-top: 0px
            overflow-y: auto
            .title
                color: $primary
                text-transform: uppercase
                font-size: 12px
                letter-spacing: 2px
                opacity: .8
                font-weight: 400
                margin: 0
                a
                    color: #ee8791
            .box
                input
                    width: 104px
                .title
                    width: 100%
                    text-align: center
            input
                border-radius: $border
                height: 36px
                width: 40px
                line-height: 36px
                text-align: center
                font-size: 13px
            textarea
                border-radius: $border
            input, textarea
                outline: none
                margin-bottom: 3px
                border: 0px
                padding: 3px 10px
                box-sizing: border-box
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: $border
                color: white
                height: 36px
                width: 120px
                margin-top: 5px
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
                img
                &.icon-svg
                    position: relative
                    height: 12px
                    top: 2px
                    padding-right: 5px
                &:hover
                    background: transparent
                    color: $primary
                &.link
                    min-width: 190px
            textarea
                width: 250px
                height: 72px
                resize: none
                font-size: 15px
            .active-network
                position: relative
                display: inline-block
                width: 48px
                height: 20px
                margin-top: 7px
                margin-right: 0px
                input
                    display: none
                    &:checked + .track
                        background-color: #3cd5af
                        &:before
                            -webkit-transform: translateX(28px)
                            transform: translateX(28px)
                .track
                    cursor: pointer
                    position: absolute
                    top: 0
                    left: 0
                    right: 0
                    bottom: 0
                    background-color: #463f50
                    -webkit-transition: 0.25s
                    transition: 0.25s
                    &:before
                        content: ""
                        position: absolute
                        box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.2), 0 1px 1px 0 rgba(0, 0, 0, 0.14), 0 1px 3px 0 rgba(0, 0, 0, 0.12)
                        background-color: #fafafa
                        -webkit-transition: 0.25s
                        transition: 0.25s
                .thumb
                    border-radius: 35px
                    &:before
                        top: 0px
                        right: 28px
                        width: 20px
                        height: 20px
                        border-radius: 50%
            .switch-account
                color: #8e8e93
                font-size: 12px
                margin-top: 5px
                .bold
                    font-weight: bold
                .button
                    background: #8e8e93
                    width: 12px
                    height: 16px
                    display: inline-block
                    color: white
                    padding: 9px
                    border-radius: $border
                    cursor: pointer
                    vertical-align: top
                    &:hover
                        background: gray
                    &.left
                        border-radius: $border 0 0 $border
                    &.right
                        border-radius: 0 $border $border 0
                .mb-12
                    margin-bottom: 12px
        .bold
            color: #f0c16b
        .section
            border-bottom: 1px solid rgba(240, 237, 237, 0.16)
            &:last-child
                border-bottom: 0
                @media (max-width: 800px)
                    padding-bottom: $ios-m-b
            .langs-drop
                position: absolute
                right: 0
                padding: 0
                top: 25px
                height: 300px
                margin: 5px
                width: 180px
                box-sizing: border-box
                display: inline-grid
                z-index: 3
                box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
                ul
                    padding: 15px
                    margin: 0
                    overflow: scroll
                    background: linear-gradient(var(--color1) 30%, rgba(50,18,96, 0)), linear-gradient(rgba(50,18,96, 0), var(--color1) 70%) 0 100%, radial-gradient(farthest-side at 50% 0, var(--color2), rgba(0,0,0,0)), radial-gradient(farthest-side at 50% 100%, var(--color2), rgba(0,0,0,0)) 0 100%
                    background-repeat: no-repeat
                    background-attachment: local, local, scroll, scroll
                    background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                    animation: breathe 3s ease-in infinite
                    -moz-transition: breathe 3s ease-in infinite
                    -web-kit-transition: breathe 3s ease-in infinite
                .search
                    width: 100%
                    margin: 0
                    transition: all .5s
                    &:focus
                        transition: all .5s
                        text-align: left
                .lang-item
                    display: flex
                    white-space: nowrap
                    margin-bottom: 20px
                    &:last-child
                        margin-bottom: 0
                    img
                        float: none
                        width: 20px
                        height: 20px
                        @media(max-width: 800px)
                            display: block
            .langs
                width: 80%
                @media(max-width: 800px)
                    width: 100%
                ul
                    list-style: none
                    display: inline-flex
                    width: 100%
                    margin: 0
                    padding: 0
                    margin-top: 20px
                    @media(max-width: 800px)
                        display: block
                        margin-top: 0
                    &:first-child
                        margin-top: 0px
            &.last
                border-bottom: 0
            &:first-child
                background: $logo-op
                background-repeat: no-repeat
                background-position: left 10px
            padding: 30px 20px
            display: flex
            @media (max-width: 800px)
                display: block
                padding: 20px
            .title
                padding: 0px
                width: 20%
                text-align: left
                .logo
                    display: none
                    @media (max-width: 800px)
                        display: block
                @media (max-width: 800px)
                    width: 100%
                    padding: 2px
                    text-align: center
            .description
                padding: 0px
                font-size: 13px
                color: #b0aeae
                width: 50%
                text-align: left
                @media (max-width: 800px)
                    width: 100%
                    padding: 7px
                    text-align: center
            .lang-item
                padding: 0px
                font-size: 13px
                color: #b0aeae
                width: calc(100%/6)
                text-align: left
                line-height: 20px
                cursor: pointer
                img
                    width: 20px
                    float: left
                    margin-right: 10px
                    &.active
                        opacity: 1
                    @media (max-width: 800px)
                        display: none
                @media (max-width: 800px)
                    width: 100%
                    padding: 7px 0
                    text-align: center
            .content
                width: 30%
                >span
                    position: relative
                    button
                        img
                            transform: rotate(90deg)
                @media (max-width: 800px)
                    width: 100%
            .logo
                margin-bottom: 5px
                img
                    width: 30px
            .cap
                text-transform: capitalize
            .low
                text-transform: lowercase
            .link
                color: #6f6fe2
                text-decoration: underline
                cursor: pointer
            .pb-0
                padding-bottom: 0
        .change-index
            width: 80px
            padding: 1px
            border-radius: 0 !important
            text-align: center
list-language = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    set-lang = (lang)->
        #return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
    change-lang-en = ->
        store.current.language-menu = no
        return set-lang \en
    change-lang-ru = ->
        store.current.language-menu = no
        return set-lang \ru
    change-lang-ua = ->
        store.current.language-menu = no
        return set-lang \uk
    change-lang-cn = ->
        store.current.language-menu = no
        return set-lang \zh
    change-lang-kr = ->
        store.current.language-menu = no
        return set-lang \ko
    change-lang-fr = ->
        store.current.language-menu = no
        return set-lang \fr
    change-lang-es = ->
        store.current.language-menu = no
        return set-lang \es
    color =
        color: style.app.text
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    ul.pug
        li.pug.lang-item(style=comming-soon)
            img.pug(src="#{icons.langs-gr}")
            | Deutsch
        li.pug.lang-item(on-click=change-lang-fr style=color)
            img.pug(src="#{icons.langs-fr}")
            | Français
        li.pug.lang-item(on-click=change-lang-en style=color)
            img.pug(src="#{icons.langs-en}")
            | English
        li.pug.lang-item(on-click=change-lang-kr style=color)
            img.pug(src="#{icons.langs-cn}")
            | 한국어
        li.pug.lang-item(on-click=change-lang-cn style=color)
            img.pug(src="#{icons.langs-kr}")
            | 中文語言
        li.pug.lang-item(style=comming-soon)
            img.pug(src="#{icons.langs-jp}")
            | 日本語
        li.pug.lang-item(style=comming-soon)
            img.pug(src="#{icons.langs-hn}")
            | हिंदी
        li.pug.lang-item(on-click=change-lang-es style=color)
            img.pug(src="#{icons.langs-sp}")
            | Español
        li.pug.lang-item(on-click=change-lang-ua style=color)
            img.pug(src="#{icons.langs-ua}")
            | Українська
        li.pug.lang-item(on-click=change-lang-ru style=color)
            img.pug(src="#{icons.langs-ru}")
            | Русский
        li.pug.lang-item(style=comming-soon)
            img.pug(src="#{icons.langs-kz}")
            | Қазақ
switch-language = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    open-language = ->
        store.current.language-menu = not store.current.language-menu
    menu-out = ->
        store.current.language-menu = no
    span.pug
        button { store, on-click: open-language , type: \secondary , icon : \arrowRight, text: \languageType }
        if store.current.language-menu
            .pug.langs-drop(style=filter-body on-mouse-leave=menu-out)
                input.pug.search(value="" style=input-style placeholder="#{lang.search}")
                list-language store, web3t
switch-account = (store, web3t)->
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
    .pug.switch-account(style=color)
        .pug.mb-12 #{lang.account-index}:
        span.pug.button.left(on-click=account-left style=button-primary2-style)
            icon \ChevronLeft, 15
        span.pug.bold
            input.pug.change-index(value="#{store.current.account-index}" style=input-style on-change=change-account-index)
        span.pug.button.right(on-click=account-right style=button-primary2-style)
            icon \ChevronRight, 15
networks =
    mainnet: no
    testnet: yes
networks-reverted =
    networks
        |> obj-to-pairs
        |> map -> [it.1, it.0]
        |> pairs-to-obj
switch-network = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    change-network = ->
        value = it.target.value is \true
        web3t.use networks-reverted[not value]
    value= networks[store.current.network]
    label.active-network.pug
        input.pug(type='checkbox' on-change=change-network value=value)
        .track.thumb.pug
naming-part = ({ store, web3t })->
    .pug.section
        .pug.title #{lang.your-nickname}
        .pug.description #{lang.your-nickname-info }
        .pug.content
            naming { store, web3t }
manage-account = (store, web3t)->
    { current, generate, enter-pin, check-pin, cancel-try, edit-seed, save-seed, change-seed, export-private-key } = menu-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    logo-style =
        filter: style.app.filterLogo
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    goto-terms = ->
        navigate store, web3t, \terms2
    goto-privacy = ->
        navigate store, web3t, \privacy
    input-style2 = { ...input-style, width: "85px" }
    button-style2 = { ...button-primary2-style, width: "20px" }
    .pug
        .pug.section
            .pug.title(style=color) #{lang.language}
            .pug.description(style=color)
                span.pug #{lang.languageWebWallet}
                span.pug - #{lang.language-type}
            .pug.content
                switch-language store, web3t
        .pug.section
            .pug.title(style=color) #{lang.switch-account-index}
            .pug.description(style=color)
                span.pug #{lang.switch-account-info }
            .pug.content
                switch-account store, web3t
        .pug.section
            .pug.title(style=color) #{lang.export-private-key}
            .pug.description(style=color)
                span.pug #{lang.export-private-key-warning}.
            .pug.content
                button { store, text: \showSecret , on-click: export-private-key, icon: \show, type: \secondary }
        .pug.section
            .pug.title(style=color) #{lang.network}
            .pug.description(style=color)
                if store.current.network is \testnet
                    span.pug #{lang.network-description2}
                else
                    span.pug #{lang.network-description}
            .pug.content
                switch-network store, web3t
        .pug.section
            .pug.title(style=color) #{lang.themes}
            .pug.description(style=color)
                span.pug #{lang.themes-description}
            .pug.content
                choose-themes store, web3t
        .pug.section
            .pug.title(style=color)
                .pug.logo
                    img.pug(src="#{style.branding.logo}" style=logo-style)
                span.pug Velas Wallet
                span.pug.bold.low #{store.version}
            .pug.description.pb-0(style=color)
                span.pug #{lang.about-wallet}.
                br.pug
                span.pug #{lang.pls-read }
                span.pug.link(on-click=goto-privacy) #{lang.privacy-policy}
                span.pug  &
                span.pug.link(on-click=goto-terms) #{lang.terms-of-use}
            .pug.content
module.exports = ({ store, web3t } )->
    go-back = ->
        navigate store, web3t, \wallets
    style = get-primary-info store
    account-body-style =
        color: style.app.text
    icon-color=
        filter: style.app.icon-filter
    border-style =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
    lang = get-lang store
    .pug.settings-menu
        .pug.title(style=border-style)
            .pug.header #{lang.manage-account}
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}" style=icon-color)
            burger store, web3t
        .account-body.pug(style=account-body-style)
            .pug.settings
                manage-account store, web3t