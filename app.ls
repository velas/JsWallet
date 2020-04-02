require! {
    \mobx-react : { observer }
    \mobx : { observable }
    \react
    \./pages.ls
    \./pages/header.ls
    \./pages/side-menu.ls
    \./pages/banner.ls
    \./description.ls
    \./browser/window.ls
    \./copy-message.ls
    \./modal.ls : { modal-control }
    \./get-primary-info.ls
    \./pages/confirmation.ls : { confirmation-control }
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
    .title
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
    .manage-account
        margin-left: -60px
        @media (max-width: 800px)
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
        -webkit-animation-duration: 1s
        animation-duration: 1s
        -webkit-animation-fill-mode: forwards
        animation-fill-mode: forwards
        -webkit-animation-iteration-count: infinite
        animation-iteration-count: infinite
        -webkit-animation-name: placeload
        animation-name: placeload
        -webkit-animation-timing-function: linear
        animation-timing-function: linear
        background: #f6f7f8
        background: #eeeeee
        background: -webkit-gradient(linear, left top, right top, color-stop(8%, #eeeeee), color-stop(18%, #dddddd), color-stop(33%, #eeeeee))
        background: -webkit-linear-gradient(left, #eeeeee 8%, #dddddd 18%, #eeeeee 33%)
        background: linear-gradient(to right, #442080 8%, #422375 18%, #3b1b6f 33%)
        -webkit-background-size: 800px 104px
        background-size: 1200px 104px
        position: relative
        color: transparent !important
        width: 100%
        display: inline-block
        height: 16px
    @-webkit-keyframes placeload
        0%
            background-position: -468px 0
        100%
            background-position: 468px 0
    @keyframes placeload
        0%
            background-position: -468px 0
        100%
            background-position: 468px 0
    @media (max-width: 800px)
        .wallet-main, >.content, .history, .search, .filestore, .resources, .staking, .settings-menu, .staking-res
            margin: 120px 0 0
            >.title
                margin: 60px 0 0
                position: fixed
                z-index: 1111111
module.exports = ({ store, web3t })->
    return null if not store?
    current-page =
        pages[store.current.page]
    theme = get-primary-info(store)
    style =
        background: theme.app.background
    syncing = 
        | store.current.refreshing => "syncing"
        | _ => ""
    .pug
        description store
        .app.pug(key="content" style=style class="#{syncing}")
            modal-control store, web3t
            confirmation-control store, web3t
            copy-message store, web3t
            banner store, web3t
            if store.current.device is \mobile
                header store, web3t
            if store.current.device is \desktop
                side-menu store, web3t
            current-page { store, web3t }