require! {
    \react
    \prelude-ls : { sort-by, reverse, filter, map, find }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
}
.history
    width: 100%
    position: relative
    padding-bottom: 20px
    display: inline-block
    .nothin-to-show
        color: rgba(white, 0.5)
        padding-top: 50px
        text-align: center
        top: 30%
        width: 100%
        position: absolute
        img
            height: 50px
            border-radius: 0
            margin-bottom: 30px
        .head
            font-weight: 600
            margin-bottom: 10px
        .content
            font-size: 14px
            opacity: .7
    .header
        text-align: left
        height: 40px
        box-sizing: border-box
        left: 0
        top: 0
        width: 100%
        .head
            display: inline-block
            &.left
                padding: 0px 0 10px 10px
                margin-top: 8px
            &.right
                float: right
                padding: 0px 10px 0px 0
                margin-top: 8px
                cursor: pointer
        .filter
            width: 118px
            background: #321260
            position: absolute
            top: 39px
            right: 0
            display: inline-grid
            z-index: 1
            .top, .bottom
                padding: 15px
            button
                border-radius: 50px
                margin: 2px
                border: 2px solid hsla(0, 0%, 79%, 0.15)
                opacity: .7
                &.active
                    opacity: 1
                img
                    height: 30px
        .separator
            min-width: 2px
            display: inline-block
        button 
            outline: none
            cursor: pointer
            border: 0
            background: transparent
            display: inline-block
            vertical-align: top
            margin-left: -1px
            padding: 0
            &.active
                border-color: #9d40eb
                background: rgba(59, 213, 175, 0.25)
            line-height: 12px
            height: 40px
            width: 40px
            font-size: 10px
            text-align: center
            >*
                vertical-align: middle
                display: inline-block
            &.fl
                float: right
    .bold
        color: #b2951bad
        font-style: italic
        &.delete
            cursor: pointer
            font-style: normal
            font-size: 10px
            margin-left: 7px
            color: #ffffff
            background: #db5de8
            border-radius: 4px
            width: auto
            letter-spacing: 0px
            padding: 0px 3px 0 2px
    .fee
        display: inline-block
        margin-right: 5px
    .balance
        display: inline-block
        >*
            display: inline-block
        .color
            font-weight: 600
        .rest
            color: #CCC
    .table
        width: 100%
        height: calc(100vh - 100px)
        overflow-y: scroll
        .head, .record
            &.record
                border-radius: 0px
            .cell
                padding: 10px 15px
                display: inline-block
                vertical-align: top
                box-sizing: border-box
                text-align: left
                height: 60px
                white-space: nowrap
                overflow: scroll
                &.network
                    width: 10%
                    div
                        text-align: center
                &.txhash
                    width: 55%
                    a
                        color: black
                &.amount
                    width: 35%
                    text-align: right
            .gray
                $gray: #8290ad
                color: $gray
                font-size: 12px
                .color
                    font-size: 12px
                    color: $gray
            .type
                text-align: center
            .direction
                font-size: 11px
            &.OUT
                .direction
                    color: #ef44b1
                .txhash a
                    color: #c79b9b
            &.IN
                .direction
                    color: #3cd5a4
                .txhash a
                    color: #80ad80
    .panel-footer
        padding: 10px
    img
        height: 20px
        border-radius: 25px
    .hidden
        display: none !important
render-transaction = (store, web3t, tran)-->
    { coins, cut-tx, arrow, delete-pending-tx, amount-beautify, ago } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    menu-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet
    lightText=
        color: style.app.addressText
    { token, tx, amount, fee, time, url, type, pending } = tran
    coin = 
        coins |> find (.token is token)
    .record.pug(class="#{type}" key="#{tx + type}" style=border-style)
        .cell.pug.text-center.network
            .pug
                img.pug(src="#{coin.image}")
            .pug.direction #{arrow(type)}
        .cell.pug.txhash
            a.pug(href="#{url}" target="_blank") #{cut-tx tx}
            .pug.gray(style=lightText)
                span.pug #{lang.created}: 
                    | #{ago time}
                if pending is yes
                    span.pug
                        span.pug.bold (#{lang.pending})
                        span.pug.bold.delete(on-click=delete-pending-tx(tran)) #{lang.delete}
        .cell.pug.amount(style=menu-style)
            .pug(title="#{amount}") 
                amount-beautify amount, 8
            .pug.gray(style=lightText)
                span.pug.fee #{lang.fee}:
                amount-beautify fee, 10
module.exports = ({ store, web3t })->
    { go-back, switch-type-in, switch-type-out, coins, is-active, switch-filter } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    header-style =
        border-bottom: "1px solid #{style.app.border}"
        color: style.app.text
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    filter-style=
        color: style.app.text
        background: style.app.header
    menu-style=
        color: style.app.text
    border-b =
        border-bottom: "1px solid #{style.app.border}"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    nothing-icon=
        filter: style.app.nothingIcon
    expand-collapse = ->
        store.history.filter-open = not store.history.filter-open
    .pug.normalheader.history
        .header.pug(style=header-style)
            if store.current.device is \mobile
                button.pug(on-click=go-back style=button-style)
                    icon "ChevronLeft", 25
            span.pug.head.left #{lang.your-transactions}
            span.pug.head.right(on-click=expand-collapse)
                icon \Settings, 20
            if store.history.filter-open
                .pug.filter(style=filter-body)
                    .pug.top(style=border-b)
                        button.pug(class="#{is-active('IN')}" style=filter-style on-click=switch-type-in) IN
                        button.pug(class="#{is-active('OUT')}" style=filter-style on-click=switch-type-out) OUT
                    .pug.bottom
                        for coin in coins
                            button.pug(key="#{coin.token}" class="#{is-active(coin.token)}" style=filter-style on-click=switch-filter(coin.token))
                                img.pug(src="#{coin.image}")
        .pug
            .pug.table
                if store.transactions.applied.length > 0
                    store.transactions.applied |> map render-transaction store, web3t
            if store.transactions.applied.length is 0
                .pug.nothin-to-show(style=menu-style)
                    img.pug(style=nothing-icon src='data:image/png;base64,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')
                    .pug.head #{lang.nothing-to-show}
                    .pug.content #{lang.make-tx}