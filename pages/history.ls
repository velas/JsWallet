require! {
    \react
    \prelude-ls : { sort-by, reverse, filter, map, find, take }
    \../history-funcs.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./loading.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../icons.ls
    \../components/middle-ellipsis : MiddleEllipsis
    \../components/address-holder.ls
    \../round-number.ls
}
.history
    @import scheme
    width: 100%
    position: relative
    padding-bottom: 0px
    display: inline-block
    .from-to
        width: 40px
        display: inline-block
        line-height: 25px
    .tooltip
        position: absolute
        text-transform: uppercase
        left: 25px
        top: -8px
        z-index: 1
        line-height: 14px
        font-size: 9px
        font-weight: 600
        color: #fff
        padding: 5px
        background: #000
        visibility: hidden
        &:after, &:before
            right: 100%
            top: 21%
            border: solid transparent
            content: " "
            height: 0
            width: 0
            position: absolute
            pointer-events: none
        &:after
            border-color: rgba(136, 183, 213, 0)
            border-right-color: #000
            border-width: 6px
            margin-top: 2px
        &:before
            border-color: rgba(194, 225, 245, 0)
            border-width: 8px
            margin-top: 0px
    .icon-svg1
        position: relative
        border-radius: 0px
        height: 15px
        top: 2px
        &.more
            height: 8px
            top: 0
    .icon-svg-arrow
        position: relative
        height: 12px
        top: 0px
    .smart-contract
        color: orange
        position: relative
        .help
            cursor: help
        &:hover
            .tooltip
                visibility: visible
    &.normalheader
        @media(max-width: 800px)
            margin: 60px 0 0
    .sign
        margin-right: 3px
        margin-left: 5px
        font-size: 15px !important
        font-weight: 600
    .nothin-to-show
        color: rgba(white, 0.5)
        padding-top: 50px
        text-align: center
        top: 30%
        width: 100%
        position: absolute
        img
            height: 50px
            border-radius: 0
            margin-bottom: 15px
        .head
            font-weight: 600
            margin-bottom: 10px
            font-size: 14px
            opacity: .7
        .content
            font-size: 14px
            opacity: .7
    .header-table
        .cell
            font-size: 12px
            padding: 10px 15px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
            color: rgb(204, 204, 204)
            overflow-y: hidden
            &.network
                width: 10%
                text-align: center
            &.txhash
                width: 55%
                text-align: left
            &.amount
                width: 35%
                text-align: left
    .header, .header-table
        text-align: left
        height: 100px
        box-sizing: border-box
        left: 0
        top: 0
        width: 100%
        .table-header
            width: 100%
            display: inline-flex
            margin-top: 10px
            span
                font-size: 12px
                opacity: .5
                padding: 10px 0
                line-height: 1.8
                &.from-to
                    width: 50%
                &.created
                    width: 12%
                &.amount
                    width: 16%
                &.status
                    width: 16%
                &.details
                    width: 6%
                    text-align: center
        .head
            display: inline-block
            &.left
                padding: 0px 0 10px 0px
                margin-top: 21px
            &.right
                float: right
                padding: 0px 10px 0px 0
                margin-top: 17px
                cursor: pointer
            &.h1
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                opacity: .8
        .filter
            width: 226px
            background: inherit
            position: absolute
            top: 59px
            right: 0
            display: inline-grid
            z-index: 1
            border-radius: $border
            .bottom, .middle
                padding: 10px
            .top
                padding: 0
                display: flex
                button
                    width: 50% !important
                    border: 0 !important
                    margin: 0 !important
                    height: 39px
                    text-transform: uppercase
                    &.active
                        filter: brightness(1.3)
            .middle
                div
                    line-height: 7px
                    &:first-child
                        margin-bottom: 10px
                label
                    font-size: 10px
                    text-transform: uppercase
                input
                    outline: none
                    width: 100%
                    box-sizing: border-box
                    height: 36px
                    line-height: 36px
                    border-radius: $border
                    padding: 0px 10px
                    font-size: 14px
                    border: 0px
                    box-shadow: none
                button
                    outline: none
                    cursor: pointer
                    border: 0
                    padding: 0
                    box-sizing: border-box
                    border-radius: $border
                    font-size: 10px
                    padding: 0 6px
                    height: 36px
                    color: #6CA7ED
                    text-transform: uppercase
                    font-weight: bold
                    background: transparent
                    transition: all .5s
                    text-overflow: ellipsis
                    overflow: hidden
                    width: 100%
                    margin: 0 auto
                    opacity: 1
                    margin-top: 10px
            button
                border-radius: 50px
                margin: 2px
                border: 2px solid hsla(0, 0%, 79%, 0.15)
                opacity: .25
                border-width: 3px
                &.active
                    opacity: 1
                img
                    height: 25px
                    &.icon-svg
                        height: 12px
                        padding: 0 0 3px 0
                        margin: 0
                    &.icon-svg-btn
                        height: 12px
                        padding: 0px 5px 0 0px
                &.OUT
                    border-radius: $border 0 0 0
                    img
                        filter: invert(105%)
                    background: var(--primary2)
                &.IN
                    border-radius: 0 $border 0 0
                    img
                        filter: invert(105%)
                    background: var(--primary1)
        .separator
            min-width: 2px
            display: inline-block
        button
            outline: none
            cursor: pointer
            border: 0
            background: transparent
            display: inline-block
            vertical-align: top
            margin-left: -1px
            padding: 0
            &.active
                border-color: var(--primary2)
                background: rgba(59, 213, 175, 0.25)
                border-width: 3px
            line-height: 12px
            height: 45px
            width: 45px
            font-size: 10px
            text-align: center
            &.back
                height: 60px
                width: 60px
            >*
                vertical-align: middle
                display: inline-block
            &.fl
                float: right
    .bold
        color: #b2951bad
        font-style: italic
        &.delete
            cursor: pointer
            font-style: normal
            font-size: 10px
            margin-left: 7px
            color: #ffffff
            background: #e6307a
            border-radius: $border
            width: auto
            letter-spacing: .5px
            padding: 0px 3px 1px 0px
        .icon-check
            width: 12px
            height: 12px !important
            vertical-align: middle
        &.confirmed
            font-style: normal
            font-size: 14px
            margin-left: 3px
            color: gray
            border-radius: $border
            width: auto
            letter-spacing: .5px
            padding: 0px 3px 1px 0px
            &.done
                background-image: var(--confirm)
                -webkit-text-fill-color: transparent
                -webkit-background-clip: text
    .syncing
        svg
            color: orange
            height: 12px
            width: 15px
            margin-left: 4px
            @keyframes spin
                from
                    transform: rotate(0deg)
                to
                    transform: rotate(360deg)
            animation-name: spin
            animation-duration: 4000ms
            animation-iteration-count: infinite
            animation-timing-function: linear
    .fee
        display: inline-block
        margin-right: 5px
    .balance
        display: inline-block
        >*
            display: inline-block
        .color
            font-weight: 600
        .rest
            color: inherit
            opacity: .5
    .table
        width: 100%
        overflow-y: scroll
        margin-top: -1px
        height: calc(100vh - 420px)
        opacity: .8
        .head, .record
            &.record
                border-radius: 0px
                .tx-top
                    cursor: default
                    height: 59px
                    position: relative
                .tx-middle
                    height: 60px
                &:last-child
                    margin-bottom: 0px
            .cell
                padding: 10px 0
                display: inline-block
                vertical-align: top
                box-sizing: border-box
                text-align: left
                height: 59px
                white-space: nowrap
                overflow: hidden
                .action
                    margin-top: 7px
                    display: block
                &:first-child
                    padding-right: 10px
                @media screen and (max-width: 800px)
                    overflow-x: scroll
                    overflow-y: hidden
                &.network
                    width: 5%
                    div
                        text-align: center
                &.txhash
                    width: 54%
                    div:first-child
                        display: inline
                    .loader-ios
                        margin-left: 10px
                    a
                        font-size: 14px
                    img
                        border-radius: inherit
                        border: none
                        margin-right: 0px
                        margin-left: 5px
                        height: 13px
                        top: 3px
                        left: 3px
                        position: relative
                &.amount
                    width: 16%
                    text-align: left
                    line-height: 40px
                    @media screen and (max-width: 1020px)
                        width: 16%
                &.status
                    width: 16%
                    text-align: left
                    line-height: 40px
                    @media screen and (max-width: 1020px)
                        width: 16%
                &.divider2
                    width: 38%
                &.divider
                    width: 4%
                    .direction
                        text-align: center
                        line-height: 40px
                &.arrow
                    width: 5%
                    text-align: center
                    line-height: 40px
                    opacity: .5
                    padding-left: 0
                &.created
                    width: 12%
                    text-align: left
                    @media screen and (max-width: 1020px)
                        width: 12%
                    .syncing
                        svg
                            width: auto
                            height: 14px
                            margin: 0
                            vertical-align: middle !important
                    .bold
                        margin-right: 0px
                        .icon-check
                            opacity: .8;
                            vertical-align: inherit
                            top: 1px
                            margin-right: 2px
                            position: relative
                            width: 15px
                            height: 13px !important
                    .time-ago
                        display: inline-block
                        text-overflow: ellipsis
                        overflow: hidden
                        width: 100%
                        font-size: 13px
                        line-height: 22px
                        text-decoration: none
                        line-height: 1.1
                        margin-top: 7px
                        white-space: break-spaces
                        vertical-align: -webkit-baseline-middle
                &.more
                    text-align: center
                    width: 6%
                    line-height: 40px
                    cursor: pointer
                    &:hover
                        .arrow_box
                            display: block
                    .arrow_box
                        position: absolute
                        text-transform: uppercase
                        right: 6%
                        top: 17px
                        z-index: 1
                        line-height: 14px
                        font-size: 9px
                        font-weight: 600
                        color: #fff
                        padding: 5px
                        background: #210b4a
                        display: none
                        transition: opacity .5s
                        &:after, &:before
                            left: 100%
                            top: 15%
                            border: solid transparent
                            content: " "
                            height: 0
                            width: 0
                            position: absolute
                            pointer-events: none
                        &:after
                            border-color: rgba(136, 183, 213, 0)
                            border-left-color: #000
                            border-width: 6px
                            margin-top: 2px
                        &:before
                            border-color: rgba(194, 225, 245, 0)
                            border-width: 8px
                            margin-top: 0px
                &.details-from, &.details-to
                    width: 45%
                    text-align: left
                    height: 60px
                    div:last-child
                        height: 36px
                    .action
                        .address-holder
                            text-align: left
                            height: 22px
                            width: 85%
                            .copy
                                margin-left: 0px
                                width: 13px
                                height: 15px
                            >img
                                margin: 5px
                                &:first-child
                                    top: 0px
                                    margin: 0 10px 0 0
                                    height: 25px
                                    border-radius: var(--border-btn)
                            .browse
                                right: 0px
                                padding: 0
                            >span a
                                height: 25px
                                line-height: 25px
                            span
                                padding: 0
                                width: 80%
                                text-align: left
                                @media screen and (min-width: 1921px)
                                    width: 340px
                                @media screen and (min-width: 1441px) and (max-width: 1920px)
                                    width: 100%
                                a
                                    img
                                        height: 16px
                                div
                                    width: 90%
                                    margin-right: 0px
                                    a
                                        padding: 0
                                        min-width: 250px
                                        text-align: left
            .gray
                $gray: #8290ad
                color: $gray
                font-size: 12px
                .color
                    font-size: 12px
                    color: $gray
                img
                    border-radius: inherit
                    border: none
                    margin-right: 13px
                    height: 12px
                    left: 3px
                    position: relative
            .type
                text-align: center
            .direction
                font-size: 11px
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                text-transform: uppercase
            &.OUT
                .direction
                    img
                        filter: invert(105%)
                        vertical-align: bottom
                    color: #0037c1
                    &.label-icon
                        width: 25px
                        height: 25px
                        background: var(--primary2)
                        border-radius: var(--border-btn)
                        text-align: center
                        margin-top: 7px
                .txhash a
                    color: #0037c1
            &.IN
                .direction
                    img
                        filter: invert(105%)
                        vertical-align: bottom
                    color: #0bffb7
                    &.label-icon
                        width: 25px
                        height: 25px
                        background: var(--primary1)
                        border-radius: var(--border-btn)
                        text-align: center
                        margin-top: 7px
                .txhash a
                    color: #71c5aa
    .panel-footer
        padding: 10px
    img
        height: 20px
        border-radius: 0
        &.icon-svg
            position: relative
            border-radius: 0px
            height: 12px
            top: 2px
            margin: 0
            margin-top: 5px
    .hidden
        display: none !important
    .loader-ios
        position: relative
        display: inline-block
        vertical-align: middle
        -webkit-animation: iosIntro 0.6s
        animation: iosIntro 0.6s
        svg
            fill: #c5c5c5
            path
                &:nth-of-type(1)
                    -webkit-animation: pulsed 1s infinite linear
                    animation: pulsed 1s infinite linear
                &:nth-of-type(2)
                    -webkit-animation: pulsed 1s -0.083s infinite linear
                    animation: pulsed 1s -0.083s infinite linear
                &:nth-of-type(3)
                    -webkit-animation: pulsed 1s -0.166s infinite linear
                    animation: pulsed 1s -0.166s infinite linear
                &:nth-of-type(4)
                    -webkit-animation: pulsed 1s -0.249s infinite linear
                    animation: pulsed 1s -0.249s infinite linear
                &:nth-of-type(5)
                    -webkit-animation: pulsed 1s -0.332s infinite linear
                    animation: pulsed 1s -0.332s infinite linear
                &:nth-of-type(6)
                    -webkit-animation: pulsed 1s -0.415s infinite linear
                    animation: pulsed 1s -0.415s infinite linear
                &:nth-of-type(7)
                    -webkit-animation: pulsed 1s -0.498s infinite linear
                    animation: pulsed 1s -0.498s infinite linear
                &:nth-of-type(8)
                    -webkit-animation: pulsed 1s -0.581s infinite linear
                    animation: pulsed 1s -0.581s infinite linear
                &:nth-of-type(9)
                    -webkit-animation: pulsed 1s -0.664s infinite linear
                    animation: pulsed 1s -0.664s infinite linear
                &:nth-of-type(10)
                    -webkit-animation: pulsed 1s -0.747s infinite linear
                    animation: pulsed 1s -0.747s infinite linear
                &:nth-of-type(11)
                    -webkit-animation: pulsed 1s -0.83s infinite linear
                    animation: pulsed 1s -0.83s infinite linear
                &:nth-of-type(12)
                    -webkit-animation: pulsed 1s -0.913s infinite linear
                    animation: pulsed 1s -0.913s infinite linear
    @-webkit-keyframes pulsed
        50%
            fill: #868686
        to
            fill: rgba(134, 134, 134, 0.4)
    @keyframes pulsed
        50%
            fill: #868686
        to
            fill: rgba(134, 134, 134, 0.4)
    @-webkit-keyframes iosIntro
        from
            -webkit-transform: scale(1)
            transform: scale(1)
            opacity: 1
        to
            -webkit-transform: scale(1)
            transform: scale(1)
            opacity: 1
    @keyframes iosIntro
        from
            -webkit-transform: scale(1)
            transform: scale(1)
            opacity: 1
        to
            -webkit-transform: scale(1)
            transform: scale(1)
            opacity: 1
