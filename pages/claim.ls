require! {
    \react
    \../get-lang.ls
    \../get-primary-info.ls
    \../history-funcs.ls
    \./switch-account.ls
    \../icons.ls
    \./claim-stake.ls
    \../components/burger.ls
}
.claim
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: $left-margin
    top: 0
    height: auto
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    .pad
        padding: 0 5px
    .pad-bottom
        padding-bottom: 5px
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    .claim-content
        overflow: hidden
        background: transparent
        width: 100%
        border-radius: 0px
        position: relative
        box-sizing: border-box
        .claim-table
            margin: 15px 0
            max-height: 100px
            width: 300px
            overflow-y: auto
            background: rgb(90, 26, 154)
            @media(max-width:800px)
                margin: 15px auto
            tbody
                background: rgb(45, 15, 85)
            table
                width: 100%
                tr
                    padding: 0
                    margin: 0
                    td
                        width: 33%
                        &:first-child
                            text-align: center
        .left-proxy, .right-proxy
            width: 15px
            height: 16px
            line-height: 10px
            display: inline-block
            color: white
            padding: 9px
            border-radius: 0px
            cursor: pointer
            vertical-align: top
            text-align: center
        .form-group
            text-align: center
            padding-top: 0px
            overflow-y: auto
            input, textarea
                margin: 5px 0
                outline: none
            .section
                border-bottom: 1px solid rgba(240, 237, 237, 0.16)
                padding: 30px 20px
                display: flex
                @media (max-width: 800px)
                    display: flow-root
                    padding: 20px
                &:last-child
                    border: 0
                &.reward
                    background-image: $reward
                    background-repeat: no-repeat
                    background-position: 16%
                    background-size: auto
                    background-color: rgba(111, 50, 162, 0.15)
                    @media(max-width: 800px)
                        background-position: 5%
                    @media(max-width: 540px)
                        background-image: none
                .title
                    padding: 0px
                    width: 30%
                    text-align: left
                    text-transform: uppercase
                    font-size: 14px
                    @media (max-width: 800px)
                        width: 100%
                        margin-bottom: 20px
                        text-align: center
                    .less
                        font-size: 10px
                        opacity: 0.9
                .description
                    padding: 0px
                    font-size: 14px
                    width: 70%
                    text-align: left
                    .table
                        width: 240px
                        .balance
                            text-align: right
                            .header
                                float: left
                    hr
                        margin: 15px auto
                        border: 1px solid rgba(240, 237, 237, 0.16)
                        border-top: 0
                    .chosen-pool
                        margin-bottom: 10px
                        .color
                            color: orange
                            font-weight: 600
                            &.green
                                color: green
                    &.table-scroll
                        overflow-x: scroll
                        max-height: 200px
                        background: linear-gradient(#321260 30%, rgba(50, 18, 96, 0)), linear-gradient(rgba(50, 18, 96, 0), #321260 70%) 0 100%, radial-gradient(farthest-side at 50% 0, #594aaa, rgba(0, 0, 0, 0)), radial-gradient(farthest-side at 50% 100%, #594aaa, rgba(0, 0, 0, 0)) 0 100%
                        background-repeat: no-repeat
                        background-attachment: local, local, scroll, scroll
                        background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
                        animation: breathe 3s ease-in infinite
                        -moz-transition: breathe 3s ease-in infinite
                        -web-kit-transition: breathe 3s ease-in infinite
                    table
                        width: 100%
                        border-collapse: collapse
                        margin: 0px auto
                    tr:nth-of-type(odd)
                        background: rgba(107, 38, 142, 0.2)
                    th
                        background: rgb(67, 32, 124)
                        color: white
                        font-weight: 400
                        &:first-child
                            text-align: center
                            width: 5%
                        &:nth-child(2)
                            width: 25%
                        &:nth-child(3)
                            width: 45%
                        &:nth-child(4)
                            width: 15%
                    td, th
                        padding: 10px
                        border: 1px solid rgba(240, 237, 237, 0.16)
                    .left
                        position: relative
                        .small-btns
                            line-height: 36px
                            button.small
                                outline: none
                                border-radius: 0px
                                line-height: 10px
                                text-align: center
                                height: 16px
                                font-size: 10px
                                font-weight: 600
                                margin-top: 0
                                width: auto
                                margin-right: 10px
                                padding: 2px 5px
                                cursor: pointer
                    @media (max-width: 800px)
                        width: 100%
                        text-align: center
                    .important
                        color: orange
                    .left-node
                        width: 40%
                        float: left
                        @media (max-width: 800px)
                            width: 100%
                            text-align: center
                            margin-bottom: 20px
                        @media (min-width: 801px) and (max-width: 992px)
                            width: 50%
                        img
                            width: 240px
                            &.icon-svg
                                height: 12px
                                width: auto
                                padding-right: 5px
                    .right-node
                        width: 60%
                        float: right
                        @media (max-width: 800px)
                            width: 100%
                            text-align: center
                        @media (min-width: 801px) and (max-width: 992px)
                            width: 50%
                            text-align: left
                    &.node
                        width: 80%
                    .tabs
                        display: inline-block
                        margin: 20px 0 20px
                        width: 100%
                        .tab
                            width: 25%
                            display: inline-block
                            opacity: 0.5;
                            text-align: center
                            border-bottom: 1px solid
                            line-height: 37px
                            text-transform: uppercase
                            font-size: 10px
                            font-weight: bold
                            cursor: pointer
                            height: 36px
                            background: #2c0d5f
                            border-color: #6b258e
                            @media (max-width: 800px)
                                width: 50%
                            &.active
                                opacity: 1
                                border-bottom: 1px solid #6e1d96
                                background: #37156d
                    .btn
                        margin: 10px 0
                    .code
                        overflow: scroll
                        background: #1b1b1b
                        text-align: left
                        .copy
                            float: right
                            margin-top: 11px
                            margin-right: 10px
                            width: 15px
                        .cursor
                            -webkit-animation: blink 0.9s infinite
                            animation: blink 0.9s infinite
                            font: initial
                            display: inline-block
                            opacity: 1
                            margin-left: 5px
                        @-webkit-keyframes blink
                            0%
                                opacity: 1
                            50%
                                opacity: 0
                            100%
                                opacity: 1
                        @keyframes blink
                            0%
                                opacity: 1
                            50%
                                opacity: 0
                            100%
                                opacity: 1
                        &.comming
                            background: transparent
                            text-align: center
                    .window
                        position: sticky
                        top: 0
                        left: 0
                        height: 39px
                        background: #040404
                        .icons
                            padding: 0.75em
                            position: absolute
                            span
                                background: #040404
                            &:before
                                content: ""
                                background: #040404
                            &:after
                                content: ""
                                background: #040404
                            span, &:before, &:after
                                display: inline-block
                                float: left
                                width: 1em
                                height: 1em
                                border-radius: 50%
                                margin-right: 0.5em
                    .balance
                        font-size: 14px
                        margin-bottom: 5px
                        span
                            margin-right: 5px
                            &.green
                                color: #3cd5af
                        .color
                            color: orange
                            font-weight: 600
                        .label-coin
                            left: 3px
                            top: 2px
                            padding-right: 2px
                            height: 15px
                            position: relative
                            color: orange
                            font-weight: 600
                    textarea
                        border: 0
                        padding: 10px
                        font-size: 13px
                        width: 100%
                        box-sizing: border-box
                        min-height: 120px
                        font-family: monospace
                .content
                    width: 30%
                    position: relative
                    button, .switch-index
                        margin: 0
                        position: absolute
                        top: 50%
                        left: 40%
                        -ms-transform: translateY(-50%)
                        transform: translateY(-50%)
            .center
                text-align: center
            .left
                text-align: left
            label
                font-size: 13px
            h3
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                opacity: .8
                font-weight: 400
                margin: 0
            input[type="checkbox"]
                height: auto
                width: auto
                margin: 0 40%
                cursor: pointer
            input
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: 0
                padding: 0px 10px
                font-size: 14px
                margin: 5px 0
                border: 0px
                box-shadow: none
                &.change-index
                    margin: 0 !important
                    border-radius: 0px
                    height: 36px
                    width: 55px
                    line-height: 36px
                    text-align: center
                    font-size: 13px
    .warning
        border: 1px solid orange
        padding: 5px
        background: rgba(orange, 0.1)
        margin: 10px 0
        display: inline-block
    ol
        padding: 0 25px
        margin: 5px 0
    ul
        padding: 0
        margin: 0
        min-width: 100%
        max-width: 300px
        li 
            list-style: none
            margin-left: 0
            font-size: 13px
            color: #fff
            font-size: 14px
            margin-bottom: 5px
            list-style-position: inside
            white-space: nowrap
            overflow: hidden
            text-overflow: ellipsis
            @media (max-width: 800px)
                text-align: center
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 130px
        margin-top: 10px
        padding: 0 6px
        text-decoration: none
        text-transform: uppercase
        font-size: 10px
        font-weight: bold
        cursor: pointer
        outline: none
        display: inline-block
        text-overflow: ellipsis
        overflow: hidden
        white-space: nowrap
        &.btn-width
            width: auto
            padding: 0 10px
        &.mt-0
            margin-top: 0
        &:hover
            background: transparent
            color: $primary
        &.link
            min-width: 190px
    >.title
        position: sticky
        z-index: 1
        background: linear-gradient(100deg, rgb(51, 20, 98) 4%, rgb(21, 6, 60) 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
module.exports = ({store, web3t})->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    lightText=
        color: info.app.color3
    .pug.claim
        .pug.title(style=border-style)
            .pug.header Claim Reward
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            switch-account store, web3t
        .pug.claim-content
            .form-group.pug
                claim-stake store, web3t