require! {
    \react
    \./project-links.ls
    \../menu-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \../icons.ls
}
.banner
    width: 100%
    text-align: center
    color: white
    padding: 25px 40px
    box-sizing: border-box
    position: relative
    overflow: hidden
    @media (max-width: 400px)
        padding: 10px
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50% 100%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
    img
        position: absolute
        top: 10%
        width: 50%
        @media (max-width: 400px)
            display: none
        @media (min-width: 401px) and (max-width: 500px)
            top: 20%
            width: 40%
        @media (min-width: 501px) and (max-width: 650px)
            top: 10%
            width: 45%
        @media (min-width: 651px) and (max-width: 850px)
            top: 0%
            width: 45%
        @media (min-width: 851px)
            top: -10%
            width: 45%
        &.left
            left: -70px
        &.right
            right: -70px
    &.close
        display: none !important
    .btn
        cursor: pointer
        text-align: right
        position: absolute
        right: 15px
        top: 10px
        z-index: 11
        background: rgba(255, 255, 255, 0.15)
        padding: 10px
        border-radius: 50px
        height: 15px
        width: 15px
        text-align: center
        svg
            vertical-align: top !important
    .row
        display: flex
        .banner-content
            width: 100%
            position: relative
        .h1
            font-size: 40px
            line-height: 40px
            text-transform: uppercase
            @media (max-width: 400px)
                font-size: 30px
        .p
            font-size: 14px
            a
                color: #6f6fe2
                text-decoration: underline
                cursor: pointer
        .h2
            font-size: 25px
            margin: 10px 0
            text-transform: uppercase
            color: orange
banner = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    .pug.row
        .pug.banner-content
            .pug.h1.iron Migrate
            .pug.h2 to this wallet
            .pug.p 
                | from your 
                a.pug(href="https://oldwallet.velas.com/auth/signin" target="_blank") old wallet
module.exports = (store, web3)->
    return null if store.current.page isnt \locked
    style = get-primary-info store
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lang = get-lang store
    info = get-primary-info store
    border-style =
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.header
    logo-style =
        filter: style.app.filterLogo
    langs-menu-body =
        border: "1px solid #{style.app.border}"
        background: style.app.header
    text-style=
        color: style.app.text
    close-banner = ->
        store.current.banner = not store.current.banner
    close-class =
        if store.current.banner then \close else \ ""
    .banner.pug(style=border-style class="#{close-class}")
        img.right.pug(src="#{icons.banner-right}")
        img.left.pug(src="#{icons.banner-left}")
        .pug.btn(on-click=close-banner)
            icon \X, 15
        banner store, web3t