loader = ({ store, web3t })->
    .loader-ios.pug
        svg.pug(width='15px' height='15px' viewbox='0 0 15 15' version='1.1' xmlns='http://www.w3.org/2000/svg')
            path.pug(d='M10.3866667,5.83333333 C10.2338889,5.56722222 10.3238889,5.22777778 10.5894444,5.07388889 L13.2333333,3.54555556 C13.5011111,3.39388889 13.8416667,3.48444444 13.9944444,3.75 C14.1477778,4.01611111 14.0583333,4.35666667 13.7922222,4.50777778 L11.1455556,6.03611111 C10.8794444,6.18944444 10.5405556,6.09833333 10.3866667,5.83333333 Z')
            path.pug(d='M8.96277778,3.85444444 L10.4905556,1.20722222 C10.6438889,0.941666667 10.9844444,0.85 11.25,1.00388889 C11.5161111,1.15722222 11.6061111,1.49611111 11.4527778,1.76277778 L9.92611111,4.40833333 C9.77277778,4.675 9.43277778,4.76666667 9.16666667,4.61277778 C8.90055556,4.45944444 8.80888889,4.11888889 8.96277778,3.85444444 Z')
            path.pug(d='M7.49944444,4.16666667 C7.19277778,4.16666667 6.94388889,3.91777778 6.94388889,3.61055556 L6.94388889,0.555555556 C6.94388889,0.247777778 7.19277778,0 7.49944444,0 C7.80722222,0 8.05666667,0.248333333 8.05666667,0.555555556 L8.05666667,3.61055556 C8.05555556,3.91833333 7.80722222,4.16666667 7.49944444,4.16666667 Z')
            path.pug(d='M4.61277778,5.83333333 C4.45888889,6.09833333 4.11944444,6.18944444 3.85444444,6.03611111 L1.20833333,4.50777778 C0.942777778,4.35666667 0.851111111,4.01611111 1.00444444,3.75 C1.15833333,3.48388889 1.49888889,3.39333333 1.76388889,3.54555556 L4.40944444,5.07388889 C4.67555556,5.22777778 4.76666667,5.56722222 4.61277778,5.83333333 Z')
            path.pug(d='M5.07388889,4.40944444 L3.54611111,1.76333333 C3.39277778,1.49666667 3.48444444,1.15777778 3.74888889,1.00444444 C4.015,0.850555556 4.35444444,0.941111111 4.50833333,1.20777778 L6.03611111,3.855 C6.18833333,4.11944444 6.09833333,4.45944444 5.83222222,4.61277778 C5.56722222,4.76722222 5.22722222,4.675 5.07388889,4.40944444 Z')
            path.pug(d='M3.61055556,8.05555556 L0.555555556,8.05555556 C0.247777778,8.05555556 0,7.80666667 0,7.5 C0,7.19222222 0.248333333,6.94388889 0.555555556,6.94388889 L3.61055556,6.94388889 C3.91722222,6.94388889 4.16666667,7.19277778 4.16666667,7.5 C4.16666667,7.80666667 3.91777778,8.05555556 3.61055556,8.05555556 Z')
            path.pug(d='M4.61277778,9.16777778 C4.76666667,9.43333333 4.67555556,9.77222222 4.41,9.92666667 L1.76444444,11.4538889 C1.49888889,11.6055556 1.15833333,11.5161111 1.00444444,11.2505556 C0.851111111,10.9844444 0.942777778,10.6455556 1.20833333,10.4905556 L3.85388889,8.96388889 C4.11944444,8.80888889 4.45888889,8.90055556 4.61277778,9.16777778 Z')
            path.pug(d='M6.03666667,11.1455556 L4.50888889,13.7938889 C4.355,14.0577778 4.01444444,14.1488889 3.74944444,13.995 C3.48444444,13.8411111 3.39277778,13.5027778 3.54666667,13.2366667 L5.07444444,10.59 C5.22833333,10.325 5.56777778,10.2355556 5.83333333,10.3872222 C6.09888889,10.5411111 6.18944444,10.8805556 6.03666667,11.1455556 Z')
            path.pug(d='M7.49944444,10.8344444 C7.80722222,10.8344444 8.05666667,11.0833333 8.05666667,11.3911111 L8.05666667,14.4455556 C8.05666667,14.7511111 7.80777778,15.0005556 7.49944444,15.0005556 C7.19277778,15.0005556 6.94388889,14.7522222 6.94388889,14.4455556 L6.94388889,11.3911111 C6.94388889,11.0833333 7.19222222,10.8344444 7.49944444,10.8344444 Z')
            path.pug(d='M9.92611111,10.59 L11.4527778,13.2366667 C11.6055556,13.5027778 11.5155556,13.8411111 11.25,13.995 C10.9838889,14.1483333 10.6438889,14.0572222 10.4905556,13.7938889 L8.96277778,11.1455556 C8.80944444,10.8805556 8.90111111,10.5411111 9.16666667,10.3872222 C9.43277778,10.2355556 9.77277778,10.325 9.92611111,10.59 Z')
            path.pug(d='M10.3866667,9.16777778 C10.54,8.90111111 10.8794444,8.80888889 11.145,8.96388889 L13.7922222,10.4905556 C14.0583333,10.6455556 14.1477778,10.9844444 13.9944444,11.2505556 C13.8416667,11.5166667 13.5011111,11.6061111 13.2333333,11.4538889 L10.5894444,9.92666667 C10.3238889,9.77222222 10.2338889,9.43277778 10.3866667,9.16777778 Z')
            path.pug(d='M14.4433333,6.94388889 L11.3872222,6.94388889 C11.0805556,6.94388889 10.8311111,7.19277778 10.8311111,7.5 C10.8311111,7.80666667 11.0794444,8.05555556 11.3872222,8.05555556 L14.4433333,8.05555556 C14.7511111,8.05555556 15,7.80666667 15,7.5 C15,7.19222222 14.7511111,6.94388889 14.4433333,6.94388889 Z')
