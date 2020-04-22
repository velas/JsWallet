require! {
    \react
    \prelude-ls : { sort-by, reverse, filter, map, find }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../icons.ls
}
.history
    @import scheme
    width: 100%
    position: relative
    padding-bottom: 0px
    display: inline-block
    .icon-svg1
        position: relative
        border-radius: 0px
        height: 15px
        top: 2px
    .icon-svg-arrow
        position: relative
        height: 12px
        top: 0px
    &.normalheader
        @media(max-width: 800px)
            margin: 60px 0 0
    .sign
        margin-right: 5px
        font-size: 15px !important
        font-weight: 600
        vertical-align: text-top
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
    .header-table
        .cell
            font-size: 12px
            padding: 10px 15px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
            color: rgb(204, 204, 204)
            overflow-y: hidden
            &.network
                width: 10%
                text-align: center
            &.txhash
                width: 55%
                text-align: left
            &.amount
                width: 35%
                text-align: right
    .header, .header-table
        text-align: left
        height: 60px
        box-sizing: border-box
        left: 0
        top: 0
        width: 100%
        .head
            display: inline-block
            &.left
                padding: 0px 0 10px 10px
                margin-top: 21px
            &.right
                float: right
                padding: 0px 10px 0px 0
                margin-top: 17px
                cursor: pointer
            &.h1
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                opacity: .8
        .filter
            width: 226px
            background: #321260
            position: absolute
            top: 59px
            right: 0
            display: inline-grid
            z-index: 1
            .bottom, .middle
                padding: 10px
            .top
                padding: 0
                display: flex
                button
                    width: 50% !important
                    border: 0 !important
                    border-radius: 0 !important
                    margin: 0 !important
                    height: 39px
                    text-transform: uppercase
                    &.active
                        filter: brightness(1.3)
            .middle
                div
                    line-height: 7px
                    &:first-child
                        margin-bottom: 10px
                label
                    font-size: 10px
                    text-transform: uppercase
                input
                    outline: none
                    width: 100%
                    box-sizing: border-box
                    height: 36px
                    line-height: 36px
                    border-radius: $border
                    padding: 0px 10px
                    font-size: 14px
                    border: 0px
                    box-shadow: none
                button
                    outline: none
                    cursor: pointer
                    border: 1px solid
                    padding: 0
                    box-sizing: border-box
                    border-radius: $border
                    font-size: 10px
                    padding: 0 6px
                    height: 36px
                    color: #6CA7ED
                    text-transform: uppercase
                    font-weight: bold
                    background: transparent
                    transition: all .5s
                    text-overflow: ellipsis
                    overflow: hidden
                    width: 100%
                    margin: 0 auto
                    opacity: 1
                    margin-top: 10px
            button
                border-radius: 50px
                margin: 2px
                border: 2px solid hsla(0, 0%, 79%, 0.15)
                opacity: .85
                border-width: 3px
                &.active
                    opacity: 1
                img
                    height: 33px
                    &.icon-svg
                        height: 10px
                        padding: 0 0 3px 0
                    &.icon-svg-btn
                        height: 12px
                        padding: 0px 5px 0 0px
                &.OUT
                    img
                        filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
                    color: #be6ed2
                &.IN
                    img
                        filter: invert(15%) sepia(14%) saturate(950%) hue-rotate(110deg) brightness(87%) contrast(85%)
                    color: #71c5aa
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
                border-width: 3px
            line-height: 12px
            height: 45px
            width: 45px
            font-size: 10px
            text-align: center
            &.back
                height: 60px
                width: 60px
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
            background: #e6307a
            border-radius: $border
            width: auto
            letter-spacing: 0px
            padding: 0px 3px 1px 0px
    .syncing
        svg
            color: orange
            height: 12px
            width: 15px
            margin-left: 4px
            @keyframes spin
                from
                    transform: rotate(0deg)
                to 
                    transform: rotate(360deg)
            animation-name: spin
            animation-duration: 4000ms
            animation-iteration-count: infinite
            animation-timing-function: linear
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
            color: inherit
            opacity: .75
    .table
        width: 100%
        height: calc(100vh - 80px)
        overflow-y: scroll
        margin-top: -1px
        .head, .record
            &.record
                border-radius: 0px
                .tx-top
                    cursor: default
                    height: 59px
                .tx-middle
                    height: 60px
                &:last-child
                    margin-bottom: 12px
                &:first-child
                    border-top: 1px solid rgb(107, 38, 142)
            .cell
                padding: 10px 0 10px 10px
                display: inline-block
                vertical-align: top
                box-sizing: border-box
                text-align: left
                height: 59px
                white-space: nowrap
                overflow: hidden
                &:last-child
                    padding-right: 10px
                @media screen and (max-width: 800px)
                    overflow-x: scroll
                    overflow-y: hidden
                &.network
                    width: 10%
                    div
                        text-align: center
                &.txhash
                    width: 90%
                    a
                        font-size: 14px
                    img
                        border-radius: inherit
                        border: none
                        margin-left: 3px
                        height: 12px
                        left: 3px
                        position: relative
                &.amount
                    width: 25%
                    text-align: right
                &.divider
                    width: 10%
                    .direction
                        text-align: center
                        line-height: 40px
                &.arrow
                    width: 5%
                    text-align: center
                    line-height: 40px
                    opacity: .5
                    padding-left: 0
                &.more
                    text-align: center
                    width: 6%
                    line-height: 40px
                    cursor: pointer
                &.details-from, &.details-to
                    width: 59%
                    text-align: left
                    height: 60px
                    a
                        display: block
                        text-overflow: ellipsis
                        overflow: hidden
                        width: 100%
                        font-size: 14px
                        text-decoration: none
                        &:hover
                            text-decoration: underline
            .gray
                $gray: #8290ad
                color: $gray
                font-size: 12px
                .color
                    font-size: 12px
                    color: $gray
                img
                    border-radius: inherit
                    border: none
                    margin-left: 3px
                    height: 12px
                    left: 3px
                    position: relative
            .type
                text-align: center
            .direction
                font-size: 11px
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                text-transform: uppercase
            &.OUT
                &.record
                    .tx-top
                        .details-from
                            display: none
                .direction
                    img
                        filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
                    color: #be6ed2
                .txhash a
                    color: #be6ed2
            &.IN
                &.record
                    .tx-top
                        .details-to
                            display: none
                .direction
                    img
                        filter: invert(15%) sepia(14%) saturate(950%) hue-rotate(110deg) brightness(87%) contrast(85%)
                    color: #71c5aa
                .txhash a
                    color: #71c5aa
    .panel-footer
        padding: 10px
    img
        height: 20px
        border-radius: 25px
        &.icon-svg
            position: relative
            border-radius: 0px
            height: 12px
            top: 2px
    .hidden
        display: none !important
