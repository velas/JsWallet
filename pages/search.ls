require! {
    \react
    \react-dom
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
}
.search
    @import scheme
    $border-radius: $border
    $smooth: opacity .15s ease-in-out
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:800px)
        width: 100%
        margin: 0
    .search-field
        .left
            position: relative
        .icon
            position: absolute
            top: 8px
            right: 12px
    .section
        border-bottom: 1px solid rgba(240, 237, 237, 0.16)
        padding: 30px 20px 0
        display: flex
        &.filter
            padding: 0px 20px
        &:last-child
            border: 0
        .title
            padding: 0px
            width: 10%
            text-align: left
            font-size: 14px
            @media(max-width: 800px)
                display: none
            h3, h2
                margin: 0
                line-height: 36px
                font-weight: 400
        .description
            padding: 0px
            font-size: 14px
            width: 50%
            text-align: left
            @media(max-width: 800px)
                width: 100%
            ul
                list-style: none
                padding: 0
                margin: 10px 0 0
                li
                    display: inline-block
                    padding: 15px
                    cursor: pointer
                    &:first-child
                        padding-left: 0
                    .icon
                        margin-right: 5px
                        svg
                            vertical-align: middle !important
                    &.active
                        color: #c671f1
                        border-bottom: 1px solid
                        padding-bottom: 15px
            input
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: $border-radius
                padding: 0px 10px
                font-size: 14px
                margin: 1px
                border: 0px
                box-shadow: none
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 104px
        margin-top: 5px
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
        float: right
        margin-top: 12px
        margin-right: 10px
    >.title
        position: relative
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        background: transparent
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
        >.close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            &:hover
                color: #CCC
    >.toolbar
        position: relative
        height: 60px
        ul
            display: inline-flex
            float: left
            list-style: none
            padding: 0 20px
            line-height: 1.8
            &.path
    >.wrapper
        height: 540px
        display: flex
        overflow-y: scroll
        padding: 0 20px
        >.panel-content
            width: 50%
            margin-left: 10%
            @media(max-width: 800px)
                width: 100%
                margin-left: 0
            .results
                text-align: left
                font-size: 13px
            .section
                padding: 10px 0
                display: block
                border: 0
                &:last-child
                    margin-bottom: 20vh
                .source
                    &:hover
                        .header
                            text-decoration: underline
                .address, .header, .description
                    width: 100%
                    text-align: left
                    margin: 5px 0
                .address
                    color: #969696
                    font-size: 13px
                    cursor: pointer
                .header
                    font-weight: 500
                    color: #6f6fe2
                    font-size: 22px
                    cursor: pointer
                    white-space: nowrap
                    overflow: hidden
                    text-overflow: ellipsis
                .description
                    opacity: .8
                    line-height: 1.6
                    font-size: 13px
                ul.links
                    list-style: none
                    padding: 0
                    margin-bottom: 0
                    color: #6f6fe2
                    font-size: 13px
                    text-align: left
                    margin-top: 0
                    li
                        display: inline-block
                        margin-left: 4px
                        cursor: pointer
                        span
                            &:hover
                                text-decoration: underline
                        + li
                            &:before
                                content: ' · '
                        &:first-child
                            margin-left: 0
        >.store-content
            width: 40%
            overflow: scroll
            position: relative
            @media(max-width: 800px)
                display: none
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
search = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.addressText
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.addressText
    icon-style=
        filter: info.app.nothingIcon
    goto-resources = ->
        navigate store, web3t, \resources
    goto-file-storage = ->
        navigate store, web3t, \filestorage
    goto-staking = ->
        navigate store, web3t, \staking
    .pug.search
        .pug.title(style=border-style2)
            .pug.header This page is under development. You see this only as demo
        .pug.title(style=border-style)
            .pug.header Search page
            .pug.close(on-click=go-back)
                icon "ChevronLeft", 20
        .pug.section(style=border-style3)
            .title.pug
                h2.iron.pug Voogle
            .description.search-field.pug
                .pug.left
                    input.pug(type='text' style=input-style value="dapps" placeholder="dapps")
                    .pug.icon
                        icon \Search, 15
        .pug.section.filter(style=border-style)
            .title.pug
            .description.pug
                ul.pug
                    li.pug
                        span.icon.pug
                            icon \Search, 15
                        span.pug All
                    li.pug.active
                        span.icon.pug
                            icon \Rocket, 15
                        span.pug Dapps
                    li.pug
                        span.icon.pug
                            icon \Globe, 15
                        span.pug Web
                    li.pug
                        span.icon.pug
                            icon \FileMedia, 15
                        span.pug Images
                    li.pug
                        span.icon.pug
                            icon \FileDirectory, 15
                        span.pug Public Files
        .pug.wrapper
            .pug.panel-content
                p.results.pug Estimated Results: 2,000 (0.30sec)
                .pug.section
                    .source.pug(on-click=goto-file-storage)
                        .pug.address wallet.velas.com
                        .pug.header Velas Storage Dapp
                    .pug.description QuikNode provides reliable dedicated endpoints for your Ethereum applications. Geth & Parity. Full & Archive Nodes. HTTP & WebSocket Support. Fast RPC. 8 Locations. Types: MainNet (ETH), Classic (ETC), Kovan/Ropsten/Rinkeby.
                    ul.pug.links
                        li.pug
                            span.pug Learn More
                        li.pug
                            span.pug About Storage
                .pug.section
                    .source.pug(on-click=goto-resources)
                        .pug.address wallet.velas.com
                        .pug.header Velas CPU/GPU/STORAGE Staking Dapp
                    .pug.description With many of the playlists we have assembled, the parameters have been clear. To be considered decentralized finance, or DeFi, we can argue endlessly about ...
                    ul.pug.links
                        li.pug
                            span.pug About
                        li.pug
                            span.pug FAQs
                .pug.section
                    .source.pug(on-click=goto-staking)
                        .pug.address wallet.velas.com
                        .pug.header Velas Staking Dapp
                    .pug.description QuikNode provides reliable dedicated endpoints for your Ethereum applications. Geth & Parity. Full & Archive Nodes. HTTP & WebSocket Support. Fast RPC. 8 Locations. Types: MainNet (ETH), Classic (ETC), Kovan/Ropsten/Rinkeby.
                .pug.section
                    .source.pug
                        .pug.address wallet.velas.com
                        .pug.header Coinrace Dapp
                    .pug.description Bet on a price of popular cryptocurrencies (BTC, ETH, EOS, ZEC, etc.) and win RACE tokens. The game engine is powered by a set of smart contracts written in ...
                .pug.section
                    .source.pug
                        .pug.address wallet.velas.com
                        .pug.header DeFi Dapp | wallet.velas.com
                    .pug.description With many of the playlists we have assembled, the parameters have been clear. To be considered decentralized finance, or DeFi, we can argue endlessly about ...
                    ul.pug.links
                        li.pug
                            span.pug Learn More
                        li.pug
                            span.pug About DeFi
                .pug.section
                    .source.pug
                        .pug.address wallet.velas.com
                        .pug.header DEXX Dapp | wallet.velas.com
                    .pug.description QuikNode provides reliable dedicated endpoints for your Ethereum applications. Geth & Parity. Full & Archive Nodes. HTTP & WebSocket Support. Fast RPC. 8 Locations. Types: MainNet (ETH), Classic (ETC), Kovan/Ropsten/Rinkeby.
                    ul.pug.links
                        li.pug
                            span.pug About
                        li.pug
                            span.pug FAQs
            .pug.store-content
module.exports = search