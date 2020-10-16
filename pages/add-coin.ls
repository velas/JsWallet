require! {
    \react
    \prelude-ls : { map, filter }
    \./loading2.ls
    \../web3.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../icons.ls
    \../../web3t/providers/superagent.ls : { get }
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
    position: absolute
    width: 100%
    top: 0
    z-index: 999
    padding-top: 5%
    box-sizing: border-box
    padding: 10px
    background: rgba(black, 0.08)
    backdrop-filter: blur(5px)
    height: 100vh
    >.account-body
        max-width: 600px
        display: inline-block
        animation-duration: 0.5s
        animation-name: bounceIn
        background: white
        width: 100%
        margin-top: 5vh
        margin-bottom: 25vh
        border-radius: $border
        position: relative
        height: 65vh
        overflow: hidden
        box-shadow: 17px 10px 13px #0000001f, -6px 10px 13px #00000024
        >.title
            position: absolute
            z-index: 999
            top: 0
            box-sizing: border-box
            width: 100%
            height: 100px
            color: gray
            font-size: 22px
            padding: 10px
            .closed
                position: absolute
                padding: 10px 20px
                font-size: 20px
                right: 0
                top: 0
                cursor: pointer
                &:hover
                    color: #CCC
            .search-content
                position: relative
                padding: 0 10px
                @media (max-width: 580px)
                    padding: 0
                .search
                    margin-top: 10px
                    border: 1px solid #CCC
                    padding: 9px
                    border-radius: $border
                    width: 100%
                    padding-left: 35px
                    box-sizing: border-box
                    font-size: 13px
                    outline: none
                .icon
                    top: 6px
                    left: 20px
                    position: absolute
                    @media (max-width: 580px)
                        left: 10px
        >.settings
            padding-top: 90px
            padding-bottom: 90px
            height: calc(65vh - 180px)
            overflow-y: scroll
            .section
                position: relative
                min-height: 200px
                .list
                    height: 80%
                    padding: 10px
                    margin: auto 10px
                    @media (max-width: 580px)
                        padding: 10px 0
                    .item
                        width: 49%
                        margin-bottom: 10px
                        display: inline-block
                        background: #642dbd
                        border-radius: $border
                        padding: 10px
                        text-align: left
                        float: left
                        box-sizing: border-box
                        @media (max-width: 580px)
                            width: 100%
                            float: none
                        &:nth-child(odd)
                            margin-right: 10px
                            @media (max-width: 580px)
                                margin-right: 0
                        >*
                            display: inline-block
                            vertical-align: middle
                            height: 40px
                            line-height: 40px
                            box-sizing: border-box
                        input
                            margin: 0 5px
                            border-radius: $border
                            width: calc(100% - 90px)
                            border: 0
                            padding: 5px 10px
                            outline: none
                            font-size: 15px
                        img
                            width: 40px
                            border-radius: 100px
                        .title
                            margin-left: 10px
                            color: gray
                            width: calc(100% - 90px)
                        button
                            width: 40px
                            height: 40px
                            line-height: 45px
                            border-radius: $border
                            border: 0 !important
                            box-sizing: border-box
                            padding: 0
                            margin: 0
                            cursor: pointer
                            color: black
                            background: transparent
                            outline: none
                            &:hover
                                color: white
                                opacity: .6
                                transition: .5s
                            >*
                                vertical-align: middle
create-item = ({ store, web3t }, item)-->
    add = ->
        store.current.add-coin = no
        <- web3t.install-quick item
    title = "#{item.name}"
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    background =
        background: style.app.input
    menu-style=
        color: style.app.text
    .item.pug(style=background)
        img.pug(src="#{item.image}")
        span.pug.title(style=menu-style) #{title}
        button.pug(on-click=add style=button-style)
            icon \Plus, 20
filter-item = (store)-> (item)->
    return yes if (store.current.filter-plugins ? "").length is 0
    (item.token ? "").index-of(store.current.filter-plugins) > -1
add-by-address = (store, web3t)->
    coin-contract = (e)->
        store.contract-address = e.target.value
    not-found = ->
        store.contract-address = "Not Found"
        <- set-timeout _, 1000
        store.contract-address = ""
    add = ->
        err, data <- get "https://registry.web3.space/token/#{store.contract-address}" .end
        return not-found! if err? or not data.body?token?
        <- web3t.install-quick data.body
        store.current.add-coin = no
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    input-style=
        color: style.app.text
        background: style.app.bg-primary-light
        border: "0"
    erc-bg=
        background: style.app.bg-primary-light
    background =
        background: style.app.input
    .item.pug(style=background)
        img.pug(src="#{icons.erc20-token}" style=erc-bg)
        input.search.pug(placeholder="0x...." value="#{store.contract-address}" on-change=coin-contract style=input-style)
        button.pug(on-click=add style=button-style)
            icon \Plus, 20
add-by-vlxaddress = (store, web3t)->
    coin-contract = (e)->
        store.contract-vlxaddress = e.target.value
    not-found = ->
        store.contract-vlxaddress = "Not Found"
        <- set-timeout _, 1000
        store.contract-vlxaddress = ""
    add = ->
        err, data <- get "https://registry.web3.space/token/#{store.contract-vlxaddress}" .end
        return not-found! if err? or not data.body?token?
        <- web3t.install-quick data.body
        store.current.add-vlxcoin = no
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    input-style=
        color: style.app.text
        background: style.app.bg-primary-light
        border: "0"
    erc-bg=
        background: style.app.bg-primary-light
    background =
        background: style.app.input
    .item.pug(style=background)
        img.pug(src="#{icons.vlx-icon}" style=erc-bg)
        input.search.pug(placeholder="V...." value="#{store.contract-vlxaddress}" on-change=coin-contract style=input-style)
        button.pug(on-click=add style=button-style)
            icon \Plus, 20
module.exports = ({ store, web3t } )->
    return null if store.current.add-coin isnt yes
    close = ->
        store.current.add-coin = no
    filter-registery = (event)->
        store.current.filter-plugins = event.target.value
    style = get-primary-info store
    account-body-style =
        background: style.app.background
        color: style.app.text
    color =
        color: style.app.text
    lang = get-lang store
    input-style=
        color: style.app.text
        background: style.app.input
        border: "0"
#    add-by-address store, web3t
#    add-by-vlxaddress store, web3t
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=color)
                .pug
                    .pug #{lang.your-wallets}
                    .pug.closed(on-click=close)
                        icon \X, 20
                .pug.search-content
                    input.search.pug(placeholder="#{lang.search}" on-change=filter-registery style=input-style)
                    .pug.icon
                        icon \Search, 15
            .pug.settings
                .pug.section
                    .list.pug
                        if store.registry.length > 0
                            store.registry
                                |> filter filter-item store
                                |> map create-item { store, web3t }
                        else
                            .loading.pug
                                loading2 \black