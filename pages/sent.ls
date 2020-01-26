require! {
    \react
    \../navigate.ls
    \./history.ls
    \../get-primary-info.ls
    \../get-lang.ls
}
.sent
    .limited-history
        margin-top: 20px
        overflow: scroll
        .table
            height: calc(50vh - 90px)
        .nothin-to-show
            top: 10%
    @import scheme
    text-align: center
    color: #5bb03e
    padding-top: 100px
    width: 100%
    max-width: 450px
    display: inline-block
    .icon
        text-align: center
        fill: white
        >svg
            margin: 20px 0
            display: inline-block
            width: 52px
            height: 52px
            zoom: 2
    .text
        font-weight: 600
    a.button
        display: inline-block
        margin-top: 20px
        line-height: 36px
        outline: none
        margin-bottom: 5px
        margin-left: 5px
        cursor: pointer
        padding: 0
        box-sizing: border-box
        border-radius: 6px
        font-size: 10px
        width: 60px
        height: 36px
        color: #6CA7ED
        text-transform: uppercase
        font-weight: bold
        transition: all .5s
    .icon-sent
        height: 50px
        border-radius: 0
        margin-bottom: 20px
        animation: passing_1361 3s cubic-bezier(0, 0, 0.79, 0.04) 1
        transform-origin: 50% 50%
    @keyframes passing_1361
        0%
            transform: translateY(0%)
            opacity: 0
        50%
            transform: translateY(-50%)
            opacity: 1
        100%
            transform: translateY(0%)
            opacity: 1
success-icon = (store)->
    style = get-primary-info store
    icon-style = 
        fill: style.app.icon
    svg.pug(version='1.1' xmlns='http://www.w3.org/2000/svg' x='0px' y='0px' viewbox='0 0 52 52' style=icon-style)
        g.pug
            path.pug(d='M26,0C11.664,0,0,11.663,0,26s11.664,26,26,26s26-11.663,26-26S40.336,0,26,0z M26,50C12.767,50,2,39.233,2,26S12.767,2,26,2s24,10.767,24,24S39.233,50,26,50z')
            path.pug(d='M38.252,15.336l-15.369,17.29l-9.259-7.407c-0.43-0.345-1.061-0.274-1.405,0.156c-0.345,0.432-0.275,1.061,0.156,1.406l10,8C22.559,34.928,22.78,35,23,35c0.276,0,0.551-0.114,0.748-0.336l16-18c0.367-0.412,0.33-1.045-0.083-1.411C39.251,14.885,38.62,14.922,38.252,15.336z')
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
        g.pug
module.exports = ({ store, web3t })->
    style = get-primary-info store
    text-style=
        color: style.app.text
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    link-style=
        color: style.app.text2
    sent-icon=
        filter: style.app.nothingIcon
    go-home = ->
        navigate store, web3t, \wallets
    lang = get-lang store
    .pug.sent
        img.icon-sent.pug(style=sent-icon src='data:image/png;base64,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')
        .pug.text(style=text-style)
            span.pug #{lang.your}
            a.pug(style=link-style href="#{store.current.last-tx-url}" target="_blank") #{lang.transaction ? 'transaction'}
            span.pug  #{lang.has-been-sent ? 'has been sent'}
        a.button.pug(on-click=go-home style=button-primary3-style) #{lang.home ? 'Home'}
        .limited-history.pug
            history { store, web3t }