require! {
    \react
    \../menu-funcs.ls 
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
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
        border-radius: 5px
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
            >.close
                position: absolute
                padding: 5px 10px
                font-size: 30px
                right: 0
                top: 0
                cursor: pointer
                &:hover
                    color: #CCC
        >.settings
            padding-top: 60px
            overflow-y: auto
            height: calc(65vh - 60px)
            .title
                color: $primary
                text-transform: uppercase
                font-size: 14px
                a
                    color: #ee8791
            input
                border-radius: 5px
            textarea
                border-radius: 5px
            input, textarea
                outline: none
                margin-bottom: 3px
                border: 0px
                padding: 3px 10px
                box-sizing: border-box
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: 5px
                color: white
                padding: 5px 15px
                margin-top: 5px
                text-transform: uppercase
                font-size: 10px
                font-weight: 600
                cursor: pointer
                outline: none
                &:hover
                    background: transparent
                    color: $primary
            textarea
                width: 244px
                height: 37px
                resize: none
                font-size: 12px
            .switch-account
                color: #8e8e93
                font-size: 12px
                margin-top: 5px
                .bold
                    font-weight: bold
                .button
                    background: #8e8e93
                    width: 16px
                    height: 16px
                    display: inline-block
                    color: white
                    border-radius: 5px
                    margin: 0 5px
                    cursor: pointer
                    &:hover
                        background: gray
        .bold
            color: #f0c16b
        .section
            border-bottom: 1px solid rgba(240, 237, 237, 0.16)
            &.last
                border-bottom: 0
            padding: 10px
            .title
                padding: 2px
            .description
                padding: 7px
                font-size: 13px
                color: #b0aeae
            .content
        .change-index
            width: 80px
            padding: 1px
            text-align: center
switch-account = (store, web3t)->
    {  account-left, account-right, change-account-index } = menu-funcs store, web3t
    style = get-primary-info store
    input-style =
        background: style.app.wallet
        color: style.app.text
        border: "0"
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    .pug.switch-account(style=color)
        span.pug Account Index:
        span.pug.button(on-click=account-left style=button-primary2-style) <
        span.pug.bold
            input.pug.change-index(value="#{store.current.account-index}" style=input-style on-change=change-account-index)
        span.pug.button(on-click=account-right style=button-primary2-style) >
naming-part = ({ store, web3t })->
    .pug.section
        .pug.title #{lang.your-nickname ? 'Your Nickname'}
        .pug.description #{lang.your-nickname-info ? 'You are able to attach nickname, email or phone number to your account and share it with friends. They will use your nick to resolve your crypto-address'}
        .pug.content
            naming { store, web3t }
manage-account = (store, web3t)->
    { current, generate, enter-pin, cancel-try, edit-seed, save-seed, change-seed, export-private-key } = menu-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    .pug
        .pug.section
            .pug.title(style=color) #{lang.secret-phrase ? 'Secret Phrase'}
            .pug.description(style=color) #{lang.secret-phrase-warning ? 'You are responsible for keeping this phrase safe. In case of loss of this phrase, we will not be able to help you restore it.'}
            .pug.content
                switch
                    case current.try-edit-seed is yes
                        .pug.box
                            .pug
                                input.pug(on-change=enter-pin value="#{current.pin}" type="number" input-mode="numeric" style=input-style placeholder="#{lang.enter-pin ? 'Enter PIN'}")
                            .pug    
                                button.pug(on-click=cancel-try style=button-primary2-style) #{lang.cancel}
                    case current.saved-seed is no
                        .pug.box
                            .pug.title 
                                span.pug #{lang.secret-phrase ? 'Secret Phrase'}
                                a.pug.generate(on-click=generate) (generate)
                            textarea.pug(on-change=change-seed value="#{current.seed}" style=input-style placeholder="#{lang.secret-phrase ? 'Secret Phrase'}")
                            .pug
                                button.pug(on-click=save-seed style=button-primary2-style) #{lang.save}
                    case current.saved-seed is yes
                        .pug
                            button.pug(on-click=edit-seed style=button-primary2-style) #{lang.edit-secret ? 'Edit Secret'}
        .pug.section
            .pug.title(style=color) #{lang.switch-account-index ? 'Switch Account Index'}
            .pug.description(style=color)
                span.pug.bold #{lang.for-advanced-users ? 'For advanced users only'}.
                span.pug #{lang.switch-account-info ? 'You could have a lot of unique addresses by switching account index. By default, you are given an index of 1, but you can change it in range 0 - 2,147,483,647'}
            .pug.content
                switch-account store, web3t
        .pug.section.last
            .pug.title(style=color) #{lang.export-private-key ? 'Export PRIVATE KEY'}
            .pug.description(style=color)
                span.pug.bold #{lang.for-advanced-users ? 'For advanced users only'}
                span.pug #{lang.export-private-key-warning ? 'Please never do it in case when you do not understand exact reason of this action and do not accept risks'}.
            .pug.content
                button.pug(on-click=export-private-key style=button-primary2-style) #{lang.show-secret ? 'Show Secret'}
module.exports = ({ store, web3t } )->
    return null if store.current.manage-account isnt yes
    { close-account } = menu-funcs store, web3t
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    lang = get-lang store
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=account-body-style)
                .pug #{lang.manage-account}
                .pug.close(on-click=close-account) ×
            .pug.settings
                manage-account store, web3t