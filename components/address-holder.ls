require! {
    \react
    \../address-link.ls : { get-address-link, get-address-title }
    \./middle-ellipsis : MiddleEllipsis
    \../get-primary-info.ls
    \../icons.ls
    \./identicon.ls
    \./copy.ls
}
.address-holder
    @import scheme
    $card-top-height: 50px
    width: 100%
    box-sizing: border-box
    color: #A8BACB
    font-size: 14px
    text-align: center
    position: relative
    overflow: visible
    z-index: 0
    .browse
        display: inline-block
        position: absolute
        top: 3px
        right: 40px
        width: auto
        img
            width: 16px
            top: 1px
            position: relative
            margin: 0
            display: inline-block
    img
        margin-right: 10px
    img
        position: absolute
        right: 1%
        margin: 10px
        margin-left: 50px
        z-index: 2
    >img.identicon
        position: absolute
        right: auto
        left: 4px
        top: 3px
        height: 30px
        border-radius: 5px
        margin: 0px
        z-index: 2
    >span
        width: 100%
        z-index: 1
        position: relative
        border-radius: $border
        box-sizing: border-box
        vertical-align: top
        text-align: center
        padding-left: 20px
        padding-right: 55px
        height: $card-top-height - 14px
        color: #677897
        font-size: 14px
        line-height: $card-top-height - 14px
        display: inline-block
        text-overflow: ellipsis
        overflow: hidden
        user-select: text !important
        cursor: auto
        @media screen and (max-width: 390px)
            padding-right: 25px
        a
            width: auto
            z-index: 1
            position: relative
            border-radius: $border
            border: 0
            padding-left: 0px
            background: transparent
            box-sizing: border-box
            vertical-align: top
            text-align: center
            height: $card-top-height - 14px
            color: var(--color3)
            font-size: 14px
            line-height: $card-top-height - 14px
            display: inline-block
            cursor: pointer
            user-select: text !important
            &.active
                color: orange
module.exports = ({ store, wallet, type })->
    style = get-primary-info store
    address-suffix = store.current.address-suffix
    address-input=
        color: style.app.color3
    address-input-bg=
        color: style.app.color3
        background: style.app.input
    input=
        | type is \bg => address-input-bg
        | _ => address-input
    filter-icon=
        filter: style.app.filterIcon
    icon1=
        filter: style.app.icon1
    address-link =
        | store.current.refreshing is no => get-address-link wallet, address-suffix
        | _ => "..."
    address-title =
        | store.current.refreshing is no => get-address-title wallet, address-suffix
        | _ => "..."
    show-details = ->
        store.current.hovered-address.address = wallet.address
    hide-details = ->
        store.current.hovered-address.address = null
    active = if wallet.address is store.current.hovered-address.address then 'active' else ''
    rotate-address-suffix = ->
        store.current.address-suffix =
            | store.current.address-suffix is '' and wallet.address2  => "2"
            | store.current.address-suffix is '2' and wallet.address3 => '3'
            | _ => ""
    .address-holder.pug(on-mouse-enter=show-details on-mouse-leave=hide-details)
        identicon { store, address: address-title }
        span.pug(style=input)
            if store.url-params.internal?
                a.browse.pug(on-click=rotate-address-suffix)
                    img.pug(src="#{icons.choose}" style=filter-icon)
            else
                a.browse.pug(target="_blank" href="#{address-link}")
                    img.pug(src="#{icons.browse-open}" style=icon1)
            MiddleEllipsis.pug(key=address-title)
                a.pug(target="_blank" href="#{address-link}" class="#{active}") #{address-title}
        copy { store, text: address-title }