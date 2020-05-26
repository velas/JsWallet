require! {
    \react
    \../get-lang.ls
    \../get-primary-info.ls
    \../icons.ls
    \../navigate.ls
}
.tor
    @import scheme
    height: auto
    box-sizing: border-box
    position: relative
    right: 3px
    bottom: 35px
    text-align: right
    .icon
        cursor: pointer
        background: rgba(240, 248, 255, 0.18)
        width: 30px
        height: 30px
        display: block
        float: right
        border-radius: 50px
        text-align: center
        .icon-svg-create
            height: 15px
        &.active
            background: transparent
            transition: all .5s
    .tor-content
        position: absolute
        text-align: left
        right: 0
        top: 44px
        width: 200px
        padding: 10px
        display: inline-block
        z-index: 3
        box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
        .active-tor
            position: relative
            display: block
            float: right
            width: 48px
            height: 20px
            margin-top: 7px
            margin-right: 10px
            input
                display: none
                &:checked + .track
                    background-color: #895ed8
                    &:before
                        -webkit-transform: translateX(28px)
                        transform: translateX(28px)
            .track
                cursor: pointer
                position: absolute
                top: 0
                left: 0
                right: 0
                bottom: 0
                background-color: #463f50
                -webkit-transition: 0.25s
                transition: 0.25s
                &:before
                    content: ""
                    position: absolute
                    box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.2), 0 1px 1px 0 rgba(0, 0, 0, 0.14), 0 1px 3px 0 rgba(0, 0, 0, 0.12)
                    background-color: #fafafa
                    -webkit-transition: 0.25s
                    transition: 0.25s
            .thumb
                border-radius: 35px
                &:before
                    top: 0px
                    width: 20px
                    height: 20px
                    border-radius: 50%
        .header
            padding: 10px
            div
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
        .col
            padding: 10px
            display: grid
            span
                font-size: 10px
                text-transform: uppercase
                opacity: .8
            div
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
module.exports = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    border-bottom=
        border-bottom: "1px solid #{style.app.border}"
    open-tor = ->
        store.current.tor = not store.current.tor
    active =
        if store.current.tor then \active else \ ""
    .tor.pug
        span.pug.icon(on-click=open-tor class="#{active}")
            img.icon-svg-create.pug(src="#{icons.tor}")
        if store.current.tor
            .pug.tor-content(style=filter-body)
                label.active-tor.pug
                    input.pug(type='checkbox')
                    .track.thumb.pug
                .header.pug(style=border-bottom)
                    .pug.header Private mode
                .col.pug
                    .pug 213.110.144.59
                    span.pug IP
                .col.pug
                    .pug N/A
                    span.pug Country