#seen-txs = {}
render-transaction = (store, web3t, tran)-->
    { transaction-info, coins, checked, arrow, arrow-lg, sign, delete-pending-tx, amount-beautify, ago } = history-funcs store, web3t
    style = get-primary-info store
    filter-icon=
        filter: style.app.filterIcon
    lang = get-lang store
    menu-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
    line-style =
        background: style.app.wallet
    light-style =
        background: style.app.wallet-light
    lightText=
        color: style.app.color3
    icon1=
        filter: style.app.icon1
    tooltip=
        background: "black"
    { token, tx, amount, fee, time, url, type, pending, from, to, recipient-type, description } = tran
    coin =
        coins |> find (.token is token)
    return null if not coin?
    network = coin[store.current.network]
    request = { network, tx }
    tx-details = ->
        store.history.tx-details =
            | store.history.tx-details is "#{tx}#{type}" => null
            | _ => "#{tx}#{type}"
    icon-pending=
        filter: if pending is yes then 'grayscale(100%) brightness(40%) sepia(100%) hue-rotate(-370deg) saturate(790%) contrast(0.5)' else style.app.icon-filter
    amount-pending=
        color: if pending is yes then 'orange' else ''
    about =
        | recipient-type is \contract => 'Smart'
        | description is \internal => 'Smart'
        | description is \external => 'User'
        | _ => 'Unknown'
    about-icon =
        | recipient-type is \contract => \ "#{icons.smart}"
        | description is \internal => \ "#{icons.smart}"
        | description is \external => \ "#{icons.user}"
        | _ => \ "#{icons.unknown}"
    wallet-from =
        address: from
        network: network
        coin: coin
    wallet-to =
        address: to
        network: network
        coin: coin
    cut-hash = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 15) + \.. + t.substr(t.length - 15, 15)
    time-ago =
        | time => ago time
        | _ => ""
    wallet = store.current.account.wallets[store.current.walletIndex]
    rounded-fee = round-number fee, {decimals: wallet.network.decimals}
    .record.pug(class="#{type}" key="#{tx + type}" style=border-style datatesting="transaction")
        .pug.tx-top(style=line-style)
            .cell.pug.text-center.network
                .pug.direction.label-icon
                    img.icon-svg.pug(src="#{arrow-lg(type)}")
            if type is \IN
                .pug.cell.details-from
                    .pug.gray(style=lightText)
                        span.action.pug
                            address-holder { store, wallet: wallet-from }
                        if no
                            span.from-to.pug
                                span.pug.smart-contract
                                    .pug.tooltip #{about}
                                    img.help.pug(src="#{about-icon}")
                                span.pug #{lang.from}
            else
                .pug.cell.details-to
                    .pug.gray(style=lightText)
                        span.action.pug
                            address-holder { store, wallet: wallet-to }
                        if no
                            span.from-to.pug
                                span.pug.smart-contract
                                    .pug.tooltip #{about}
                                    img.help.pug(src="#{about-icon}")
                                span.pug #{lang.to}
            .cell.pug.created
                .time-ago.pug #{time-ago}
            .cell.pug.amount(style=menu-style)
                .pug(title="#{amount}" style=amount-pending)
                    span.sign.direction.pug #{sign(type)}
                    amount-beautify amount, 8
            .cell.pug.status(style=menu-style)
                if pending is yes
                    span.pug
                        span.pug.bold.confirmed #{lang.created}
                        span.pug.bold
                            loader store, web3t
                else
                    span.pug
                        span.pug.bold.confirmed.done #{lang.confirmed}
            .cell.pug.divider.more(on-click=tx-details)
                img.icon-svg1.more.pug(src="#{icons.arrow-down}" style=icon1)
                .arrow_box.pug(style=tooltip) #{lang.details}
        if store.history.tx-details is "#{tx}#{type}"
            .pug.tx-middle(style=light-style on-click=transaction-info(request))
                .cell.pug.divider
                    if no
                        .pug.direction #{arrow(type)}
                .cell.pug.txhash
                    MiddleEllipsis.pug
                        a.pug(href="#{url}" target="_blank") #{tx}
                    CopyToClipboard.pug(text="#{tx}" on-copy=copied-inform(store) style=filter-icon)
                        copy store
                    .pug.gray(style=lightText)
                        span.pug #{lang.created}:
                            | #{time-ago}
                        if pending is yes
                            span.pug
                                span.pug.bold #{lang.created}
                        else
                            span.pug.bold.confirmed.done #{lang.confirmed}
                        span.pug.smart-contract
                            .pug.tooltip #{about}
                            img.help.pug(src="#{about-icon}")
                .cell.pug.divider
                .cell.pug.divider2
                    .pug.gray(style=lightText)
                        span.pug.fee #{lang.fee}:              
                        .pug.balance
                            span.color.pug #{rounded-fee}
