require! {
    \react
    \../address-link.ls : { get-address-link, get-address-title }
    \react-middle-ellipsis : { default: MiddleEllipsis }
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
        left: 0
        margin: 0
        z-index: 2
    >span
        width: 100%
        z-index: 1
        position: relative
        border-radius: $border
        border: 0
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
            padding-left: 33px
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
    address-input=
        color: style.app.color3
    address-input-bg=
        color: style.app.color3
        background: style.app.bg-primary-light
    input=
        | type is \bg => address-input-bg
        | _ => address-input
    filter-icon=
        filter: style.app.filterIcon
    address-link = 
        | store.current.refreshing is no => get-address-link wallet
        | _ => "..."
    address-title = 
        | store.current.refreshing is no => get-address-title wallet
        | _ => "..."
    show-details = ->
        store.current.hovered-address.address = wallet.address
    hide-details = ->
        store.current.hovered-address.address = null
    create-ref = ->
        #module.exports.element = it
        #store.current.hovered-address.element = it
        #create-ref.element = it
    active = if wallet.address is store.current.hovered-address.address then 'active' else ''
    .address-holder.pug(on-mouse-enter=show-details on-mouse-leave=hide-details ref=create-ref)
        identicon { store, address: address-title }
        span.pug(style=input)
            a.browse.pug(target="_blank" href="#{address-link}")
                img.pug(src="#{icons.browse-open}" style=filter-icon)
            MiddleEllipsis.pug
                a.pug(target="_blank" href="#{address-link}" class="#{active}") #{address-title}
        copy { store, text: address-title }