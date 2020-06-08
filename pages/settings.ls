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
    \./choose-themes.ls
}
.settings-menu
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:800px)
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
                background: $logo-opacity
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
naming-part = ({ store, web3t })->
    .pug.section
        .pug.title #{lang.your-nickname ? 'Your Nickname'}
        .pug.description #{lang.your-nickname-info ? 'You are able to attach nickname, email or phone number to your account and share it with friends. They will use your nick to resolve your crypto-address'}
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
    set-lang = (lang)->
        #return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
    change-lang-en = ->
        return set-lang \en 
    change-lang-ru = ->
        return set-lang \ru
    change-lang-ua = ->
        return set-lang \uk
    change-lang-cn = ->
        return set-lang \zh
    change-lang-kr = ->
        return set-lang \ko
    change-lang-fr = ->
        return set-lang \fr
    change-lang-es = ->
        return set-lang \es
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    input-style2 = { ...input-style, width: "85px" } 
    button-style2 = { ...button-primary2-style, width: "20px" }
    .pug
        .pug.section
            .pug.title(style=color) #{lang.language}
            .pug.langs
                ul.pug
                    li.pug.lang-item(style=comming-soon)
                        | Deutsch
                        img.pug(src="#{icons.langs-gr}")
                    li.pug.lang-item(on-click=change-lang-fr style=color)
                        | Français
                        img.pug(src="#{icons.langs-fr}")
                    li.pug.lang-item(on-click=change-lang-en style=color)
                        | English
                        img.pug(src="#{icons.langs-en}")
                    li.pug.lang-item(on-click=change-lang-kr style=color)
                        | 한국어
                        img.pug(src="#{icons.langs-cn}")
                    li.pug.lang-item(on-click=change-lang-cn style=color)
                        | 中文語言
                        img.pug(src="#{icons.langs-kr}")
                    li.pug.lang-item(style=comming-soon)
                        | 日本語
                        img.pug(src="#{icons.langs-jp}")
                ul.pug
                    li.pug.lang-item(style=comming-soon)
                        | हिंदी
                        img.pug(src="#{icons.langs-hn}")
                    li.pug.lang-item(on-click=change-lang-es style=color)
                        | Español
                        img.pug(src="#{icons.langs-sp}")
                    li.pug.lang-item(on-click=change-lang-ua style=color)
                        | Українська
                        img.pug(src="#{icons.langs-ua}")
                    li.pug.lang-item(on-click=change-lang-ru style=color)
                        | Русский
                        img.pug(src="#{icons.langs-ru}")
                    li.pug.lang-item(style=comming-soon)
                        | Қазақ
                        img.pug(src="#{icons.langs-kz}")
        if store.url-params.internal?
            .pug.section
                .pug.title(style=color) #{lang.secret-phrase ? 'Secret Phrase'}
                .pug.description(style=color) #{lang.secret-phrase-warning ? 'You are responsible for keeping this phrase safe. In case of loss of this phrase, we will not be able to help you restore it.'}
                .pug.content
                    switch
                        case current.try-edit-seed is yes
                            .pug.box
                                .pug
                                    input.pug(on-change=enter-pin value="#{current.pin}" type="password" style=input-style2 placeholder="#{lang.enter-pin ? 'Enter PIN'}")
                                    button.pug(on-click=check-pin style=button-style2) >
                                .pug    
                                    button.pug(on-click=cancel-try style=button-primary2-style) #{lang.cancel}
                        case current.saved-seed is no
                            .pug.box
                                .pug.title
                                    span.pug #{lang.secret-phrase ? 'Secret Phrase'}
                                textarea.pug(on-change=change-seed value="#{current.seed}" style=input-style placeholder="#{lang.secret-phrase ? 'Secret Phrase'}")
                                .pug #{current.seed-problem}
                                .pug
                                    button.pug(on-click=save-seed style=button-primary2-style) #{lang.save}
                        case current.saved-seed is yes
                            .pug
                                button.pug(on-click=edit-seed style=button-primary2-style) #{lang.edit-secret ? 'Edit Secret'}
        .pug.section
            .pug.title(style=color) #{lang.switch-account-index ? 'Switch Account Index'}
            .pug.description(style=color)
                span.pug #{lang.switch-account-info ? 'You could have a lot of unique addresses by switching account index. By default, you are given an index of 1, but you can change it in range 0 - 2,147,483,647'}
            .pug.content
                switch-account store, web3t
        .pug.section
            .pug.title(style=color) #{lang.export-private-key ? 'Export PRIVATE KEY'}
            .pug.description(style=color)
                span.pug #{lang.export-private-key-warning ? 'Please never do it in case when you do not understand exact reason of this action and do not accept risks'}.
            .pug.content
                button { store, text: \showSecret , on-click: export-private-key, icon: \show, type: \secondary }
        .pug.section
            .pug.title(style=color) Themes
            .pug.description(style=color)
                span.pug Use custom themes (alpha)
            .pug.content
                choose-themes store, web3t
        .pug.section
            .pug.title(style=color)
                .pug.logo
                    img.pug(src="#{style.branding.logo}" style=logo-style)
                span.pug Velas Wallet
                span.pug.bold.low #{store.version}
            .pug.description.pb-0(style=color)
                span.pug #{lang.about-wallet ? 'Multi-currency Wallet Managed by one mnemonic phrase'}.
                br.pug
                span.pug #{lang.pls-read ? 'Please read our'} 
                span.pug 
                    a.pug.link(href="https://velas.com/privacy.html" target="_blank") #{lang.privacy-policy ? 'Privacy Policy'}
                span.pug  & 
                span.pug.link(on-click=goto-terms) #{lang.terms-of-use ? 'Terms of Use'}
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
        .account-body.pug(style=account-body-style)
            .pug.settings
                manage-account store, web3t