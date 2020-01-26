require! {
    \react
    \prelude-ls : { map, join, filter, head }
    \../get-record.ls
    \../get-name-mask.ls
    \../web3.ls
    \../get-primary-info.ls
    \../get-lang.ls
}
.naming
    @import scheme
    width: 95%
    padding: 0px 0
    margin: 0 10px 3px 10px
    .custom-domain
        input
            height: 22px
            padding: 2px 13px
            width: 100%
            text-align: left
            width: 70%
            border: 0
        position: relative
        width: 100%
        height: 31px
        >.part
            width: 100%
            background: transparent
            position: absolute
            text-align: center
            &.hidden
                z-index: 0
                input
                    color: rgba(black, 0.6)
                    background: transparent
            &.visible
                z-index: 1
                input
                    background: transparent
                    color: #595768
    .message
        font-size: 11px
        background: transparent
        border: none !important
        text-align: center
        height: 15px
        overflow: hidden
        text-overflow: ellipsis
        color: #595768 - 20
        resize: none
        padding: 0 !important
    button
        margin-top: 5px
install-record = (name, record)->
    "Please setup html element <meta property='web3space' value='#{record}' /> on #{name} to pass verification"
state =
    timeout: null
module.exports = ({ store, web3t })->
    { setup-record, verify-record } = web3t.naming
    price = 0.01ETH
    empty = ->
        ( store.current.nickname ? "" ).length is 0
    show-message = (message)->
        store.current.message = message
    can-buy-nickname = if store.current.can-buy then \active else \disabled
    check = (cb)->
        return cb? "Nickname is empty" if empty!
        #err <- verify-network
        return cb? err if err?
        store.current.checking-name = true
        show-message "Loading..."
        err, data <- verify-record store.current.nicknamefull
        store.current.checking-name = no
        return cb? err if err?
        can-buy = data is ""
        store.current.can-buy = can-buy
        return cb? "Address Not Found" if can-buy
        cb? null, data
    resolve-record = ->
        err, data <- check
        return show-message err if err?
        show-message if data.length > 0 then "Busy" else "Free"
        #goto "/resolve/#{store.current.nickname}", store
    buy-nickname = (cb)->
        name = store.current.nicknamefull
        owner = 
            store.current.account.wallets 
                |> filter (.coin.token is \eth)
                |> map (.address)
                |> head
        amount-ethers = price
        record = get-record store
        err, data <- check
        return cb err if err? and err isnt "Address Not Found"
        return cb "Address is already used" if err isnt "Address Not Found"
        err <- setup-record { name, record, amount-ethers, owner }
        return cb install-record name, record if err is "Does not match"
        return cb err if err?
        cb null, "Your name is registered."
    buy-nickname-process = (cb)->
        store.current.status = \buy-nickname
        err, done <- buy-nickname
        return cb err if err?
        cb null
    buy-nickname-click = (event)->
        err, done <- buy-nickname-process
        store.current.status = \main
        return show-message(err.message ? err) if err?
        show-message done
    set-mask = ->
        store.current.nicknamefull = get-name-mask(store.current.nickname ? "")
    enter-nick = (event)->
        console.log \enter-nick
        nickname = (event.target.value ? "").match(/^[a-z0-9\.@]+/)?0 ? ""
        show-message "Typing..."
        clear-timeout state.timeout
        state.timeout = null
        store.current.nickname = nickname
        set-mask!
        state.timeout = set-timeout resolve-record, 2000
    change-to-custom = ->
        store.current.custom-domain = yes
    change-to-ethnamed = ->
        store.current.custom-domain = no
    console.log \nicknamefull, store.current.nicknamefull
    style = get-primary-info store
    input-style = 
        color: style.app.text
        background: style.app.input
    input2-style =
        color: style.app.text 
        background: "rgba(0,0,0,0.2)"
    lang = get-lang store
    .pug.box-container.naming
        .pug.box
            .pug.custom-domain
                .part.hidden.pug
                    input.pug(value="#{store.current.nicknamefull}" style=input-style)
                .part.visible.pug
                    input.pug(value="#{store.current.nickname}" style=input2-style on-change=enter-nick)
            if (store.current.message ? "").length > 0
                .pug.message(title="#{store.current.message}") #{store.current.message}
            .pug
                switch store.current.status
                    case \verify
                        .pug #{lang.verify-nickname ? 'Nickname Verification...'}
                    case \buy-nickname
                        .pug #{lang.get-nickname ? 'Get Nickname'}
                    else
                        button.pug(on-click=buy-nickname-click) #{lang.register ? 'Register'}