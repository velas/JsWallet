require! {
    \react
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
}
.terms
    text-align: center
    .terms-body
        >.header
            font-size: 19px
            padding: 10px
        display: inline-block
        min-width: 250px
        >.buttons
            color: inherit
            text-align: center
            button
                display: inline-block
                cursor: pointer
                width: auto
                margin: 15px 5px 0
                text-transform: uppercase
                font-weight: 600
                padding: 10px 6px
                border: 0
                background: #248295
                border-radius: 7px
                font-size: 12px
        textarea
            padding: 10px
            overflow: auto
            width: 100%
            box-sizing: border-box
            height: 350px
            width: 300px
            border: 0
            border-radius: 5px
            outline: none
terms = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    button-style=
        color: info.app.text
    button-primary1-style=
        border: "1px solid #{info.app.border}"
        color: info.app.text
        background: info.app.primary1
    accept = ->
        navigate store, web3t, \:init
        <- web3t.refresh
    .pug.terms
        .pug.terms-body
            .pug.header #{lang.terms-of-use ? 'Terms of Use'}
            textarea.pug(value="#{store.terms}" style=style)
            .pug.buttons
                button.pug(on-click=go-back style=button-primary1-style) #{lang.back}
terms.init = ({ store }, cb)->
    err, res <- get \https://raw.githubusercontent.com/velas/JsWallet/master/TERMS.md .end
    return cb err if err?
    store.terms = res.text
    cb null
module.exports = terms