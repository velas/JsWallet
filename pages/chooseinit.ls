require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \./icon.ls
    \../icons.ls
    \../navigate.ls
    \./choose-language.ls
}
# ss
.newseed
    @import scheme
    padding-top: 30px
    width: 100%
    height: $height
    box-sizing: border-box
    height: 100%
    >.logo 
        margin: 3rem 0
        >img
            height: 80px
            margin-bottom: 1rem
        >.title
            font-size: 12px
            font-weight: 600
            letter-spacing: 4px
            text-align: center
    .welcome
        color: #ebf6f8
        font-size: 26px
        margin-bottom: 15px
    .title
        color: #ebf6f8
        font-size: 22px
        margin-bottom: 20px
    .align-v
        display: inline-grid
        position: relative
        .select
            outline: none
            width: auto
            min-width: 100px
            margin: 15px 5px 0
            text-transform: uppercase
            font-weight: bold
            padding: 0px 6px
            height: 36px
            line-height: 36px
            border: 0
            cursor: pointer
            border-radius: $border
            font-size: 10px
            img
                width: 15px
                height: 15px
                position: absolute
                right: 15px
                top: 27px
            span
                line-height: 20px
                text-align: center
            .arrow
                right: 20px
                top: 25px
                opacity: .8
                position: absolute
        .langs-menu
            width: auto
            background: #45217e
            position: relative
            top: 0px
            right: 0
            margin: -1px 5px 0
            display: inline-grid
            z-index: 1
            padding: 10px 10px
            justify-content: center
            border-radius: 0 0 $border $border
            z-index: 11
            .langs-item
                display: inline-flex
                cursor: pointer
                line-height: 20px
                margin-bottom: 10px
                &:last-child
                    margin-bottom: 0
                img
                    width: 17px
                    height: 17px
                    border-radius: 20px
                span
                    margin-left: 10px
                    font-size: 13px
                    text-transform: capitalize
                    line-height: 17px
        button
            outline: none
            width: auto
            margin: 15px 5px 0
            text-transform: uppercase
            font-weight: bold
            padding: 0px 6px
            border: 0
            height: 36px
            min-width: 120px
            cursor: pointer
            background: #248295
            border-radius: $border
            font-size: 10px
            color: white
            text-overflow: ellipsis
            overflow: hidden
            white-space: nowrap
            &:hover
                background: #248295 - 20
    .warning
        padding: 15px
        border: 1px solid orange
        margin: 10px
        border-radius: $border
        background: rgba(orange, 0.2)
    .hint
        color: #f2eeee
        padding: 20px 0
        max-width: 270px
        font-size: 13px
        margin: 0 auto
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
newseed = ({ store, web3t })->
    lang = get-lang store
    style = get-primary-info store
    { generate-seed, next } = newseed-funcs store, web3t
    text-style =
        color: style.app.text
    btn-icon =
        filter: style.app.btn-icon
    address-input=
        color: style.app.text
        background: style.app.wallet
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    logo-style =
        filter: style.app.filterLogo
    expand-collapse = ->
        store.current.langs-open-start = not store.current.langs-open-start
    langs-menu-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    text-style=
        color: style.app.text
    set-lang = (lang)->
        #return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    new-wallet = ->
        generate-seed!
        store.current.seed-generated = yes
        next!
    restore-option = ->
        store.current.seed-generated = no
        store.current.seed-words.length = 0
        navigate store, web3t, \:init
        #store.current.page = 'newseedrestore'
    .newseed.pug
        .pug.logo
            img.pug(src="#{style.branding.logo}")
            .title.pug(style=text-style) #{style.branding.title}
        .welcome.pug(style=text-style) #{lang.welcome-wallet}
        .pug.align-v
            button.pug.left(style=button-primary2-style on-click=new-wallet)
                span.pug
                    img.icon-svg.pug(src="#{icons.create-wallet}")
                    | #{lang.new-wallet}
            button.pug.right(style=button-primary3-style on-click=restore-option)
                span.pug
                    img.icon-svg.pug(src="#{icons.restore}" style=btn-icon)
                    | #{lang.restore-wallet}
            choose-language { store, web3t }
focus = ({ store }, cb)->
    <- set-timeout _, 1000
    #textarea = store.root.query-selector '.newseed textarea'
    #textarea.focus!
    cb null
newseed.focus = focus
module.exports = newseed