require! {
    \react
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../add-coin.ls
    \../topup.ls
    \./icon.ls
    \prelude-ls : { map }
    \localStorage
}
.your-account
    @import scheme
    position: relative
    width: auto
    display: inline-block
    $size: 50px
    $color: rgba(#FFF, 0.5)
    .switch-menu
        position: absolute
        right: 60px
        top: 60px
        width: 150px
        background: #321260
        display: inline-grid
        z-index: 3
        .col
            font-size: 14px
            padding: 10px 15px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
            color: #fff
            overflow-y: hidden
            &.folder-menu
                text-align: left
                display: inline-flex
                span
                    margin-right: 10px
        .table-row-menu
            text-align: left
            &:hover
                cursor: pointer
                background: rgba(75, 40, 136, 0.2)
            &.active
                background: rgba(75, 40, 136, 0.2)
        .bottom, .middle
            padding: 10px
    >.username
        color: $color
        font-size: 13px
        display: inline-block
        vertical-align: top
        >*
            display: inline-block
        >.nick
            font-size: 14px
            color: $color
            font-weight: bold
        >.index
            margin-left: 5px
            font-size: 10px
            margin-bottom: 2px
    >.buttons
        >.button
            text-transform: uppercase
            overflow: hidden
            text-overflow: ellipsis
            cursor: pointer
            font-size: 10px
            color: black
            margin: 0
            padding: 10px
            font-weight: bold
            height: 36px
            line-height: 10px
            border-radius: $border
            display: inline-block
            width: 80px
            vertical-align: middle
            text-align: center
            white-space: nowrap
            &.mt-5
                margin-top: 15px
            &:last-child
                margin-left: 0px
            &.lock
                background: transparent
                border: 1px solid white
                color: white
background = ->
    svg.pug(height='128px' version='1.1' viewbox='0 0 128 128' width='128px')
        g.pug
            path.pug(d='M86.785,109.878   c-8.188,4.317-16.533,5.962-26.515,5.962c-24.428,0-45.133-17.879-45.133-46.479c0-30.687,21.299-57.201,54.376-57.201   c25.918,0,43.348,18.175,43.348,43.052c0,22.342-12.517,35.448-26.514,35.448c-5.968,0-11.475-4.021-11.025-13.105h-0.594   C69.514,86.342,62.66,90.66,53.721,90.66c-8.636,0-16.083-7-16.083-18.764c0-18.473,14.591-35.309,35.296-35.309   c6.403,0,12.067,1.34,15.937,3.13L83.813,66.68c-2.232,11.323-0.45,16.532,4.463,16.685c7.604,0.146,16.095-9.982,16.095-27.261   c0-21.602-12.964-37.09-36.06-37.09c-24.27,0-44.684,19.212-44.684,49.456c0,24.877,16.241,40.215,38.28,40.215   c8.491,0,16.387-1.783,22.499-5.21L86.785,109.878z M78.598,45.527c-1.493-0.449-4.027-1.043-7.446-1.043   c-13.112,0-23.689,12.366-23.689,26.812c0,6.556,3.275,11.322,9.836,11.322c8.637,0,16.532-11.025,18.169-20.256L78.598,45.527z')
module.exports = (store, web3t)->
    { open-account, open-migration, current, account-name, lock } = menu-funcs store, web3t
    style = get-primary-info store
    button-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: style.app.input
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary0-style=
        border: "0"
        color: style.app.text
        background: "transparent"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    border-top=
        border-top: "1px solid #{style.app.border}"
    lang = get-lang store
    account-index = "#{lang.account-index ? 'Account index'}: #{current.account-index}"
    .pug.your-account
        if store.preference.username-visible is yes
            .pug.username 
                .pug.nick #{current.account.account-name}
                .pug.index #{account-index}
        .pug.buttons
            if no
                .pug.button.edit(on-click=topup(store) style=button-primary1-style) #{lang.topup}
            if store.current.device is \mobile
                button.pug.button.lock.mt-5(on-click=add-coin(store) style=button-primary2-style) #{lang.edit-coins}
            if no
                if store.current.device is \mobile
                    button.pug.button.lock.mt-5(on-click=open-migration style=button-primary1-style) Migration
            if store.current.device is \desktop
                button.pug.button.lock(on-click=add-coin(store) style=button-primary0-style)
                    icon "Plus", 20
            if no
                if store.current.device is \desktop
                    button.pug.button.lock(on-click=open-migration style=button-primary0-style)
                        icon "Zap", 20
        length = +(localStorage.get-item('Accounts') ? 3)
        create-account-position = (index)->
            change-account = ->
                store.current.account-index = index
                store.current.switch-account = no
                <- web3t.refresh
            default-account-name = -> "Account #{index}"
            current-account-name = ->
                local-storage.get-item(default-account-name!) ? default-account-name!
            account-name = current-account-name!
            .pug.table-row-menu(on-click=change-account key="account#{index}")
                .col.folder-menu.pug
                    .pug #{account-name}
        create-account = ->
            new-length = 1 + length
            store.current.account-index = new-length
            localStorage.set-item('Accounts', new-length)
            store.current.switch-account = no
            <- web3t.refresh
        if store.current.switch-account
            .pug.switch-menu(style=filter-body)
                .pug.middle
                    [1 to length] |> map create-account-position
                .pug.middle(style=border-top)
                    .pug.table-row-menu
                        .col.folder-menu.pug(on-click=create-account)
                            .pug Create Account