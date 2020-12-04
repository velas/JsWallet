require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \./epoch.ls
    \../icons.ls
    \./alert-demo.ls
    \../components/burger.ls
}
.search
    @import scheme
    $border-radius: var(--border-btn)
    $smooth: opacity .15s ease-in-out
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: $left-margin
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    .search-input
        position: fixed
        background: var(--background)
        z-index: 1
        width: 100%
    @media(max-width:$ipad)
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
            &.tabs
                overflow: hidden
                ul
                    overflow-x: scroll
                    scrollbar-width: none
                    white-space: nowrap
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
        position: sticky
        position: -webkit-sticky
        background: var(--background)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        z-index: 2
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
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
        height: calc(100vh - 250px)
        display: block
        overflow-y: scroll
        scrollbar-width: none
        padding: 0 20px
        margin-top: 129px
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
                &.developing
                    opacity: .5
                    .source
                        &:hover
                            .header, .address
                                text-decoration: none
                                cursor: not-allowed
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
            position: relative
            @media(max-width: 800px)
                display: none
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
all = (store, web3t)->
    lang = get-lang store
    .pug.panel-content
        p.results.pug #{lang.under-development}
dapps = (store, web3t)->
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
        background-color: info.app.primary2-spare
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
        background-color: info.app.primary1-spare
    input-style=
        background: info.app.input
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    hide-sound=
        opacity: "0"
        float: "right"
    goto-resources = ->
        navigate store, web3t, \resources
    goto-file-storage = ->
        navigate store, web3t, \filestorage
    goto-staking = ->
        navigate store, web3t, \staking
    goto-resources2 = ->
        navigate store, web3t, \resources2
    goto-choose-staker = ->
        navigate store, web3t, \choosestaker
    goto-videostorage = ->
        navigate store, web3t, \videostorage
    goto-soundstorage = ->
        navigate store, web3t, \soundstorage
    goto-notice = ->
        navigate store, web3t, \notification
    goto-wallets = ->
        navigate store, web3t, \offlinewallets
    goto-vote = ->
        navigate store, web3t, \vote
    goto-util = ->
        navigate store, web3t, \util
    .pug.panel-content
        p.results.pug
            | #{lang.estimated-results}:
            | 2,000
            | (0.30
            | #{lang.sec}
            | )
        .pug.section
            .source.pug(on-click=goto-file-storage)
                .pug.address #{lang.velas-sphere}
                .pug.header #{lang.storage-dapp}
            .pug.description #{lang.storage-description}
            ul.pug.links
                li.pug
                    span.pug(on-click=goto-videostorage) #{lang.video-storage}
                li.pug(on-click=goto-soundstorage style=hide-sound)
                    span.pug Sound Storage
        .pug.section
            .source.pug(on-click=goto-resources2)
                .pug.address #{lang.velas-sphere}
                .pug.header #{lang.velas-cpu-staking}
            .pug.description
            ul.pug.links
                li.pug
                    span.pug About
                li.pug
                    span.pug FAQs
        .pug.section
            .source.pug(on-click=goto-resources)
                .pug.address #{lang.velas-sphere}
                .pug.header #{lang.velas-cpu}
            .pug.description #{lang.cpu-description}
            ul.pug.links
                li.pug
                    span.pug About
                li.pug
                    span.pug FAQs
        .pug.section
            .source.pug(on-click=goto-wallets)
                .pug.address Download Velas Wallets
                .pug.header Velas Wallets
            .pug.description For mac, windows, ios, android devices
        .pug.section
            .source.pug(on-click=goto-staking)
                .pug.address #{lang.velas-blockchain}
                .pug.header #{lang.staking-dapp}
            .pug.description #{lang.staking-description}
            ul.pug.links
                li.pug
                    span.pug(on-click=goto-choose-staker) #{lang.delegate-stake}
        .pug.section
            .source.pug(on-click=goto-notice)
                .pug.address #{lang.velas-sphere}
                .pug.header #{lang.velas-messenger}
            .pug.description
        .pug.section
            .source.pug(on-click=goto-vote)
                .pug.address #{lang.velas-sphere}
                .pug.header Vote
            .pug.description
        .pug.section
            .source.pug(on-click=goto-util)
                .pug.address #{lang.velas-sphere}
                .pug.header Convert VLX2ETH
            .pug.description
        .pug.section.developing
            .source.pug
                .pug.address wallet.velas.com
                .pug.header Coinrace Dapp | This page is under development.
            .pug.description Bet on a price of popular cryptocurrencies (BTC, ETH, EOS, ZEC, etc.) and win RACE tokens. The game engine is powered by a set of smart contracts written in ...
        .pug.section.developing
            .source.pug
                .pug.address wallet.velas.com
                .pug.header DeFi Dapp | This page is under development.
            .pug.description With many of the playlists we have assembled, the parameters have been clear. To be considered decentralized finance, or DeFi, we can argue endlessly about ...
            ul.pug.links
                li.pug
                    span.pug Learn More
                li.pug
                    span.pug About DeFi
        .pug.section.developing
            .source.pug
                .pug.address wallet.velas.com
                .pug.header DEXX Dapp | This page is under development.
            .pug.description QuikNode provides reliable dedicated endpoints for your Ethereum applications. Geth & Parity. Full & Archive Nodes. HTTP & WebSocket Support. Fast RPC. 8 Locations. Types: MainNet (ETH), Classic (ETC), Kovan/Ropsten/Rinkeby.
            ul.pug.links
                li.pug
                    span.pug About
                li.pug
                    span.pug FAQs
