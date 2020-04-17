require! {
    \react
    \./wallet.ls
    \prelude-ls : { map, take, drop, filter }
    \./menu.ls
    \../seed.ls : { get }
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./token-migration.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
    \./your-account.ls
    \./icon.ls
    \localStorage
    \../icons.ls
}
.choose-account
    @import scheme
    $real-height: 300px
    $cards-height: 296px
    $pad: 20px
    $radius: 15px    
    height: auto
    box-sizing: border-box
    position: relative
    right: 10px
    bottom: 30px
    $cards-pad: 15px
    z-index: 2
    .icon-svg-edit
        height: 15px
    .icon-svg-create
        height: 10px
    .switch-menu
        right: -20px
        top: 39px
    .header 
        &:after
            position: absolute
            font-weight: bold
            font-size: 40px
            opacity: .05
            top: 20px
            left: -5px
        .hidden
            @media(max-width: 940px)
                visibility: hidden
    .switch-account
        float: right
        line-height: 10px
        width: auto
        top: 0px
        right: 5px
        position: absolute
        text-align: right
        display: block
        z-index: 2
        .ckeck
            color: #3cd5af
        .cancel
            color: #c25b5f
        .name
            text-overflow: ellipsis
            white-space: nowrap
            overflow: hidden
            width: 110px
            text-align: right
            cursor: default
            display: inline-block
            vertical-align: middle
            @media(max-width:500px)
                width: 40px
        input
            outline: none
            width: 100px
            margin-top: -10px
            height: 36px
            line-height: 36px
            border-radius: 0px
            padding: 0px 10px
            font-size: 12px
            opacity: 1
        span
            cursor: pointer
        .icon
            vertical-align: middle
            margin-left: 20px
            transition: transform .5s
            display: inline-block
            &.rotate
                transform: rotate(180deg)
                transition: transform .5s
                display: inline-block
    .h1
        font-size: 12px
        text-transform: uppercase
        letter-spacing: 2px
        opacity: .8
    .your-account
        position: absolute
        width: auto
        display: inline-block
        right: 0
        top: 0
        padding: 12px 20px
        border-left: 0
        >.buttons
            display: none !important
        .buttons
            >.button
                width: 20px
                padding: 0
                outline: none
    >*
        width: 100%
    >.arrow
        position: absolute
        text-align: center
        cursor: pointer
        &.arrow-t
            top: 0
            margin-top: 10px
        &.arrow-d
            bottom: 0
            margin-bottom: 10px
            transform: rotate(180deg)
        &:not(.true)
            >.arrow-d
                visibility: hidden
        >.arrow-container
            display: inline-block
            width: 100%
            max-width: 450px
            position: relative
    >.wallet-container
        overflow: hidden
        overflow-y: auto
        height: 300px
        width: 100%
        border-top: 1px solid #213040
        display: inline-block
module.exports = (store, web3t)->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    border-style =
        border-top: "1px solid #{style.app.border}"
    header-style =
        border-top: "1px solid #{style.app.border}"
        padding: "17px 0px 20px"
        color: style.app.text
        text-align: "left"
    input=
        background: style.app.wallet
        border: "1px solid #{style.app.border}"
        color: style.app.text
    header-left =
        margin-left: "10px"
    border-right=
        border-right: "1px solid #{style.app.border}"
    open-account = ->
        store.current.switch-account = not store.current.switch-account
    edit-account-name = ->
        store.current.edit-account-name = current-account-name!
    default-account-name = -> "Account #{store.current.account-index}"
    edit-account = (e)->
        #console.log e
        store.current.edit-account-name = e.target.value
    done-edit = ->
        local-storage.set-item default-account-name!, store.current.edit-account-name
        cancel-edit-account-name!
    cancel-edit-account-name = ->
        store.current.edit-account-name = ""
    current-account-name = ->
        local-storage.get-item(default-account-name!) ? default-account-name!
    account-name = current-account-name!
    rotate-class =
        if store.current.switch-account then \rotate else \ ""
    view-account-template = ->
        .pug.switch-account.h1
            span.name.pug(on-click=open-account) #{account-name}
            span.pug.icon(on-click=edit-account-name)
                img.icon-svg-edit.pug(src="#{icons.create}")
            span.pug.icon(on-click=open-account class="#{rotate-class}")
                img.icon-svg-create.pug(src="#{icons.arrow-down}")
    edit-account-template = ->
        .pug.switch-account.h1
            input.h1.pug(value="#{store.current.edit-account-name}" on-change=edit-account style=input)
            span.ckeck.pug.icon(on-click=done-edit)
                icon "Check", 20
            span.cancel.pug.icon(on-click=cancel-edit-account-name)
                icon "X", 20
    chosen-account-template =
        if store.current.edit-account-name is "" then view-account-template! else edit-account-template!  
    .choose-account.pug
        chosen-account-template
        your-account store, web3t