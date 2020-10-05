require! {
    \react
    \../icons.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../pages/switch-account.ls
    \../navigate.ls
    \../pages/add-wallet.ls
}
.header
    @import scheme
    height: 60px
    margin-left: $menu
    display: flex
    @media(max-width: $ipad)
        margin-left: 0
    >.left-side, >.right-side
        position: relative
    >.left-side
        width: 25%
        min-width: 200px
        .search-area
            width: 80%
            input
                float: left
                border-radius: $border
                margin-top: 11px
                margin-left: 12px
                height: 36px
                padding-left: 30px
                padding-right: 30px
                width: calc(100% - 80px)
                transition: all .5s
                text-align: center
                @media(max-width: $ipad)
                    width: calc(100% - 110px)
                    margin-left: 0px
                ~img
                    width: 14px
                    position: absolute
                    left: 22px
                    top: 24px
                    @media(max-width: $ipad)
                        left: 55px
        >.button
            right: 0
            top: 0
            float: right
            position: absolute
            .icon-svg-plus
                position: relative
                height: 16px
                top: 2px
                padding: 0
                cursor: pointer
                vertical-align: top
        >.menu
            border-radius: 50px
            border: 0
            line-height: 25px
            padding: 10px
            width: 45px
            height: 40px
            margin: 10px 0 0
            position: relative
            float: left
            display: none
            @media(max-width: $ipad)
                display: block
            .icon-svg-plus
                position: relative
                height: 15px
                width: 15px
                top: 2px
                padding: 0
                cursor: pointer
                vertical-align: top
    >.right-side
        width: 75%
        .choose-account
            top: 20px
            margin-right: 60px
        .menu-item
            position: relative
            display: inline-block
            width: 60px
            height: 60px
            float: right
            cursor: pointer
            img
                margin-top: 20px
    ::placeholder
        color: var(--color3)
    ::-ms-input-placeholder
        color: var(--color3)
module.exports = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    right-side=
        border-left: "1px solid #{style.app.border}"
    header=
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.left-side
    lock-icon =
        width: "14px"
        filter: style.app.icon-filter
    icon-style =
        color: style.app.text
        border-left: "1px solid #{style.app.border}"
    input-style=
        background: style.app.input-light
        border: "0"
        color: style.app.text
    icon-color=
        filter: style.app.icon-filter
    button-add=
        color: style.app.text
        background: style.app.bg-btn
        filter: style.app.icon1
    lock = ->
        navigate store, web3t, \locked
    show-class =
        if store.menu.show then \show else \ ""
    show = ->
        store.menu.show = not store.menu.show
    search-on-change = (event) ->
        store.current.search = event.target.value
    .pug.header(style=header)
        .left-side.pug
            button.pug.button.menu(style=button-add on-click=show class="#{show-class}")
                img.icon-svg-plus.pug(src="#{icons.menu}")
            .search-area.pug
                input.pug(type='text' style=input-style placeholder="Search" value=store.current.search on-change=search-on-change)
                img.pug(src="#{icons.search}" style=icon-color)
            add-wallet { store, web3t }
        .right-side.pug(style=right-side)
            switch-account store, web3t
            if store.preference.lock-visible is yes
                .menu-item.bottom.pug(on-click=lock style=icon-style)
                    img.pug(src="#{icons.lock}" style=lock-icon)