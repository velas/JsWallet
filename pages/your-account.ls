require! {
    \react
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../add-coin.ls
    \../topup.ls
    \./icon.ls
    \prelude-ls : { map, filter }
    \localStorage
    \../icons.ls
    \./tor.ls
}
.your-account
    @import scheme
    position: relative
    width: auto
    display: inline-block
    $size: 50px
    $color: rgba(#FFF, 0.5)
    .icon-svg1
        position: relative
        border-radius: 0px
        height: 15px
        top: 0
    .icon-svg-plus
        position: relative
        height: 16px
        width: 16px
        top: 2px
        padding: 0
    .switch-menu
        position: absolute
        right: -1px
        top: 60px
        width: 170px
        display: inline-grid
        z-index: 3
        box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
        border-radius: 0 0 $border $border
        .folder-menu
            width: 130px
            div
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
        .col
            font-size: 12px
            padding: 10px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
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
                background: var(--bg-primary-light)
            &.active
                background: var(--bg-primary-light)
        .middle
            padding: 11px 10px
            height: 37px
            &.account
                padding: 10px
                min-height: 155px
                overflow: scroll
                background: linear-gradient(var(--color1) 30%, rgba(50,18,96, 0)), linear-gradient(rgba(50,18,96, 0), var(--color1) 70%) 0 100%, radial-gradient(farthest-side at 50% 0, var(--color2), rgba(0,0,0,0)), radial-gradient(farthest-side at 50% 100%, var(--color2), rgba(0,0,0,0)) 0 100%
                background-repeat: no-repeat
                background-attachment: local, local, scroll, scroll
                background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                animation: breathe 3s ease-in infinite
                -moz-transition: breathe 3s ease-in infinite
                -web-kit-transition: breathe 3s ease-in infinite
            @keyframes breathe
                0%
                    background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                15%
                    background-size: 100% 30px, 100% 30px, 100% 17px, 100% 17px
                30%
                    background-size: 100% 30px, 100% 30px, 100% 20px, 100% 20px
                45%
                    background-size: 100% 30px, 100% 30px, 100% 23px, 100% 23px
                60%
                    background-size: 100% 30px, 100% 30px, 100% 23px, 100% 23px
                75%
                    background-size: 100% 30px, 100% 30px, 100% 20px, 100% 20px
                90%
                    background-size: 100% 30px, 100% 30px, 100% 17px, 100% 17px
                100%
                    background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
            @-webkit-keyframes breathe
                0%
                    background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                15%
                    background-size: 100% 30px, 100% 30px, 100% 17px, 100% 17px
                30%
                    background-size: 100% 30px, 100% 30px, 100% 20px, 100% 20px
                45%
                    background-size: 100% 30px, 100% 30px, 100% 23px, 100% 23px
                60%
                    background-size: 100% 30px, 100% 30px, 100% 23px, 100% 23px
                75%
                    background-size: 100% 30px, 100% 30px, 100% 20px, 100% 20px
                90%
                    background-size: 100% 30px, 100% 30px, 100% 17px, 100% 17px
                100%
                    background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
            .buttons
                padding: 0
                width: 100%
                button
                    outline: none
                    cursor: pointer
                    border: 0
                    padding: 0
                    box-sizing: border-box
                    border-radius: $border
                    font-size: 10px
                    padding: 0 6px
                    height: 36px
                    color: #6CA7ED
                    text-transform: uppercase
                    font-weight: bold
                    background: transparent
                    transition: all .5s
                    text-overflow: ellipsis
                    overflow: hidden
                    width: 100%
                    margin: 0 auto
                    opacity: 1
                    img
                    &.icon-svg
                        position: relative
                        height: 12px
                        top: 2px
                        padding-right: 5px
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
            width: 100%
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
                svg
                    width: 20px
background = ->
    svg.pug(height='128px' version='1.1' viewbox='0 0 128 128' width='128px')
        g.pug
            path.pug(d='M86.785,109.878   c-8.188,4.317-16.533,5.962-26.515,5.962c-24.428,0-45.133-17.879-45.133-46.479c0-30.687,21.299-57.201,54.376-57.201   c25.918,0,43.348,18.175,43.348,43.052c0,22.342-12.517,35.448-26.514,35.448c-5.968,0-11.475-4.021-11.025-13.105h-0.594   C69.514,86.342,62.66,90.66,53.721,90.66c-8.636,0-16.083-7-16.083-18.764c0-18.473,14.591-35.309,35.296-35.309   c6.403,0,12.067,1.34,15.937,3.13L83.813,66.68c-2.232,11.323-0.45,16.532,4.463,16.685c7.604,0.146,16.095-9.982,16.095-27.261   c0-21.602-12.964-37.09-36.06-37.09c-24.27,0-44.684,19.212-44.684,49.456c0,24.877,16.241,40.215,38.28,40.215   c8.491,0,16.387-1.783,22.499-5.21L86.785,109.878z M78.598,45.527c-1.493-0.449-4.027-1.043-7.446-1.043   c-13.112,0-23.689,12.366-23.689,26.812c0,6.556,3.275,11.322,9.836,11.322c8.637,0,16.532-11.025,18.169-20.256L78.598,45.527z')
module.exports = (store, web3t)->
    { open-account, open-migration, current, account-name, refresh, lock } = menu-funcs store, web3t
    create-account = ->
        new-length = 1 + length
        store.current.account-index = new-length
        localStorage.set-item('Accounts', new-length)
        store.current.switch-account = no
        <- web3t.refresh
    style = get-primary-info store
    button-style=
        border: "0"
        color: style.app.text
        background: style.app.input
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
    button-primary4-style=
        color: style.app.text
        border-radius: "50px"
        border: "0"
        background: style.app.bg-btn
        line-height: "25px"
        padding: "10px"
        width: "40px"
        height: "40px"
        margin: "20px 5px 0"
    button-primary2-style=
        border: "0"
        color: style.app.text
        background: style.app.primary2
    button-primary0-style=
        border: "0"
        color: style.app.text
        background: "transparent"
    button-primary3-style=
        border: "0px"
        color: style.app.text2
        background: style.app.primary3
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.account-bg
    border-top=
        border-top: "1px solid #{style.app.border}"
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
    icon-style =
        color: style.app.loader
        border-radius: "50px"
        border: "0"
        background: style.app.bg-btn
        padding: "0px"
        width: "40px"
        height: "40px"
        margin: "20px 5px 0"
    lang = get-lang store
    account-index = "#{lang.account-index ? 'Account index'}: #{current.account-index}"
    length = +(localStorage.get-item('Accounts') ? 3)
    exclude-current = ->
        it isnt store.current.account-index
    syncing = 
        | store.current.refreshing => \syncing
        | _ => ""
    show-class =
        if store.menu.show then \show else \ ""
    show = ->
        store.menu.show = not store.menu.show
    create-account-position = (index)->
        #ref = react.create-ref!
        change-account = ->
            store.current.account-index = index
            store.current.switch-account = no
            <- web3t.refresh
        default-account-name = -> "#{lang.account} #{index}"
        current-account-name = ->
            local-storage.get-item(default-account-name!) ? default-account-name!
        account-name = current-account-name!
        position-style =
            color: if store.current.account-index is index then '#3cd5af' else ''
        .pug.table-row-menu(on-click=change-account key="account#{index}" style=position-style)
            .col.folder-menu.pug
                .pug #{account-name}
    .pug.your-account
        if store.preference.username-visible is yes
            .pug.username 
                .pug.nick #{current.account.account-name}
                .pug.index #{account-index}
        .pug.buttons
            if no
                .pug.button.edit(on-click=topup(store) style=button-primary1-style) #{lang.topup}
            if store.current.device is \mobile
                if store.preference.refresh-visible is yes
                    button.pug.button.lock.mt-5(on-click=refresh style=icon-style class="#{syncing}")
                        icon \Sync, 20
            if store.current.device is \mobile
                button.pug.button.lock.mt-5(on-click=add-coin(store) style=button-primary4-style)
                    img.icon-svg-plus.pug(src="#{icons.create}")
            if store.current.device is \mobile
                tor store, web3t
            if store.current.device is \mobile
                button.pug.button.lock.mt-5(on-click=show style=button-primary4-style class="#{show-class}")
                    img.icon-svg-plus.pug(src="#{icons.menu}")
            if no
                if store.current.device is \mobile
                    button.pug.button.lock.mt-5(on-click=open-migration style=button-primary1-style) Migration
            if no
                if store.current.device is \desktop
                    button.pug.button.lock(on-click=open-migration style=button-primary0-style)
                        icon "Zap", 20
        if store.current.switch-account
            .pug.switch-menu(style=filter-body)
                .pug.middle.account
                    [1 to length] |> map create-account-position
                .pug.middle(style=border-top)
                    .pug.table-row-menu
                        .col.buttons.folder-menu.pug(on-click=create-account)
                            button.pug(style=button-primary2-style)
                                span.pug
                                    img.icon-svg.pug(src="#{icons.create-acc}")
                                    | #{lang.create-account}