module.exports = ({ store, web3t })->
    { go-back, switch-type-in, switch-type-out, coins, is-active, switch-filter } = history-funcs store, web3t
    style = get-primary-info store
    lang = get-lang store
    header-style =
        border-bottom: "1px solid #{style.app.border}"
        color: style.app.text
    icon2=
        filter: style.app.icon2
    header-style-light =
        color: style.app.text
    button-style=
        color: style.app.text
        border-right: "1px solid #{style.app.border}"
        border-left: "1px solid #{style.app.border}"
    filter-style=
        background: style.app.header
        font-weight: "600"
    split=
        border: "1px solid #{style.app.border}"
    menu-style=
        color: style.app.text
    border-b =
        border-bottom: "1px solid #{style.app.border}"
    border-t =
        border-top: "1px solid #{style.app.border}"
    filter-body =
        border: "1px solid #{style.app.border}"
        background: style.app.account-bg
    input-style=
        background: style.app.bg-primary-light
        border: "1px solid #{style.app.border}"
        color: style.app.text
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
        background-color: style.app.primary1-spare
    lightText=
        color: style.app.color3
    nothing-icon=
        filter: style.app.nothingIcon
    header-table-style=
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.wallet-light
    icon-filter=
        filter: style.app.icon-filter
    expand-collapse = ->
        store.history.filter-open = not store.history.filter-open
    length = store.transactions.applied.length
    rowRenderer = ({ key, index, isScrolling, isVisible, style })->
        return render-transaction store, web3t, store.transactions.applied[index] # if isVisible
        null
    history-width = store.current.size.width / 1.9
    history-height = store.current.size.height - 200 - 60
    .pug.normalheader.history
        .header.pug(style=header-style-light)
            if store.current.device is \mobile
                button.back.pug(on-click=go-back style=button-style)
                    img.icon-svg-arrow.pug(src="#{icons.arrow-left}")
            span.pug.head.left.h1 #{lang.your-transactions}
            span.pug.head.right(on-click=expand-collapse)
                img.icon-svg1.pug(src="#{icons.filter}" style=icon2)
            .pug.table-header
                span.pug.from-to
                    | #{lang.from}
                    | /
                    | #{lang.to}
                span.pug.created #{lang.created}
                span.pug.amount #{lang.amount}
                span.pug.status #{lang.status}
                span.pug.details #{lang.details}
            if store.history.filter-open
                .pug.filter(style=filter-body)
                    .pug.top(style=border-b)
                        button.OUT.pug(class="#{is-active('OUT')}" on-click=switch-type-out)
                            img.icon-svg.pug(src="#{icons.send}")
                        .pug(style=split)
                        button.IN.pug(class="#{is-active('IN')}" on-click=switch-type-in)
                            img.icon-svg.pug(src="#{icons.get}")
                    .pug.middle(style=border-b)
                        .pug
                            input.pug(type='text' style=input-style placeholder="#{lang.from}")
                        .pug
                            input.pug(type='text' style=input-style placeholder="#{lang.to}")
                        button.pug(on-click style=button-primary1-style)
                            span.pug
                                img.icon-svg-btn.pug(src="#{icons.apply}")
                                | #{lang.btn-apply}
                    .pug.bottom
                        for coin in coins
                            button.pug(key="#{coin.token}" class="#{is-active(coin.token)}" style=filter-style on-click=switch-filter(coin.token))
                                img.pug(src="#{coin.image}")
        .pug
            .pug.table(style=border-t)
                store.transactions.applied |> take 20 |> map render-transaction store, web3t
            if length is 0
                .pug.nothin-to-show(style=menu-style)
                    img.pug(style=nothing-icon src="#{icons.search-history}"
                    .pug.head #{lang.nothing-to-show}