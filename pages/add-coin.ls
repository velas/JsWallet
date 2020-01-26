require! {
    \react
    \prelude-ls : { map, filter }
    \./loading.ls
    \../web3.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \superagent : { get }
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
    background: rgba(black, 0.8)
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
        border-radius: 5px
        position: relative
        height: 65vh
        overflow: hidden
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
            .close
                position: absolute
                padding: 5px 10px
                font-size: 30px
                right: 0
                top: 0
                cursor: pointer
                &:hover
                    color: #CCC
            .search
                margin-top: 10px
                border: 1px solid #CCC
                padding: 9px
                border-radius: 6px
                width: 97%
                box-sizing: border-box
                font-size: 13px
                outline: none
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
                    .item
                        width: 100%
                        padding: 5px 6px
                        text-align: left
                        box-sizing: border-box
                        >*
                            display: inline-block
                            vertical-align: middle
                            height: 40px
                            line-height: 40px
                            box-sizing: border-box
                        input
                            margin: 0 5px
                            border-radius: 5px
                            width: calc(100% - 90px)
                            border: 0
                            padding: 5px
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
                            border-radius: 40px
                            border: 1px solid gray
                            box-sizing: border-box
                            padding: 0
                            margin: 0
                            cursor: pointer
                            color: black
                            background: transparent
                            outline: none
                            &:hover
                                background: #7083e8
                                color: white
                            >*
                                vertical-align: middle
create-item = ({ store, web3t }, item)-->
    add = ->
        store.current.add-coin = no
        <- web3t.install-quick item
    title = "#{item.token} #{item.type}"
    style = get-primary-info store
    button-style =
        border: "1px solid #{style.app.text}"
        color: style.app.text
    menu-style=
        color: style.app.text
    .item.pug
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
        background: style.app.wallet
        border: "0"
    .item.pug
        img.pug(src="data:image/png;base64,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")
        input.search.pug(placeholder="0x...." value="#{store.contract-address}" on-change=coin-contract style=input-style)
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
    lang = get-lang store
    input-style=
        color: style.app.text
        background: style.app.wallet
        border: "0"
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=account-body-style)
                .pug
                    .pug #{lang.plugin-registry}
                    .pug.close(on-click=close) ×
                .pug
                    input.search.pug(placeholder="#{lang.search}" on-change=filter-registery style=input-style)
            .pug.settings
                .pug.section
                    .list.pug
                        add-by-address store, web3t
                        if store.registry.length > 0
                            store.registry 
                                |> filter filter-item store
                                |> map create-item { store, web3t }
                        else
                            .loading.pug
                                loading \black