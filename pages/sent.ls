require! {
    \react
    \../navigate.ls
    \./history.ls
    \../get-primary-info.ls
    \../get-lang.ls
}
.sent
    .animation
        height: 75px
    .limited-history
        margin-top: 20px
        overflow: scroll
        .table
            height: calc(50vh - 60px)
            margin-top: -1px
        .nothin-to-show
            top: 10%
        button.back
            display: none
    .history
        margin: 0
    @import scheme
    text-align: center
    color: #5bb03e
    padding-top: 100px
    width: 100%
    max-width: 540px
    min-width: 320px
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
        cursor: pointer
        padding: 0 6px
        box-sizing: border-box
        border-radius: $border
        font-size: 10px
        width: 80px
        height: 36px
        color: #6CA7ED
        text-transform: uppercase
        font-weight: bold
        transition: all .5s
    .icon-sent
        height: 50px
        border-radius: 0
        margin-bottom: 20px
        animation: passing_1361 2s cubic-bezier(0, 0, 0.79, 0.04) 1
        transform-origin: 50% 50%
    @-webkit-keyframes passing_1361
        0%
            transform: translateY(0%)
            opacity: 0
        50%
            transform: translateY(-30%)
            opacity: 1
        100%
            transform: translateY(0%)
            opacity: 1
    @keyframes passing_1361
        0%
            transform: translateY(0%)
            opacity: 0
        50%
            transform: translateY(-30%)
            opacity: 1
        100%
            transform: translateY(0%)
            opacity: 1
    .show
        -webkit-animation: seconds1 1.0s forwards
        -webkit-animation-iteration-count: 1
        -webkit-animation-delay: 2s
        animation: seconds1 1.0s forwards
        animation-iteration-count: 1
        animation-delay: 2s
        position: relative
        opacity: 0
    @-webkit-keyframes seconds1
        0%
            opacity: 0
        100%
            opacity: 1
            position: relative
    @keyframes seconds1
        0%
            opacity: 0
        100%
            opacity: 1
            position: relative
    .hide
        -webkit-animation: seconds 1.0s forwards
        -webkit-animation-iteration-count: 1
        -webkit-animation-delay: 2s
        animation: seconds 1.0s forwards
        animation-iteration-count: 1
        animation-delay: 2s
        position: relative
        top: -75px
    @-webkit-keyframes seconds
        0%
            opacity: 1
        100%
            opacity: 0
            left: -9999px
            position: relative
    @keyframes seconds
        0%
            opacity: 1
        100%
            opacity: 0
            left: -9999px
            position: relative
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
        .pug.animation
            .pug.show
                img.icon-sent.pug(src='data:image/png;base64,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')
            .pug.hide
                img.icon-sent.pug(style=sent-icon src='data:image/png;base64,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')
        .pug.text(style=text-style)
            span.pug #{lang.your} 
            a.pug(style=link-style href="#{store.current.last-tx-url}" target="_blank") #{lang.transaction ? 'transaction'}
            span.pug  #{lang.has-been-sent ? 'has been sent'}
        a.button.pug(on-click=go-home style=button-primary3-style) #{lang.home ? 'Home'}
        .limited-history.pug
            history { store, web3t }