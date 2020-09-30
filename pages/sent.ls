require! {
    \react
    \../navigate.ls
    \./history.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \../icons.ls
    \prelude-ls : { filter }
    \./confirmation.ls : { confirm }
    \../components/button.ls
    \moment
}
.sent
    $mobile: 500px
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
        .network, .created, .status
            @media(max-width: $mobile)
                display: none !important
        .details-to, .details-from, .from-to
            @media(max-width: $mobile)
                width: 55% !important
        .amount
            @media(max-width: $mobile)
                width: 30% !important
        .details, .divider.more
            @media(max-width: $mobile)
                width: 15% !important
        .tx-middle
            padding: 0 10px
            .txhash
                @media(max-width: $mobile)
                    width: 75% !important
        .tx-middle .divider
            @media(max-width: $mobile)
                display: none !important
        .tx-middle .divider2
            @media(max-width: $mobile)
                width: 25% !important
    .history
        margin: 0
        padding: 0 15px
        box-sizing: border-box
    @import scheme
    text-align: center
    color: inherit
    padding-top: 100px
    width: 100%
    max-width: 600px
    min-width: 320px
    display: inline-block
    margin-left: 250px
    @media(max-width: $ipad)
        position: relative
        margin-left: 0px
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
    button
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
        width: 90px
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
    .icon-svg
        height: 12px
        padding: 0px 5px 0 0px
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
    btn-icon =
        filter: style.app.btn-icon
    has-pending =
        store.transactions.applied 
            |> filter (.pending) 
            |> (.length > 0)
    now = moment!.unix!
    no-recent =
        store.transactions.applied
            |> filter (.time - now < 10000)
            |> (.length is 0)
    console.log \time-difference , store.transactions.applied.0?time , moment!.unix!
    inacurate = (cb)->
        return cb null if has-pending is no
        agree <- confirm store, lang.pendingTransactions
        #console.log 'after confirm', agree
        return cb "disagree" if not agree
        cb null
    go-home = ->
        err <- inacurate
        return err if err?
        navigate store, web3t, \wallets
    lang = get-lang store
    .pug.sent
        .pug.animation
            if no-recent
                img.icon-sent.pug(style=sent-icon src="#{icons.sent-check}")
            else if has-pending
                img.icon-sent.pug(style=sent-icon src="#{icons.sent-plane}")
            else
                img.icon-sent.pug(src="#{icons.sent-check}")
        .pug.text(style=text-style)
            a.pug(style=link-style href="#{store.current.last-tx-url}" target="_blank") #{lang.transaction}
            if no-recent
                span.pug  #{lang.has-been-sent}
            else if has-pending
                span.pug  #{lang.inProgress}..
            else
                span.pug  #{lang.has-been-sent}
        button { store, on-click : go-home , type : \secondary , text: \home }
        .limited-history.pug
            history { store, web3t }