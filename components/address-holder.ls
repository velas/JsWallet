require! {
    \react
    \../address-link.ls : { get-address-link, get-address-title }
    \react-middle-ellipsis : { default: MiddleEllipsis }
    \../get-primary-info.ls
    \../icons.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
}
.address-holder
    @import scheme
    $card-top-height: 50px
    width: 100%
    padding: 0 12px
    box-sizing: border-box
    color: #A8BACB
    font-size: 14px
    margin-top: 10px
    text-align: center
    position: relative
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
    >img
        position: absolute
        right: 3%
        margin: 10px
        margin-left: 50px
        z-index: 2
    >span
        width: 100%
        z-index: 1
        position: relative
        border-radius: $border
        border: 0
        background: #E6F0FF
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
            background: transparent
            box-sizing: border-box
            vertical-align: top
            text-align: center
            height: $card-top-height - 14px
            color: rgb(204, 204, 204)
            font-size: 14px
            line-height: $card-top-height - 14px
            display: inline-block
            cursor: pointer
            user-select: text !important
module.exports = ({ store, wallet })->
    style = get-primary-info store
    address-input=
        color: style.app.addressText
        background: style.app.addressBg 
    filter-icon=
        filter: style.app.filterIcon
    .address-holder.pug
        span.pug(style=address-input)
            a.browse.pug(target="_blank" href="#{get-address-link wallet}")
                img.pug(src="#{icons.browse-open}")
            MiddleEllipsis.pug
                a.pug(target="_blank" href="#{get-address-link wallet}") #{get-address-title wallet}
        CopyToClipboard.pug(text="#{get-address-title wallet}" on-copy=copied-inform(store) style=filter-icon)
            copy store