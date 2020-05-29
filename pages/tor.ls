require! {
    \react
    \../get-lang.ls
    \../get-primary-info.ls
    \../icons.ls
    \../navigate.ls
    \../../web3t/providers/superagent.ls : { get }
    \../../web3t/providers/superagent-adapter.js : network
}
.tor
    @import scheme
    height: auto
    box-sizing: border-box
    position: relative
    right: 3px
    text-align: right
    bottom: -13px
    background: transparent
    border: 0
    color: #fff
    .icon
        cursor: pointer
        background: rgba(157, 127, 206, 0.3)
        width: 40px
        height: 40px
        line-height: 45px
        display: block
        float: right
        border-radius: 50px
        text-align: center
        .icon-svg-create
            height: 15px
        &.active
            transition: all .5s
    .tor-content
        position: absolute
        text-align: left
        right: -25px
        top: 55px
        width: 200px
        padding: 10px
        display: inline-block
        z-index: 3
        box-shadow: 0px 13px 20px 0px rgba(0, 0, 0, 0.15)
        &:after, &:before
            right: 20%
            top: -9%
            border: solid transparent
            content: " "
            height: 0
            width: 0
            position: absolute
            pointer-events: none
        &:after
            border-color: rgba(136, 183, 213, 0)
            border-bottom-color: #331462
            border-width: 6px
            margin-top: 4px
            margin-right: 1px
        &:before
            border-color: rgba(194, 225, 245, 0)
            border-bottom-color: #6b268e
            border-width: 7px
            margin-top: 1px
        .active-tor
            position: relative
            display: block
            float: right
            width: 48px
            height: 20px
            margin-top: 7px
            margin-right: 0px
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
        .header-tor
            padding: 10px 0
            div
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
                -webkit-mask-size: 50%
                animation: shine 2s infinite
                width: max-content
        .col
            padding: 10px 0
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
                line-height: 22px
                text-transform: uppercase
                letter-spacing: 2px
init = ({ store, web3t}, cb)->
    err, data <- get "https://api.ipify.org?format=json" .end
    #err, data <- network[network.type].get "https://api.ipify.org?format=json" .end
    return cb err if err?
    store.tor.proxy = data.body
    err, data <- network.all.get "https://api.ipify.org?format=json" .end
    return cb err if err?
    store.tor.real = data.body
    cb null
module.exports = (store, web3t)->
    return null if not store.url-params.tor?
    style = get-primary-info store
    lang = get-lang store
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
        background-position: "160px 70px"
        background-size: "50px"
        background-repeat: "no-repeat"
        background-image: "url(#{icons.tor2})"
    border-bottom=
        border-bottom: "1px solid #{style.app.border}"
    button-add=
        color: style.app.text
        background: style.app.bg-btn
    open-tor = ->
        store.current.tor = not store.current.tor
        return if store.current.tor isnt yes
        <- init { store, web3t }
    active =
        if store.current.tor then \active else \ ""
    change = ->
        store.tor.enabled = not store.tor.enabled
        console.log \store.tor.enabled, store.tor.enabled
        network.type = 
            | store.tor.enabled => \tor
            | _ => \all
        <- init { store, web3t }
    button.tor.pug
        span.pug.icon(on-click=open-tor class="#{active}" style=button-add)
            img.icon-svg-create.pug(src="#{icons.tor}")
        if store.current.tor
            .pug.tor-content(style=filter-body)
                label.active-tor.pug
                    input.pug(type='checkbox' default-checked=store.tor.enabled on-change=change)
                    .track.thumb.pug
                .header-tor.pug(style=border-bottom)
                    .pug Private mode
                .col.pug
                    .pug #{store.tor.proxy.ip}
                    span.pug
                        span.pug real IP
                .col.pug
                    .pug #{store.tor.real.ip}
                    span.pug
                        span.pug current IP