render-transaction = (store, web3t, tran)-->
    { transaction-info, coins, cut-tx, arrow, arrow-lg, sign, delete-pending-tx, amount-beautify, ago } = history-funcs store, web3t
    style = get-primary-info store
    filter-icon=
        filter: style.app.filterIcon
    lang = get-lang store
    menu-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
    line-style =
        background: style.app.wallet
    light-style =
        background: style.app.wallet-light
    lightText=
        color: style.app.addressText
    { token, tx, amount, fee, time, url, type, pending, from, to } = tran
    coin = 
        coins |> find (.token is token)
    return null if not coin?
    network = coin[store.current.network]
    request = { network, tx }
    tx-details = ->
        store.history.tx-details = 
            | store.history.tx-details is tx => null
            | _ => tx
    cut-tx = (tx)->
        return \none if not tx?
        t = tx.to-string!
        m = Math.max(document.documentElement.clientWidth, window.innerWidth or 0)
        r =
            | m > 800 => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 20) + \.. + t.substr(t.length - 4, 4)
            | _ => t.substr(0, 4) + \.. + t.substr(tx.length - 25, 12) + \.. + t.substr(t.length - 4, 4)
    cut-hash = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 4) + \.. + t.substr(tx.length - 25, 15) + \.. + t.substr(t.length - 4, 4)
        #r.to-upper-case!
    icon-pending=
        filter: if pending is yes then 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-370deg) saturate(790%) contrast(0.5)' else ''
    amount-pending=
        color: if pending is yes then 'orange' else ''
    .record.pug(class="#{type}" key="#{tx + type}" style=border-style)
        .pug.tx-top(style=line-style)
            .cell.pug.text-center.network
                .pug
                    img.pug(src="#{coin.image}")
                if no    
                    .pug.direction #{arrow(type)}
                .pug.direction
                    img.icon-svg.pug(src="#{arrow-lg(type)}")
            .cell.pug.details-from
                .pug.gray(style=lightText)
                    span.pug #{lang.tx-from}:
                    CopyToClipboard.pug(text="#{from}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
                a.pug(target="_blank" style=menu-style) #{from}
            if no
                .cell.pug.arrow
                    img.icon-svg1.pug(src="#{icons.arrow-right}")
            .cell.pug.details-to
                .pug.gray(style=lightText)
                    span.pug #{lang.tx-to}:
                    CopyToClipboard.pug(text="#{to}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
                a.pug(target="_blank" style=menu-style) #{to}
            .cell.pug.amount(style=menu-style)
                .pug(title="#{amount}" style=amount-pending)
                    span.sign.direction.pug #{sign(type)}
                    amount-beautify amount, 8
                .pug.gray(style=lightText)
                    span.pug.fee #{lang.fee}:
                    amount-beautify fee, 10
            .cell.pug.divider.more(on-click=tx-details)
                img.icon-svg1.pug(src="#{icons.more}" style=icon-pending)
        if store.history.tx-details is tx
            .pug.tx-middle(style=light-style on-click=transaction-info(request))
                .cell.pug.divider
                    if no
                        .pug.direction #{arrow(type)}
                .cell.pug.txhash
                    a.pug(href="#{url}" target="_blank") #{cut-hash tx}
                    CopyToClipboard.pug(text="#{tx}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
                    .pug.gray(style=lightText)
                        span.pug #{lang.created}: 
                            | #{ago time}
                        if pending is yes
                            span.pug
                                span.pug.bold.syncing
                                    icon \Sync, 10
                                span.pug.bold.delete(on-click=delete-pending-tx(tran)) #{lang.delete}
module.exports = ({ store, web3t })->
    { go-back, switch-type-in, switch-type-out, coins, is-active, switch-filter } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    header-style =
        border-bottom: "1px solid #{style.app.border}"
        color: style.app.text
    header-style-light =
        border-bottom: "1px solid #{style.app.border-light}"
        color: style.app.text
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    filter-style=
        background: style.app.header
        font-weight: "600"
    btn-style=
        background: style.app.header
        border-right: "1px solid #{style.app.border}"
        font-weight: "600"
    menu-style=
        color: style.app.text
    border-b =
        border-bottom: "1px solid #{style.app.border}"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    input-style=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    lightText=
        color: style.app.addressText
    nothing-icon=
        filter: style.app.nothingIcon
    header-table-style=
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet-light
    expand-collapse = ->
        store.history.filter-open = not store.history.filter-open
    .pug.normalheader.history
        .header.pug(style=header-style-light)
            if store.current.device is \mobile
                button.back.pug(on-click=go-back style=button-style)
                    img.icon-svg-arrow.pug(src="#{icons.arrow-left}")
            span.pug.head.left.h1 #{lang.your-transactions}
            span.pug.head.right(on-click=expand-collapse)
                img.icon-svg1.pug(src="#{icons.filter}")
            if store.history.filter-open
                .pug.filter(style=filter-body)
                    .pug.top(style=border-b)
                        button.IN.pug(class="#{is-active('IN')}" style=btn-style on-click=switch-type-in)
                            img.icon-svg.pug(src="#{icons.get}")
                            br.pug
                            |#{lang.in}
                        .pug(style=btn-style)
                        button.OUT.pug(class="#{is-active('OUT')}" style=btn-style on-click=switch-type-out)
                            img.icon-svg.pug(src="#{icons.send}")
                            br.pug
                            |#{lang.out}
                    .pug.middle(style=border-b)
                        .pug
                            input.pug(type='text' style=input-style placeholder="#{lang.from}")
                        .pug
                            input.pug(type='text' style=input-style placeholder="#{lang.to}")
                        button.pug(on-click style=button-primary1-style)
                            span.pug
                                img.icon-svg-btn.pug(src="#{icons.apply}")
                                | #{lang.apply}
                    .pug.bottom
                        for coin in coins
                            button.pug(key="#{coin.token}" class="#{is-active(coin.token)}" style=filter-style on-click=switch-filter(coin.token))
                                img.pug(src="#{coin.image}")
        if no    
            if store.transactions.applied.length > 0
                .header-table.pug(style=header-table-style)
                    span.pug.cell.network(style=lightText) #{lang.network}
                    span.pug.cell.txhash(style=lightText) #{lang.trx-id}
                    span.pug.cell.amount(style=lightText) #{lang.trx-amount}
        .pug
            .pug.table
                if store.transactions.applied.length > 0
                    store.transactions.applied |> map render-transaction store, web3t
            if store.transactions.applied.length is 0
                .pug.nothin-to-show(style=menu-style)
                    img.pug(style=nothing-icon src="#{icons.search-history}"
                    .pug.head #{lang.nothing-to-show}
                    .pug.content #{lang.make-tx}