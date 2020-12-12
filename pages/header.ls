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
    &.show
        .menu-item
            display: inline-block
            &.menu-btn
                opacity: .5
                transition: all .5s
    .logo
        position: absolute
        width: 100%
        text-align: center
        left: 0
        img
            width: 25px
            vertical-align: bottom
    >.menu-item
        &.active
            color: #0bffb7 !important
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
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
    .menu-item
        span
            opacity: 0
            position: absolute
            left: 0
        svg, img
            transition: transform .5s
        .menu
            opacity: 0
            position: absolute
            top: -160px
        &.submenu
            .menu
                padding: 15px !important
                position: absolute
                text-transform: uppercase
                left: -110px
                top: 37px
                z-index: 1
                height: auto
                width: 140px
                font-size: 10px
                color: #fff
                padding: 5px
                background: rgb(51, 20, 99)
                opacity: 1
                transition: opacity .5s
                box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
                ul
                    list-style: none
                    padding: 0
                    text-align: left
                    margin: 0
                    li
                        &:hover
                            color: #0bffb7 !important
                            transition: .5s
                            img
                                filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
                                transition: .5s
                        margin-bottom: 15px
                        font-size: 12px
                        &:last-child
                            margin-bottom: 0
                        &.active
                            color: #0bffb7 !important
                            img
                                filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
                        img
                            filter: none
                &.arrow_box
                    border: 1px solid #6b268e
        &:hover
            svg, img
                transform: scale(1)
                transition: transform .5s
            span
                position: absolute
                text-transform: uppercase
                left: 70px
                top: 17px
                font-size: 10px
                font-weight: 600
                color: #fff
                padding: 5px
                background: #210b4a
                opacity: 1
                transition: opacity .5s
                &.arrow_box
                    border: 1px solid #6b268e
                    &:after, &:before
                        right: 100%
                        top: 21%
                        border: solid transparent
                        content: " "
                        height: 0
                        width: 0
                        position: absolute
                        pointer-events: none
                    &:after
                        border-color: rgba(136, 183, 213, 0)
                        border-right-color: #210b4a
                        border-width: 6px
                        margin-top: 2px
                    &:before
                        border-color: rgba(194, 225, 245, 0)
                        border-right-color: #6b268e
                        border-width: 8px
                        margin-top: 0px
        &.active
            color: #0bffb7 !important
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
        vertical-align: bottom
        line-height: normal
        display: none
        margin-left: 20px
        position: relative
        height: 20px
        line-height: 15px
        width: 20px
        text-align: center
        z-index: 11
        &.locked
            float: left
            margin: 0
        &.menu-btn
            &.show
                opacity: .5
                transition: all .5s
        &.menu-btn, &.locked
            display: inline-block
        &.class
            position: absolute
            top: 530px
            left: 0
            color: transparent !important
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
    staking-active = if store.current.page is \staking then \active else \not-active
    delegate-active = if store.current.page is \choosestaker then \active else \not-active
    info-active = if store.current.page is \info then \active else \not-active
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    icon-style2 =
        color: style.app.icon
        float: "left"
        opacity: "0"
        margin-left: "60px"
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
    comming-soon =
        opacity: ".3"
        cursor: "no-drop"
    icon-node =
        position: "inherit"
        vertical-align: "sub"
        width: "12px"
        height: "12px"
        padding-right: "10px"
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
    goto-choose-staker = ->
        navigate store, web3t, \choosestaker
    goto-info = ->
        navigate store, web3t, \info
    open-submenu = ->
        store.current.submenu = not store.current.submenu
    menu-staking =
        if store.current.submenu then \submenu else \ ''
    menu-out = ->
        store.current.submenu = no
    staking = if store.current.submenu then \active else \not-active
    hide-menu = ->
        store.menu.mobile = not store.menu.mobile
    show-menu =
        if store.menu.mobile then \show else \ ""
    show-class =
        if store.menu.show then \show else \ ""
    show = ->
        store.menu.show = not store.menu.show
    .menu.pug(style=border-style class="#{show-menu}")
        .pug.logo
            img.pug(src="#{info.branding.logo-sm}" style=logo-style)
        if store.preference.lock-visible is yes
            if store.current.device is \mobile    
                .menu-item.menu-btn.pug(on-click=show style=icon-style class="#{show-class}")
                    img.pug(src="#{icons.menu}" style=lock-icon)
        if store.preference.lock-visible is yes
            if store.current.device is \mobile    
                .menu-item.locked.pug(on-click=lock style=icon-style)
                    img.pug(src="#{icons.lock}" style=lock-icon)