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
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
}
.manage-account
    @import scheme
    @keyframes bounceIn
        from
            opacity: 0
            transform: scale3d(0.8, 0.8, 0.8)
        to
            opacity: 1
            transform: scale3d(1, 1, 1)
    position: fixed
    width: 100%
    top: 0
    z-index: 999
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 10px
    background: rgba(black, 0.8)
    >.account-body
        max-width: 600px
        display: inline-block
        overflow: hidden
        animation-duration: 0.5s
        animation-name: bounceIn
        background: white
        width: 100%
        margin-top: 5vh
        margin-bottom: 25vh
        padding-bottom: 50px
        border-radius: $border
        position: relative
        max-height: 70vh
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
            >.close
                position: absolute
                font-size: 20px
                right: 20px
                top: 13px
                cursor: pointer
                &:hover
                    color: #CCC
        >.settings
            padding-top: 60px
            overflow-y: auto
            height: calc(65vh - 30px)
            .title
                color: $primary
                text-transform: uppercase
                font-size: 14px
                a
                    color: #ee8791
            .box
                input
                    width: 104px
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
                width: 104px
                margin-top: 20px
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
            &.last
                border-bottom: 0
            &:first-child
                background: url("https://res.cloudinary.com/dfbhd7liw/image/upload/v1582209591/velas/logo-velas-opacity.png")
                background-repeat: no-repeat
                background-position: left 10px
            padding: 50px 10%
            .address
                text-overflow: ellipsis
                overflow: hidden
                display: block
                position: relative
                img
                    top: 3px
                    right: 30px
                    width: 15px
                    position: absolute
            .title
                padding: 2px
            .description
                padding: 7px
                font-size: 16px
                color: #b0aeae
                .step
                    color: #fff
                    font-weight: 600
                    border: 1px solid orange
                    border-radius: 50px
                    padding: 3px 10px
                    margin-right: 10px
                    box-shadow: 0 0 0 rgba(204,169,44, 0.4)
                    animation: pulse 2s infinite
            .migrate-img
                margin-bottom: 5px
                img
                    margin: 10px auto
                    width: 100px
            .cap
                text-transform: capitalize
            .low
                text-transform: lowercase
            .link
                color: #6f6fe2
                text-decoration: underline
                cursor: pointer
                font-size: 16px
            .pb-0
                padding-bottom: 0
            .content
        .change-index
            width: 80px
            padding: 1px
            border-radius: 0 !important
            text-align: center
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
    @-webkit-keyframes pulse
        0%
            -webkit-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
        70%
            -webkit-box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
        100%
            -webkit-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
    @keyframes pulse
        0%
            -moz-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
            box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
        70%
            -moz-box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
            box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
        100%
            -moz-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
            box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
token-migration = (store, web3t)->
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
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    filter-icon=
        filter: style.app.filterIcon
    swap = ->
        return if store.current.token-migration is 'Loading...'
        address = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx2) 
                |> (.address)
        store.current.token-migration = 'Loading...'
        err <- get "https://mainnet-v2.velas.com/migration/try-migrate/#{address}" .end
        #return alert "#{err}" if err?
        <- web3t.refresh
        store.current.token-migration = null
    .pug
        .pug.section.last
            .pug.migrate-img
                img.iron.pug(src="#{style.branding.logo}" style=logo-style)
            .pug.description(style=color)
                span.pug
                    span.step.pug 1
                    | Please make a deposit of all your coins at this address to get the same amount of coins vlx2
                br.pug
                br.pug
                span.address.pug
                    a.pug.link #{store.current.token-migration}
                    CopyToClipboard.pug(text="#{store.current.token-migration}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
                br.pug
                span.pug
                    span.step.pug 2
                    | Click to "Swap Tokens" after deposited account
            .pug.content
                button.pug(on-click=swap style=button-primary2-style) Swap Tokens
module.exports = ({ store, web3t } )->
    return null if not store.current.token-migration?
    { close-migration } = menu-funcs store, web3t
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    border-style =
        background: style.app.header
        color: style.app.text
    lang = get-lang store
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=border-style)
                .pug.header Token Migration
                .pug.close(on-click=close-migration)
                    icon \X, 20
            .pug.settings
                token-migration store, web3t