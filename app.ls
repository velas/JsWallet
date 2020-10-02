require! {
    \mobx-react : { observer }
    \mobx : { observable }
    \react
    \./pages.ls
    \./pages/header.ls
    \./pages/mobilemenu.ls
    #\./pages/side-menu.ls
    \./pages/left-menu.ls
    #\./pages/banner.ls
    \./description.ls
    \./browser/window.ls
    \./copy-message.ls
    \./modal.ls : { modal-control }
    \./get-primary-info.ls
    \./pages/confirmation.ls : { confirmation-control }
    \./pages/hovered-address.ls
    \react-detect-offline : { Offline, Online }
}
.app
    input
        line-height: normal !important
    &::-webkit-scrollbar
        display: none
    *
        -ms-overflow-style: none
        scrollbar-width: none
        outline: none
    ::-webkit-scrollbar
        display: none
    .table-scroll
        scrollbar-width: thin
        display: block !important
        -ms-overflow-style: block !important
        scrollbar-width: thin !important
        outline: block !important
        scrollbar-color: var(--ligh-text) #f8f5f60d
    .table-scroll::-webkit-scrollbar
        width: 4px
        height: 4px
        display: block
    .table-scroll::-webkit-scrollbar-track
        background: #f8f5f60d
        border-radius: 10px
    .table-scroll::-webkit-scrollbar-thumb
        border-radius: 10px
        background: #71748f 
    .table-scroll::-webkit-scrollbar-thumb:hover
        background: #ffffff
        border-radius: 10px
    .table-scroll::-webkit-scrollbar-corner
        background: #f8f5f60d
    user-select: none
    overflow-y: scroll
    @import scheme
    background: $primary
    scrollbar-width: none
    height: 100vh
    position: relative
    color: white
    text-align: center
    width: 100vw
    .icon-svg
        position: relative
        height: 12px
        top: 2px
        margin-right: 3px
    >.title
        z-index: 3 !important
    .title
        .header
            @media(max-width: 620px)
                &.hide
                    visibility: hidden
            @media(max-width: 820px)
                text-align: left !important
                margin-left: 120px !important
                font-size: 12px !important
        &.alert
            .header
                @media(max-width: 820px)
                    text-align: center !important
                    margin-left: 0px !important
                    font-size: 12px !important
        .close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            @media(max-width: 820px)
                position: absolute
                font-size: 20px
                left: 50px !important
                top: 0 !important
                height: 60px
                width: 60px
                cursor: pointer
                border-right: 1px solid var(--border)
            @media(max-width: 992px)
                position: absolute
                font-size: 20px
                left: 80px
                top: 13px
                cursor: pointer
            img
                @media(max-width: 820px)
                    top: 16px !important
        >.header
            text-align: center
            font-size: 17px
            text-transform: uppercase
            letter-spacing: 2px
            opacity: .8
            line-height: 30px
            font-weight: 400
            margin: 0
        &.alert
            padding: 2px
            .header
                line-height: 44px
            @media(max-width: 800px)
                visibility: hidden
                display: none
            &.txn
                margin-left: 60px
                @media(max-width: 800px)
                    visibility: visible
                    margin-top: 0px
                    margin-left: 0
                    display: block
    .manage-account
        margin-left: -250px
        @media (max-width: $ipad)
            margin-left: 0
    .content
        max-width: 450px
        display: inline-block
        width: 100%
    &.syncing
        background-size: 400% 400% !important
        animation: gradient 3s ease infinite
    @keyframes gradient
        0%
            background-position: 0% 50%
        50%
            background-position: 100% 50%
        100%
            background-position: 0% 50%
    .placeholder-coin
        display: none !important
    .placeholder
        -webkit-mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0.6) 0%, #000000 50%, rgba(255, 255, 255, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: fb 1s infinite
        animation-fill-mode: forwards
        background: var(--placeholder)
        color: transparent !important
        width: 100%
        display: inline-block
        height: 16px
        border-radius: 15px
    @keyframes fb
        0%
            -webkit-mask-position: left
        100%
            -webkit-mask-position: right
    @media (max-width: 800px)
        .wallet-main, >.content, .history, .search, .filestore, .resources, .staking, .settings-menu, .staking-res, .stats, .monitor
            margin: 60px 0 0
            >.title
                margin: 0
                position: fixed
                z-index: 11
    .error-no-connection
        -webkit-mask-image: linear-gradient(90deg, rgba(255, 255, 255, 0.6) 0%, #000000 50%, rgba(255, 255, 255, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: fb 1s infinite
        animation-fill-mode: forwards
        background: var(--placeholder)
        padding: 10px 20px
        display: inline-block
    .fixed-n-centered
        position: fixed
        bottom: 0
        left: 0
        right: 0
        z-index: 11
# use var(--background);
define-root = (store)->
    style = get-primary-info store
    text = ":root { --background: #{style.app.background};--bg-secondary: #{style.app.wallet};--bg-primary-light: #{style.app.bg-primary-light};--placeholder: #{style.app.placeholder};--placeholder-menu: #{style.app.placeholder-menu};--color3: #{style.app.color3};--border: #{style.app.border}; --color1: #{style.app.color1}; --color2: #{style.app.color2}; --color-td: #{style.app.color-td};--drag-bg: #{style.app.drag-bg};--td-hover: #{style.app.th};--border-color: #{style.app.border-color};--waves: #{style.app.waves};--primary1: #{style.app.primary1};--primary2: #{style.app.primary2};--primary3: #{style.app.primary3};--input: #{style.app.input};--dark-theme: #{style.app.menu};--border: #{style.app.border};--ligh-text: #{style.app.icon}}"
    style.pug #{text}
module.exports = ({ store, web3t })->
    return null if not store?
    current-page =
        pages[store.current.page]
    theme = get-primary-info(store)
    style =
        background: theme.app.background
        color: theme.app.text
    syncing =
        | store.current.refreshing => "syncing"
        | _ => ""
    open-menu = ->
        store.current.open-menu = not store.current.open-menu
    .pug
        define-root store
        description store
        .app.pug(key="content" style=style class="#{syncing}")
            modal-control store, web3t
            confirmation-control store, web3t
            copy-message store, web3t
            #banner store, web3t
            if no
                if store.current.device is \mobile
                    header store, web3t
            if store.current.device is \mobile
                mobilemenu store, web3t
            if store.current.device is \desktop
                # side-menu store, web3t
                left-menu store, web3t
            current-page { store, web3t }
            hovered-address { store }
            Offline.pug
                .notification.fixed-n-centered.error-no-connection.pug Warning! You have no internet connection!\nOffline mode is on!