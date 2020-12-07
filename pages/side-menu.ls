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
    @import scheme
    width: 100%
    text-align: right
    padding: 20px 15px
    box-sizing: border-box
    $smooth: color .15s ease-in-out
    &.side-menu
        position: fixed
        left: 0
        width: 60px
        height: 100vh
        padding: 0
        padding-top: 0px
        z-index: 11
        .menu-items
            margin: 0
            position: absolute
        .logo
            position: relative
            width: auto
            text-align: center
            padding: 20px 0
            left: 0
            img
                width: 25px
                vertical-align: bottom
        .menu-item
            padding: 20px
            margin-left: 0
            &.bottom
                position: absolute
                bottom: 0
                left: 0
            &.testnet
                background: orange
                color: white
                min-height: 10px
            &.lang
                bottom: 0
    .logo
        position: absolute
        width: 100%
        text-align: center
        left: 0
        img
            width: 25px
            vertical-align: bottom
            cursor: pointer
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
            left: -100px
        &.submenu
            .menu
                padding: 15px !important
                position: absolute
                text-transform: uppercase
                left: 59px
                top: 17px
                z-index: 1
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
        &:hover
            >svg, >img
                transform: scale(1.2)
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
                white-space: nowrap
                background: #000
                opacity: 1
                transition: opacity .5s
                &.arrow_box
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
                        border-right-color: #000
                        border-width: 6px
                        margin-top: 2px
                    &:before
                        border-color: rgba(194, 225, 245, 0)
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
        opacity: 1
        &:hover
            opacity: 1
        vertical-align: bottom
        line-height: normal
        display: inline-block
        margin-left: 20px
        position: relative
        height: 20px
        line-height: 15px
        width: 20px
        text-align: center
        z-index: 11
        @media screen and (max-width: 390px)
            &:nth-child(4)
                float: left
                margin-left: 0
        img
            width: 17px
            border-radius: 0px
            position: absolute
            left: 20px
            padding: 2px
        &.class
            position: absolute
            top: 530px
            left: 0
            color: transparent !important
    .langs-menu
        background: #45217e !important
        position: relative
        border-left: 0 !important
        border-radius: 0 !important
        top: 0
        left: 0
        width: 59px
        display: inline-grid
        z-index: 1
        padding: 20px 0 24px
        .langs-item
            display: inline-block
            cursor: pointer
            line-height: 15px
            margin-bottom: 20px
            text-align: center
            div
                line-height: 13px
            &:last-child
                margin-bottom: 0
            img
                width: 17px
                height: 17px
                padding: 2px
                border-radius: 20px
            span
                margin-left: 0px
                font-size: 10px
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
#setup-pages = <[ locked newseed chooseinit loading loading2 verifyseed terms terms2 ]>
module.exports = (store, web3t)->
    return null if not store? or store.current.page in setup-pages
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    wallets = if store.current.page is \wallets then \active else \not-active
    search = if store.current.page is \search then \active else \not-active
    settings = if store.current.page is \settings then \active else \not-active
    filestorage = if store.current.page is \filestorage then \active else \not-active
    staking = if store.current.page is \staking then \active else \not-active
    staking-active = if store.current.page is \staking then \active else \not-active
    delegate-active = if store.current.page is \choosestaker then \active else \not-active
    info-active = if store.current.page is \info then \active else \not-active
    resources = if store.current.page is \resources then \active else \not-active
    faq = if store.current.page is \faq then \active else \not-active
    notice = if store.current.page is \notification then \active else \not-active
    claim-active = if store.current.page is \claim then \active else \not-active
    menu-style=
        color: style.app.text
    icon-color=
        filter: style.app.icon-filter
    icon-style =
        color: style.app.text
    icon-style2 =
        opacity: "0"
        bottom: "-280px"
        left: "-57px"
    icon-style3 =
        opacity: "0"
        bottom: "-130px"
        left: "-57px"
    lang = get-lang store
    info = get-primary-info store
    syncing =
        | store.current.refreshing => "syncing"
        | _ => ""
    border-style =
        border-right: "1px solid #{style.app.border}"
        background: style.app.header
    logo-style =
        filter: style.app.filterLogo
    expand-collapse = ->
        store.current.langs-open-side = not store.current.langs-open-side
    langs-menu-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    lock-icon =
        width: "14px"
        filter: style.app.icon-filter
    wallet-icon =
        width: "18px"
        filter: style.app.icon-filter
    icon-node =
        position: "inherit"
        vertical-align: "sub"
        width: "12px"
        padding-right: "10px"
        filter: style.app.icon-filter
    text-style=
        color: style.app.text
    background-menu=
        background: style.app.header
        border: "1px solid #{style.app.border}"
    wallet = ->
        navigate store, web3t, \wallets
    goto-search = ->
        navigate store, web3t, \search
    goto-settings = ->
        navigate store, web3t, \settings
    goto-file-storage = ->
        navigate store, web3t, \filestorage
    goto-staking = ->
        navigate store, web3t, \staking
    goto-resources = ->
        navigate store, web3t, \resources
    goto-choose-staker = ->
        navigate store, web3t, \choosestaker
    goto-info = ->
        navigate store, web3t, \info
    goto-faq = ->
        navigate store, web3t, \faq
    goto-notice = ->
        navigate store, web3t, \notification
    goto-claim = ->
        navigate store, web3t, \claim
    goto-support = ->
        store.menu.show = no
        window.open(store.menu.support)
    comming-soon =
        opacity: ".3"
    tooltip=
        background: "#000"
    open-submenu = ->
        store.current.submenu = not store.current.submenu
    menu-staking =
        if store.current.submenu then \submenu else \ ''
    menu-out = ->
        store.current.submenu = no
    staking = if store.current.submenu then \active else \not-active
    color =
        color: style.app.text
    goto-mainnet = ->
        web3t.use \mainnet
    goto-wallet = ->
        navigate store, web3t, \wallets
    .menu.side-menu.pug(style=border-style on-mouse-leave=menu-out)
        .pug.logo
            img.pug(src="#{info.branding.logo-sm}" style=logo-style on-click=goto-wallet)
        if store.preference.lock-visible is yes
            .menu-item.bottom.pug(on-click=lock style=icon-style)
                img.pug(src="#{icons.lock}" style=lock-icon)
        .pug.menu-items
            if store.preference.settings-visible is yes
                .menu-item.pug(on-click=wallet style=icon-style class="#{wallets}")
                    span.arrow_box.pug(style=tooltip) #{lang.your-wallets}
                    img.pug(src="#{icons.wallet}" style=wallet-icon)
            if store.preference.settings-visible is yes
                .menu-item.pug(on-click=open-submenu style=icon-style class="#{staking + ' ' + menu-staking}")
                    .menu.pug.arrow_box(style=background-menu)
                        ul.pug
                            li.pug(on-click=goto-staking style=icon-style class="#{staking-active}")
                                img.pug(src="#{icons.node}" style=icon-node)
                                | #{lang.install-node}
                            li.pug(on-click=goto-choose-staker style=icon-style class="#{delegate-active}")
                                img.pug(src="#{icons.delegate}" style=icon-node)
                                | #{lang.delegate-stake}
                            if no
                                li.pug(on-click=goto-claim style=icon-style class="#{claim-active}")
                                    img.pug(src="#{icons.claim}" style=icon-node)
                                    | #{lang.claim-reward}
                            li.pug(on-click=goto-info style=icon-style class="#{info-active}")
                                img.pug(src="#{icons.info}" style=icon-node)
                                | #{lang.stats}
                    span.arrow_box.pug(style=tooltip) #{lang.staking}
                    img.pug(src="#{icons.staking}"style=icon-color)
            if store.preference.settings-visible is yes
                .menu-item.pug(on-click=goto-search style=icon-style class="#{search}")
                    span.arrow_box.pug(style=tooltip) #{lang.search}
                    img.pug(src="#{icons.search}" style=icon-color)
            if store.preference.settings-visible is yes
                .menu-item.pug(on-click=goto-settings style=icon-style class="#{settings}")
                    span.arrow_box.pug(style=tooltip) #{lang.settings}
                    img.pug(src="#{icons.setting}" style=icon-color)
            if store.preference.settings-visible is yes
                .menu-item.pug(on-click=goto-support style=icon-style)
                    span.arrow_box.pug(style=tooltip) #{lang.support}
                    img.pug(src="#{icons.support}" style=icon-color)
            if store.current.network is \testnet
                .menu-item.pug.testnet(on-click=goto-mainnet style=icon-style class="#{settings}")
                    span.arrow_box.pug(style=tooltip) testnet
                    img.pug(src="#{icons.test}" style=icon-color)