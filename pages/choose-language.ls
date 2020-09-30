require! {
    \react
    \../menu-funcs.ls 
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
    \../../web3t/providers/superagent.ls : { get }
    \prelude-ls : { find }
    \../menu-funcs.ls
    \../icons.ls
}
.choose-language
    @import scheme
    @keyframes bounceIn
        from
            opacity: 0
            transform: scale3d(0.8, 0.8, 0.8)
        to
            opacity: 1
            transform: scale3d(1, 1, 1)
    position: fixed
    padding-top: 30px
    width: 100%
    top: 0
    left: 0
    z-index: 999
    height: 100%
    min-height: 100vh
    box-sizing: border-box
    background: rgba(black, 0.5)
    @media(max-width: 430px)
        padding-top: 0px
    .title
        color: #ebf6f8
        font-size: 22px
        margin-bottom: 20px
    >.account-body
        max-width: 600px
        display: inline-block
        overflow: hidden
        width: 100%
        margin-top: 0vh
        margin-bottom: 25vh
        padding-bottom: 50px
        border-radius: $border
        position: relative
        max-height: 100vh
        box-sizing: border-box
        >.title
            position: absolute
            z-index: 999
            box-sizing: border-box
            top: 0
            width: 100%
            color: gray
            font-size: 22px
            padding: 10px
            height: 60px
            background: black
            >.header
                margin: 5px
        >.settings
            padding-top: 0px
            overflow-y: auto
            .title
                color: $primary
                text-transform: uppercase
                font-size: 14px
                a
                    color: #ee8791
            .box
                input
                    width: 104px
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: $border
                color: white
                height: 36px
                width: 104px
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
                &:hover
                    background: transparent
                    color: $primary
                &.link
                    min-width: 190px
        .bold
            color: #f0c16b
        .section
            .logo
                margin: 3rem 0
                >.title
                    font-size: 12px
                    font-weight: 600
                    letter-spacing: 4px
                    text-align: center
                    color: #ebf6f8
                >img
                    height: 80px
                    margin-bottom: 1rem
                    @media(max-width: 430px)
                        height: 50px
                @media(max-width: 800px)
                    margin: 1rem 0
            .welcome
                color: #ebf6f8
                font-size: 26px
                margin-bottom: 15px
                @media(max-width: 430px)
                    font-size: 20px
                    margin-bottom: 10px
            .langs
                width: 100%
                margin: 50px auto
                @media(max-width: 430px)
                    width: 100%
                    margin: 0
                ul
                    list-style: none
                    display: inline-flex
                    width: 100%
                    margin: 0
                    padding: 0
                    margin-top: 20px
                    @media(max-width: 430px)
                        display: block
                        margin-top: 0
                    &:first-child
                        margin-top: 0px
            .lang-item
                padding: 0px
                font-size: 13px
                color: #b0aeae
                width: calc(100%/4)
                text-align: center
                line-height: 20px
                cursor: pointer
                img
                    width: 20px
                    position: relative
                    &.active
                        opacity: 1
                    @media (max-width: 430px)
                        display: none
                @media (max-width: 430px)
                    width: 100%
                    padding: 7px 0
                    text-align: center
            padding: 0px 10%
            .title
                padding: 2px
            .description
                padding: 7px
                font-size: 16px
                color: #b0aeae
            @media(max-width: 430px)
                padding: 0px 10%
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
language = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    { close-language } = menu-funcs store, web3t
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    style-textarea=
        background: style.app.wallet
        color: style.app.text
    logo-style =
        filter: style.app.filterLogo
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    filter-icon=
        filter: style.app.filterIcon
    text-style =
        color: style.app.text
    set-lang = (lang)->
        #return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
        store.current.choose-language = no
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
    .pug
        .pug.section
            .pug.logo
                img.pug(src="#{style.branding.logo}")
                .title.pug(style=text-style) #{style.branding.title}
            .welcome.pug(style=text-style) #{lang.language}
            .pug.langs
                ul.pug
                    li.pug.lang-item(style=comming-soon)
                        img.pug(src="#{icons.langs-gr}")
                        .pug Deutsch
                    li.pug.lang-item(on-click=change-lang-fr style=color)
                        img.pug(src="#{icons.langs-fr}")
                        .pug Français
                    li.pug.lang-item(on-click=change-lang-en style=color)
                        img.pug(src="#{icons.langs-en}")
                        .pug English
                    li.pug.lang-item(on-click=change-lang-kr style=color)
                        img.pug(src="#{icons.langs-cn}")
                        .pug 한국어
                ul.pug
                    li.pug.lang-item(on-click=change-lang-cn style=color)
                        img.pug(src="#{icons.langs-kr}")
                        .pug 中文語言
                    li.pug.lang-item(style=comming-soon)
                        img.pug(src="#{icons.langs-jp}")
                        .pug 日本語
                    li.pug.lang-item(style=comming-soon)
                        img.pug(src="#{icons.langs-hn}")
                        .pug हिंदी
                    li.pug.lang-item(on-click=change-lang-es style=color)
                        img.pug(src="#{icons.langs-sp}")
                        .pug Español
                ul.pug
                    li.pug.lang-item(on-click=change-lang-ua style=color)
                        img.pug(src="#{icons.langs-ua}")
                        .pug Українська
                    li.pug.lang-item(on-click=change-lang-ru style=color)
                        img.pug(src="#{icons.langs-ru}")
                        .pug Русский
                    li.pug.lang-item(style=comming-soon)
                        img.pug(src="#{icons.langs-kz}")
                        .pug Қазақ
module.exports = ({ store, web3t } )->
    return null if store.current.choose-language isnt yes
    { close-language } = menu-funcs store, web3t
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    body-style = 
        background: "transparent"
        color: style.app.text
    border-style =
        background: style.app.header
        color: style.app.text
    lang = get-lang store
    .pug.choose-language(style=account-body-style)
        .account-body.pug
            if no
                .pug.title(style=border-style)
                    .pug.header #{lang.choose-language}
                    if no    
                        .pug.close(on-click=close-language)
                            icon \X, 20
            .pug.settings
                language store, web3t