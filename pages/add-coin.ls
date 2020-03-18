require! {
    \react
    \prelude-ls : { map, filter }
    \./loading2.ls
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
        border-radius: $border
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
                    @media (max-width: 550px)
                        margin: auto
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
                        @media (max-width: 550px)
                            width: 97%
                            float: none
                        &:nth-child(odd)
                            margin-right: 10px
                            @media (max-width: 550px)
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
    placeholder = 
        | store.current.refreshing => "placeholder"
        | _ => ""
    .item.pug
        img.pug(src="#{item.image}")
        span.pug.title(style=menu-style class="#{placeholder}") #{title}
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
        img.pug(src='data:image/png;base64,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')
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
                    .pug #{lang.edit-coins}
                    .pug.close(on-click=close)
                        icon \X, 20
                .pug.search-content
                    input.search.pug(placeholder="#{lang.search}" on-change=filter-registery style=input-style)
                    .pug.icon
                        icon \Search, 15
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
                                loading2 \black