web = (store, web3t)->
    lang = get-lang store
    .pug.panel-content
        p.results.pug #{lang.under-development}
images = (store, web3t)->
    lang = get-lang store
    .pug.panel-content
        p.results.pug #{lang.under-development}
files = (store, web3t)->
    lang = get-lang store
    .pug.panel-content
        p.results.pug #{lang.under-development}
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
        background: info.app.background
        background-color: info.app.bgspare
    border-style3 =
        color: info.app.text
        border-bottom: "0"
        background: info.app.background
        background-color: info.app.bgspare
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
        background-color: info.app.primary2-spare
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
        background-color: info.app.primary1-spare
    input-style=
        background: info.app.input
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    activate = (tab)-> ->
        store.search.tab = tab 
    activate-all = activate \all
    activate-dapps = activate \dapps
    activate-web = activate \web
    activate-images = activate \images
    activate-files = activate \files
    active-class = (tab)->
        if store.search.tab is tab then 'active' else ''
    active-all = active-class \all
    active-dapps = active-class \dapps
    active-web = active-class \web
    active-images = active-class \images
    active-files = active-class \files
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.search
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") #{lang.search}
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        .pug.search-input
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
                .description.tabs.pug
                    ul.pug
                        li.pug(on-click=activate-all class="#{active-all}")
                            span.icon.pug
                                icon \Search, 15
                            span.pug #{lang.all}
                        li.pug(on-click=activate-dapps class="#{active-dapps}")
                            span.icon.pug
                                icon \Rocket, 15
                            span.pug #{lang.dapps}
                        li.pug(on-click=activate-web class="#{active-web}")
                            span.icon.pug
                                icon \Globe, 15
                            span.pug #{lang.web}
                        li.pug(on-click=activate-images class="#{active-images}")
                            span.icon.pug
                                icon \FileMedia, 15
                            span.pug #{lang.images}
                        li.pug(on-click=activate-files class="#{active-files}")
                            span.icon.pug
                                icon \FileDirectory, 15
                            span.pug #{lang.public-files}
        .pug.wrapper
            if active-all is \active
                all store, web3t
            if active-dapps is \active
                dapps store, web3t
            if active-web is \active
                web store, web3t
            if active-images is \active
                images store, web3t
            if active-files is \active
                files store, web3t
            .pug.store-content
module.exports = search