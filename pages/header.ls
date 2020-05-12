require! {
    \react
    \./project-links.ls
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \../navigate.ls
    \../setup-pages.ls
    \../icons.ls
}
.menu
    width: 100%
    text-align: right
    padding: 20px 15px
    box-sizing: border-box
    height: 60px
    position: fixed
    z-index: 111
    $smooth: color .15s ease-in-out
    .logo
        position: absolute
        width: auto
        text-align: left
        left: 15px
        img
            width: 25px
            vertical-align: bottom
    >.menu-item
        &.active
            color: #9264b6 !important
            transition: $smooth
            -webkit-transition: $smooth
            -moz-transition: $smooth
            -ms-transition: $smooth
            -o-transition: $smooth
            img
                filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
        &.syncing
            @keyframes spin
                from
                    transform: rotate(0deg)
                to 
                    transform: rotate(360deg)
            animation-name: spin
            animation-duration: 4000ms
            animation-iteration-count: infinite
            animation-timing-function: linear
        cursor: pointer
        opacity: 0.9
        &:hover
            opacity: 1
        vertical-align: text-top
        line-height: normal
        display: inline-block
        margin-left: 20px
        position: relative
        height: 20px
        line-height: 15px
        width: 20px
        text-align: center
        z-index: 11
        img
            width: 17px
            border-radius: 0px
            position: absolute
            left: 0
            padding: 2px
            height: 17px
    .langs-menu
        width: auto
        background: #45217e
        position: absolute
        top: 59px
        right: 5rem
        display: inline-grid
        z-index: 1
        padding: 15px
        z-index: 11
        .langs-item
            display: inline-flex
            cursor: pointer
            line-height: 20px
            margin-bottom: 15px
            &:last-child
                margin-bottom: 0
            img
                width: 20px
                height: 20px
                border-radius: 20px
            span
                margin-left: 10px
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
module.exports = (store, web3)->
    #return null if not store? or store.current.page in <[ locked ]>
    return null if not store? or store.current.page in setup-pages
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    wallets = if store.current.page is \wallets then \active else \not-active
    search = if store.current.page is \search then \active else \not-active
    settings = if store.current.page is \settings then \active else \not-active
    filestorage = if store.current.page is \filestorage then \active else \not-active
    staking = if store.current.page is \staking then \active else \not-active
    resources = if store.current.page is \resources then \active else \not-active
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lang = get-lang store
    info = get-primary-info store
    syncing = 
        | store.current.refreshing => "syncing"
        | _ => ""
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.header
    logo-style =
        filter: style.app.filterLogo
    expand-collapse = ->
        store.current.langs-open = not store.current.langs-open
    langs-menu-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    lock-icon = 
        width: "14px"
    wallet-icon = 
        width: "18px"
    set-lang = (lang)->
        #return alert "lang is not available" if not store.langs[store.lang]?
        store.lang = lang
    change-lang-en = ->
        return set-lang \en
    change-lang-ru = ->
        return set-lang \ru
    change-lang-ua = ->
        return set-lang \ua
    change-lang-cn = ->
        return set-lang \cn
    change-lang-kr = ->
        return set-lang \kr
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    text-style=
        color: style.app.text
    goto-settings = ->
        navigate store, web3t, \settings
    goto-search = ->
        navigate store, web3t, \search
    wallet = ->
        navigate store, web3t, \wallets
    goto-staking = ->
        navigate store, web3t, \staking
    .menu.pug(style=border-style)
        .pug.logo
            img.pug(src="#{info.branding.logo}" style=logo-style)
        if store.preference.refresh-visible is yes
            if no
                .menu-item.pug(on-click=refresh style=icon-style class="#{syncing}")
                    icon \Sync , 20
        if store.preference.settings-visible is yes
            if store.current.device is \mobile
                .menu-item.pug(on-click=wallet style=icon-style class="#{wallets}")
                    img.pug(src="#{icons.wallet}" style=wallet-icon)
        if store.preference.settings-visible is yes
            if store.current.device is \mobile
                .menu-item.pug(on-click=goto-staking style=icon-style class="#{staking}")
                    img.pug(src="#{icons.staking}")
        if store.preference.settings-visible is yes
            if store.current.device is \mobile
                .menu-item.pug(on-click=goto-search style=icon-style class="#{search}")
                    img.pug(src="#{icons.search}")
        if store.preference.settings-visible is yes
            if store.current.device is \mobile
                .menu-item.pug(on-click=goto-settings style=icon-style class="#{settings}")
                    img.pug(src="#{icons.setting}")
        if store.preference.lock-visible is yes
            if store.current.device is \mobile    
                .menu-item.pug(on-click=lock style=icon-style)
                    img.pug(src="#{icons.lock}" style=lock-icon)