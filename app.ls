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
    .icon-svg
        position: relative
        height: 12px
        top: 2px
        padding: 0px 5px 0 0px
    .amount
        font-family: 'Roboto', sans-serif
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
    .show-detail
        overflow: hidden
        .wallet
            background: rgb(67, 32, 124) !important
        .wallet-top
            padding: 0 20px
            height: 50%
            @media (max-width: 920px)
                display: flex
            .top-left
                width: auto
                float: left
                height: auto
                color: #fff
                overflow: auto
                text-overflow: unset
                img
                    height: 60px !important
                    width: 60px !important
                    max-width: 60px !important
                .info
                    display: none
            .top-middle
                width: 35%
                float: left
                color: #fff
                text-align: left
                .title-balance
                    display: inline-block !important
                .title
                    font-size: 17px
                    font-weight: 700
                .balance
                    font-weight: 600
                    font-size: 16px
                .price
                    opacity: .8
                    overflow: hidden
                    text-overflow: ellipsis
            .top-right
                width: auto
                float: right
                color: #fff
                position: relative
                top: 25px
                button
                    width: 100px
                    &.btn-open
                        display: none
                    span
                        line-height: 26px
                    svg
                        float: left
                @media (max-width: 920px)
                    top: 0px
        .wallet-middle
            width: 70%
            height: 85px
            float: left
            padding: 20px
            border-top: 1px solid rgb(107, 38, 142)
            border-right: 1px solid rgb(107, 38, 142)
            &:last-child
                display: block
            &:last-child
                width: 30%
                border-right: 0
            .name
                color: #fff
                font-size: 16px
                font-weight: 700
                &.per
                    font-size: 10px
                    color: orange
                    font-weight: 100
                &:last-child
                    font-size: 10px
                    text-transform: uppercase
                    letter-spacing: 2px
                    margin-top: 5px
                    opacity: .8
            .title-balance
                color: #fff
                font-size: 14px
                text-align: left
            span
                padding-left: 10px
            a
                width: 85%
                float: left
                text-align: left
            img
                margin-right: 20px
            .browse
                display: inline-block
                position: absolute
                top: 3px
                right: 40px
                width: auto
                img
                    width: 16px
                    top: 1px
                    position: relative
                    margin: 0
                    display: inline-block
        .info
            text-align: left
            margin-left: 0px
            text-overflow: ellipsis
            overflow: hidden
            width: 65px
            @media screen and (max-width: 390px)
                display: none
            .name
                padding-left: 3px
                font-size: 16px
            .price
                padding-left: 3px
                font-size: 12px
                font-weight: bold
                overflow: hidden
                text-overflow: ellipsis
        .table
            width: 100%
            height: calc(100vh - 260px)
            margin-top: -1px
        .wallet
            display: none
            &.big
                height: 200px
                padding-top: 10px
            &.active
                display: block
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