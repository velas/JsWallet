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
    margin-left: 60px
    display: flex
    >.left-side, >.right-side
        position: relative
    >.left-side
        width: 35%
        .search-area
            width: 80%
            input
                float: left
                border-radius: $border
                margin-top: 11px
                margin-left: 12px
                height: 36px
                padding-left: 15px
                width: 100%
        >.button
            right: 0
            top: 0
            position: absolute
            .icon-svg-plus
                position: relative
                height: 16px
                top: 2px
                padding: 0
                cursor: pointer
                vertical-align: top
    >.right-side
        width: 65%
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
        background: style.app.stats-style
        border: "0"
        color: style.app.text
    lock = ->
        navigate store, web3t, \locked
    .pug.header(style=header)
        .left-side.pug
            .search-area.pug
                input.pug(type='text' style=input-style value="" placeholder="Search")
            add-wallet { store, web3t }
        .right-side.pug(style=right-side)
            switch-account store, web3t
            if store.preference.lock-visible is yes
                .menu-item.bottom.pug(on-click=lock style=icon-style)
                    img.pug(src="#{icons.lock}" style=lock-icon)