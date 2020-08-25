require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \../icons.ls
    \./epoch.ls
}
.faq
    @import scheme
    $border-radius: $border
    $smooth: opacity .15s ease-in-out
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: $left-margin
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    .section-reward
        @import scheme
        border-bottom: 1px solid rgba(240, 237, 237, 0.16)
        padding: 30px 20px
        display: flex
        .claim-table
            margin: 10px auto
        button
            float: left
            background-color: #6595F5
            border: 1px solid #6595F5
            border-radius: 0px
            color: white
            height: 36px
            width: auto
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
            @media (max-width: 800px)
                margin: 10px auto
                float: none
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
                background-image: none
            @media(max-width: 540px)
                background-image: none
        .title
            padding: 0px
            width: 30%
            text-align: left
            text-transform: uppercase
            font-size: 14px
            h3
                font-size: 12px
                text-transform: uppercase
                letter-spacing: 2px
                opacity: .8
                font-weight: 400
                margin: 0
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
    .active-download
        bottom: 10px
        right: 10px
        width: 226px
        position: fixed
        display: inline-grid
        z-index: 3
        >.hide-progress
            display: none
        .file-name
            text-overflow: ellipsis
            overflow: hidden
            width: 90px
        progress
            width: 45px
            height: 16px
        .pending
            opacity: .5
        .progress
            float: right
        .cancel
            text-transform: uppercase
            float: right
            cursor: pointer
            font-weight: 600
            font-size: 11px !important
            text-align: right
            color: #6f6fe2 !important
        .action
            position: absolute
            right: 0px
            li
                display: inline-block
                margin-left: 12px
                cursor: pointer
                &.hide-progress
                    transform: rotate(180deg)
        .top
            border: 0
        img
            width: 20px
            height: 15px
            margin-right: 10px
        .col
            font-size: 12px
            padding: 10px 15px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
            color: rgb(204, 204, 204)
            overflow-y: hidden
            &.folder-menu
                text-align: left
                display: inline-flex
                span
                    margin-right: 10px
        .table-row-menu
            text-align: left
            &.active
                background: rgba(75, 40, 136, 0.2)
        .bottom, .middle
            padding: 10px
        .middle
            button
                outline: none
                cursor: pointer
                border: 1px solid
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
    .menu
        width: 160px
        position: absolute
        top: 188px
        right: 0px
        display: inline-grid
        z-index: 3
        .col
            font-size: 12px
            padding: 10px 15px
            margin: 0
            display: inline-block
            vertical-align: top
            box-sizing: border-box
            color: rgb(204, 204, 204)
            overflow-y: hidden
            &.folder-menu
                text-align: left
                display: inline-flex
                span
                    margin-right: 10px
        .table-row-menu
            text-align: left
            &:hover
                cursor: pointer
                background: rgba(75, 40, 136, 0.2)
            &.active
                background: rgba(75, 40, 136, 0.2)
        .bottom, .middle
            padding: 10px
        .middle
            button
                outline: none
                cursor: pointer
                border: 1px solid
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
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    .search-input
        position: fixed
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        z-index: 1
        width: 100%
        .add
            line-height: 35px
            cursor: pointer
            position: absolute
            right: 80px
        .close
            line-height: 2.4
            cursor: pointer
            width: 20px
            margin-right: 20px
            img
                height: 15px
                width: 15px
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    .search-field
        .left
            position: relative
        .icon
            position: absolute
            top: 1px
            right: 0
            background: #532b94
            padding: 8px 20px 9px
    .section
        border-bottom: 1px solid rgba(240, 237, 237, 0.16)
        padding: 15px 20px 15px
        display: flex
        width: 100%
        @media(max-width: 800px)
            width: auto
        img
            height: 140px
            opacity: .8
            transition: .5s
            &.icon-svg-menu
                height: 12px
                margin-right: 10px
                width: auto
        &.filter
            padding: 0px
        &:last-child
            border: 0
        .title
            padding: 0px
            width: 25%
            text-align: left
            font-size: 14px
            @media(max-width: 800px)
                display: none
            h3, h2
                margin: 0
                line-height: 36px
                font-weight: 400
        .description
            padding: 0px
            font-size: 14px
            width: 40%
            text-align: left
            &.tabs
                overflow: hidden
                ul
                    overflow-x: scroll
                    scrollbar-width: none
                    white-space: nowrap
            @media(max-width: 800px)
                width: 100%
            ul
                list-style: none
                padding: 0
                margin: 10px 0 0
                li
                    display: inline-block
                    padding: 15px
                    cursor: pointer
                    &:first-child
                        padding-left: 0
                    .icon
                        margin-right: 5px
                        svg
                            vertical-align: middle !important
                    &.active
                        color: #c671f1
                        border-bottom: 1px solid
                        padding-bottom: 15px
            input
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: $border-radius
                padding: 0px 10px
                font-size: 14px
                margin: 1px
                border: 0px
                box-shadow: none
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 104px
        margin-top: 5px
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
        &:hover
            background: transparent
            color: $primary
        &.link
            min-width: 190px
        float: right
        margin-top: 12px
        margin-right: 10px
    >.title
        position: sticky
        position: -webkit-sticky
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        z-index: 2
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
    >.toolbar
        position: relative
        height: 60px
        ul
            display: inline-flex
            float: left
            list-style: none
            padding: 0 20px
            line-height: 1.8
            &.path
    >.wrapper
        height: 540px
        display: flex
        padding: 50px
        flex-wrap: wrap
        overflow-y: scroll
        scrollbar-width: none
        margin-top: 0px
        @media(max-width: 800px)
            padding: 20px
        >.panel-content
            margin-left: 300px
            padding: 20px
            box-sizing: border-box
            width: 100%
            .block-content
                padding-bottom: 20px
                margin-bottom: 20px
            &.dragarea
                overflow: inherit
            &.subscr
                display: grid
            &.file-tree
                margin-left: 0px
                @media(max-width: 800px)
                    margin-left: 0px
            .dragfile
                position: absolute
                height: 100vh
                background: rgba(35, 16, 68, 0.85)
                display: none
                &.dragarea
                    display: block
                    width: calc(100% - 180px)
                    display: block
                    top: 190px
                    left: 181px
                    z-index: 2
                    @media(max-width:800px)
                        left: 0
                        width: 100%
                div
                    top: 10rem
                    text-align: center !important
                    position: relative
                    width: 60% !important
                    padding: 50px 20px
                    border: 1px dashed
                    margin: 0 auto
                    display: block
                    @media (max-width: 800px)
                        width: 80% !important
                    img
                        display: block
                        width: 40px
                        margin: 0 auto 20px
                    span
                        color: #6f6fe2
                        cursor: pointer
                        display: block
            @media(max-width: 800px)
                width: 100%
                margin-left: 0
            .results
                text-align: left
                font-size: 13px
                margin: 0
            .header
                text-align: left
                font-size: 18px
                font-weight: 400
                margin: 0 0 20px
            .section
                padding: 0 15px 0 0
                display: inline-block
                width: 25%
                min-width: 205px
                min-height: 230px
                border: 0
                box-sizing: border-box
                vertical-align: text-top
                margin-bottom: 20px
                float: left
                @media(max-width:800px)
                    &:nth-child(odd)
                        padding: 0
                    width: 50%
                @media(max-width:640px)
                    width: 100%
                    padding: 0
                .source
                    position: relative
                &.developing
                    opacity: .5
                    .source
                        cursor: pointer
                        &:hover
                            .header, .address
                                text-decoration: none
                                cursor: not-allowed
                .address, .header, .description
                    width: 100%
                    text-align: left
                    margin: 5px 0
                .address
                    color: #969696
                    font-size: 13px
                    cursor: pointer
                .header
                    font-weight: 500
                    color: #fff
                    font-size: 17px
                    -webkit-line-clamp: 2
                    -webkit-box-orient: vertical
                    overflow: hidden
                    text-overflow: ellipsis
                    display: block
                    display: -webkit-box
                .description
                    opacity: .8
                    line-height: 1.6
                    font-size: 13px
                ul.stat
                    list-style: none
                    padding: 0
                    margin-bottom: 0
                    color: #969696
                    font-size: 13px
                    text-align: left
                    margin-top: 0
                    li
                        display: inline-block
                        margin-left: 4px
                        cursor: pointer
                        + li
                            &:before
                                content: ' · '
                        &:first-child
                            margin-left: 0
        >.faq-content
            margin-left: 300px
            padding: 0 40px
            width: 60%
            box-sizing: border-box
            &.file-tree
                margin-left: 0px
                @media(max-width: 800px)
                    margin-left: 0px
            .content-right
                width: 100%
                margin-left: 0px
                @media screen and (max-width: 800px)
                    width: 100%
                .star
                    width: 11px
                    height: 11px
                    margin-right: 10px
                    top: 4px
                    position: relative
            img
                width: 100%
                height: 140px
                opacity: .8
                transition: .5s
            @media(max-width: 800px)
                width: 100%
                margin-left: 0
                padding: 0
            .results
                text-align: left
                font-size: 13px
                margin: 0
            h1.header
                text-align: left
                font-size: 24px
                font-weight: 600
                margin: 0 0 30px
                >img
                    width: 30px
                    height: auto
                    float: left
                    margin-right: 15px
            .header
                text-align: left
                font-size: 18px
                font-weight: 400
                margin: 0 0 20px
            .sub-header
                text-align: left
                font-size: 18px
                font-weight: 400
                margin: 0 0 50px
                opacity: .7
            .section
                padding: 0
                display: inline-block
                width: 100%
                min-width: 205px
                min-height: auto
                border: 0
                box-sizing: border-box
                vertical-align: text-top
                margin-bottom: 30px
                float: left
                .source
                    position: relative
                    display: flex
                .address, .header, .description
                    width: 100%
                    text-align: left
                    margin: 5px 0
                .address
                    color: #969696
                    font-size: 13px
                    cursor: pointer
                .header
                    font-weight: 500
                    color: #fff
                    font-size: 17px
                    -webkit-line-clamp: 2
                    -webkit-box-orient: vertical
                    overflow: hidden
                    text-overflow: ellipsis
                    display: block
                    display: -webkit-box
                    &.question
                        cursor: pointer
                        display: inline-flex
                        &.active
                            text-decoration: underline
                        &:hover
                            text-decoration: underline
                        &.placeholder
                            height: 20px
                            margin-bottom: 0px
                            img
                                display: none
                .description
                    opacity: .8
                    line-height: 1.6
                    font-size: 13px
                ul.answer
                    list-style: none
                    padding: 0
                    margin-bottom: 0
                    color: rgba(255, 255, 255, 0.8)
                    font-size: 15px
                    text-align: left
                    margin-top: 0
                    padding-top: 8px
                    margin-left: 25px
                    font-style: italic
                    li
                        display: inline-block
                        margin-bottom: 20px
                        &:last-child
                            margin-bottom: 0px
                        &.attention
                            background: rgba(89, 74, 170, 0.24)
                            padding: 20px 25px
                            border-left: 4px solid #6d48ce
                        img
                            height: 100%
                            width: 100%
                            box-shadow: 0px 10px 15px 0px rgba(24, 8, 64, 0.3)
        >.main-content
            width: 300px
            position: fixed
            box-sizing: border-box
            @media(max-width: 800px)
                display: inline-table
                position: relative
                margin-bottom: 40px
            &.file-tree
                display: none
                @media(max-width: 800px)
                    display: none
            .tabs
                height: 100vh
                @media(max-width: 800px)
                    width: 100%
                    height: auto
                ul
                    overflow-x: scroll
                    scrollbar-width: none
                    text-align: left
            @media(max-width: 800px)
                width: 100%
            ul
                list-style: none
                margin: 0
                padding: 0
                li
                    display: inline-block
                    padding: 15px 25px
                    font-size: 14px
                    cursor: pointer
                    width: 100%
                    box-sizing: border-box
                    transition: .5s
                    &:nth-child(2)
                        .dot
                            background: orange
                    &:nth-child(3)
                        .dot
                            background: rgb(60, 213, 175)
                    .dot
                        width: 6px
                        height: 6px
                        background: #1cd3fd
                        display: inline-block
                        margin-right: 10px
                        vertical-align: middle
                        border-radius: 100px
                        margin-top: -1px
                    .icon-svg
                        opacity: .8
                        transition: .5s
                        position: relative
                        height: 12px
                        top: 2px
                        opacity: 0
                        float: right
                        margin-right: 3px
                    .icon
                        margin-right: 15px
                        svg
                            vertical-align: middle !important
                    &.active
                        background: rgb(67, 32, 124)
                        padding-bottom: 15px
                        .icon-svg
                            opacity: 1
                    &:hover
                        background: rgb(67, 32, 124)
                        padding-bottom: 15px
                        transition: .5s
    .staking-info
        display: block
        overflow-y: scroll
        scrollbar-width: none
        margin-top: 0
        display: flex
        flex-wrap: wrap
        margin-right: -10px
        margin-left: -10px
        .value
            color: orange
            text-align: center
            &.green
                color: rgb(60, 213, 175)
                text-align: center
        .header
            font-size: 12px
            text-transform: uppercase
            letter-spacing: 2px
            opacity: .8
            font-weight: 400
            margin-top: 10px
            text-align: center
        .col
            box-sizing: border-box
            padding: 0 5px
            margin-bottom: 10px
            &.col-4
                -webkit-box-flex: 0
                flex: 0 0 25%
                max-width: 25%
                @media(max-width: 992px)
                    -webkit-box-flex: 0
                    flex: 0 0 50%
                    max-width: 50%
            > div
                background: #3b1771
                padding: 30px 20px
item = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
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
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    activate = (tab)-> ->
        store.faq.answer = tab 
    activate-item = activate \item
    activate-item2 = activate \item2
    activate-item3 = activate \item3
    activate-item4 = activate \item4
    activate-item5 = activate \item5
    activate-item6 = activate \item6
    activate-item7 = activate \item7
    activate-item8 = activate \item8
    activate-item9 = activate \item9
    activate-item10 = activate \item10
    activate-item11 = activate \item11
    activate-item12 = activate \item12
    activate-item13 = activate \item13
    activate-item14 = activate \item14
    activate-item15 = activate \item15
    activate-item16 = activate \item16
    active-class = (tab)->
        if store.faq.answer is tab then 'active' else ''
    active-item = active-class \item
    active-item2 = active-class \item2
    active-item3 = active-class \item3
    active-item4 = active-class \item4
    active-item5 = active-class \item5
    active-item6 = active-class \item6
    active-item7 = active-class \item7
    active-item8 = active-class \item8
    active-item9 = active-class \item9
    active-item10 = active-class \item10
    active-item11 = active-class \item11
    active-item12 = active-class \item12
    active-item13 = active-class \item13
    active-item14 = active-class \item14
    active-item15 = active-class \item15
    active-item16 = active-class \item16
    .pug.faq-content(class="#{file-tree}")
        h1.header.pug 
            #img.pug(src="#{icons.faq-icon}")
            img.pug(src='data:image/png;base64,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')
            |Web Wallet
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item class="#{active-item}")
                        img.pug.star(src="#{icons.star}")
                        |How many wallets can be created?
                    if active-item is \active
                        ul.pug.answer
                            li.pug
                                span.pug There are no limits to the number of wallets you can create.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item2 class="#{active-item2}")
                        img.pug.star(src="#{icons.star}")
                        |How do I stake with my web wallet?
                    if active-item2 is \active
                        ul.pug.answer
                            li.pug
                                span.pug To become a delegate in the staking pool, you must have a minimum amount of 10,000 VLX or to run your own masternode you must have a minimum amount of 1,000,000 VLX.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item3 class="#{active-item3}")
                        img.pug.star(src="#{icons.star}")
                        |Just started staking but can’t see tokens?
                    if active-item3 is \active
                        ul.pug.answer
                            li.pug
                                span.pug Don’t worry your tokens are helping support the network. You can look at you stake in the rewards section after you click on your staking pool
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item4 class="#{active-item4}")
                        img.pug.star(src="#{icons.star}")
                        |What kind of security features does Velas incorporate?
                    if active-item4 is \active
                        ul.pug.answer
                            li.pug
                                span.pug We are constantly updating and implementing new security features to make sure your tokens are safe.
                            li.pug
                                span.pug When you first create your new wallet you must create a pin code to login to your wallet.
                            li.pug.attention
                                span.pug You are then given a 12(24)-word seed phrase with a printable seed phrase sheet, so you can store your seed phrase somewhere safe and secure.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item5 class="#{active-item5}")
                        img.pug.star(src="#{icons.star}")
                        |What do I do if I lose my pin?
                    if active-item5 is \active
                        ul.pug.answer
                            li.pug
                                span.pug If you can’t remember what your pin is and/or you lost your pin, do worry you can always recover your wallet with your 12(24)-word seed phrase.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item6 class="#{active-item6}")
                        img.pug.star(src="#{icons.star}")
                        |How do I recover my web wallet?
                    if active-item6 is \active
                        ul.pug.answer
                            li.pug
                                span.pug You can recover your wallet with your 12(24)-word phrase.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item7 class="#{active-item7}")
                        img.pug.star(src="#{icons.star}")
                        |What type of digital assets can I store in my wallet?
                    if active-item7 is \active
                        ul.pug.answer
                            li.pug
                                span.pug Why have more than one wallet for your assets, so we created an all-in-one multi-currency wallet. Some of the assets you can store are BTC, ETH, ERC-20 Tokens, EOS, TRX and many more to come.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item8 class="#{active-item8}")
                        img.pug.star(src="#{icons.star}")
                        |What do I do if I lose my seed phrase?
                    if active-item8 is \active
                        ul.pug.answer
                            li.pug.placeholder
                                span.pug
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item9 class="#{active-item9}")
                        img.pug.star(src="#{icons.star}")
                        |What does “export private key” mean? 
                    if active-item9 is \active
                        ul.pug.answer
                            li.pug
                                span.pug All your private keys are securely stored in the network, you are the only one that can see your keys. So if you ever need your keys for any asset you can simply type the ticker symbol and your keys will be copied to your clipboard.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item10 class="#{active-item10}")
                        img.pug.star(src="#{icons.star}")
                        |What does the account index mean?
                    if active-item10 is \active
                        ul.pug.answer
                            li.pug.placeholder
                                span.pug
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item11 class="#{active-item11}")
                        img.pug.star(src="#{icons.star}")
                        |What is Voogle?
                    if active-item11 is \active
                        ul.pug.answer
                            li.pug
                                span.pug Voogle, is like Google but for dApps! We will have an extensive amount of dApps being built on our network. So we made it easy to find your favorite dApp and made it easy to discover new ones.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item12 class="#{active-item12}")
                        img.pug.star(src="#{icons.star}")
                        |How do I check my other wallets?
                    if active-item12 is \active
                        ul.pug.answer
                            li.pug
                                span.pug In your dashboard, there is a section that says “WALLETS” directly across from it is a drop-down menu with your other wallets.
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item13 class="#{active-item13}")
                        img.pug.star(src="#{icons.star}")
                        |How do I send and receive coins/tokens from my wallet?
                    if active-item13 is \active
                        ul.pug.answer
                            li.pug
                                span.pug When in your wallet dashboard, click the wallet you desire to send coins/tokens from, then on the right side of the page there will be 
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item14 class="#{active-item14}")
                        img.pug.star(src="#{icons.star}")
                        |What is the Staking, Your Node page?
                    if active-item14 is \active
                        ul.pug.answer
                            li.pug.placeholder
                                span.pug
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item15 class="#{active-item15}")
                        img.pug.star(src="#{icons.star}")
                        |What is the Staking, Delegate page?
                    if active-item15 is \active
                        ul.pug.answer
                            li.pug.placeholder
                                span.pug
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item16 class="#{active-item16}")
                        img.pug.star(src="#{icons.star}")
                        |What is the Staking, Info page?
                    if active-item16 is \active
                        ul.pug.answer
                            li.pug.placeholder
                                span.pug
item2 = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
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
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    activate = (tab)-> ->
        store.faq.answer2 = tab 
    activate-item = activate \item
    activate-item2 = activate \item2
    activate-item3 = activate \item3
    activate-item4 = activate \item4
    activate-item5 = activate \item5
    activate-item6 = activate \item6
    active-class = (tab)->
        if store.faq.answer2 is tab then 'active' else ''
    active-item = active-class \item
    active-item2 = active-class \item2
    active-item3 = active-class \item3
    active-item4 = active-class \item4
    active-item5 = active-class \item5
    active-item6 = active-class \item6
    .pug.faq-content(class="#{file-tree}")
        h1.header.pug
            img.pug(src='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIcAAACWCAYAAAD0bZs0AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAh6ADAAQAAAABAAAAlgAAAACHvBoeAABAAElEQVR4Ae29CYAlR3kmGO+qenV1VfUptW4JHUhIXDJY2ICQFtnYM/Ycxusx2N71ALbXsDZ4Zljs8Vj2YkYIbBjOwTNj4wOMjWdZW8jGCBYMOx7rAHFIQmqppVbf3VXddVe9+833fX/8kfmqq7urnloHu4pXLyPyj//+/4yIzJeZVQjfReXmn//b7YXW3PNL3YFLC4XSheVC+bxKGDy7VChuLoRCNXSLg6VCqVIoFAZK3VK5GIpl4KEuFe1bLJaLpVDolkKzUw+tTqvbxrbdQavTbLe6rVa72251uu1mt9tqorfRDZ06MBbb3daRZmge7IT2nka3/mi3VHpw4rIL77v55le1votcuCFVCxvCfgqQf+uNf3XVQLHyA5VQunagUL1ksDS0s1oenhwrTQwNlKrFbqcTut2uNGGtb7A6qNY25PE63Y5pDvxOpCGgC7jzIhw74KAO4GV9wovwXpnt7lJ7qVXvLM3XO7Wpere+t1VoPgCcvysMl+547x//9BLJvlvL05YcH3vTPZXZ8tEfHQzVfzxUGn7hSHnivE2ViU3V4nDRQhQDb9EKHSQFC/u6nSw5FPgY1HzghKmAG43Tc6+To1+dIEoWJgZlkT7W+QRRIlEPyo1fw7OEMrpud7E931gJy1P1zvKuZrfx5VBo/9nvfuZNu8T0u2DzlCXHLb902/mDzeE3VcujN00OTF62ZeCsTSWM+vSRBdiC6M72WtAYpHQ0I2bqVwjR5mgiZ3vgs6ChlQVZeNw3evEGXaL3YOcCT5w0quQSQTqTNsGcrycWE4VK9eq00l1qLnbmDtXC8l2tbvNPP/CXP/cZTIOmPtGfQeVJS44PvOXhwXbY+wtDxZH/eWv17OdtGzx7JGBhQGfSYaz9aMaeRgPWLClYES8LQC6RFJSYFOTlfCO9+KxBbyOFBzWjlwzKx18KPOkxykgvyiNvTTdeR32lS4bnuhgvwKNu1CkdCOBDvGaodea7s/uXOwtf7g42P/ih//qWe4j3TChnNDne8Yv/15YdxbG3b63u/OdnDV94YTWuEWgoHSEnscY+ncySBT53hBIep5EUqEhvjs4F0PmCq00Xkf8p6U0XhRb0SYYnAuR74rKPTjL9s9HA9TD9LcnySZ1NXWan09N4ariaHiIkc7E7t7QYZv++Xlz4wH+87Vc+S/jTVZ5wctx8883Fyanv/+WtI+f+4rmjF15UKQzG0cESQIngw74HGNbaHA4n+fwfHWbOFlVMHMOlg/J9dDYACpr3AWD7lOMBAFoKfpRPPOfVEyTCo655etNVCkR5p6enbs5DsrCnP448OVsy+TGJcr5aDosr893jd9TKS7/6n2572/2086ksfSfHh972hcsGumMfPHfkkhsmBreUXWk3tidQchQgHC1ywSINA5cN3YZD5xHR4c5TQV5Fz2AqUYifgi/qE+mBK84xQEnGqkBG6SfQp8SJdpwY/CxZmRw9ekV7yNvsMCttRGE705989Rf1hN+6s2HqEBa37//o5978HvJ4KsqGk+OWn/vLV+wYveBDzxm/8nmlQmVNeguSHSHJSasSJDk2OoV4chFrOgU1C2sfJbjvCWL0frRF50b81fQ9SRN5myxLVvV7QKRPTDipAPmeVFFX1y3BpTuQY62kVpsaZ/RqA254qOIoYfxod+/XqAGLeKRfKiyszHWnf787/X1v/b2vXdskzpNV1gzuWsLe/wtfuGbzyFl/dsn4cy8vhOJJ6dxxCt5q4zmn0zmg7nFsOkJiPxUAnhIBzZQQ0Xns9j5zaEwS8iYOEXL07lx3Pp2sNjHx18uL1OwnCyap1WR5wlG+LvrMpnzSesJLWk5O1D7TS3YQy/WxNkaRxlyY+tDH7vilX1Hnk7A5aZBd1sduvm24O7vlM8+dfNGrK8XB0+L3BIAG5RKEfbQ6w4HD0S8YtxYJBcHwCLPAOw2d522QJHq1I736Txm4yIMypZ87P+NNORBksoinAPbiAQr5xHS4J1OkZQ95nIaefFiyAybyifTs77E56kX4QpidXyhPv+G/fO7ffFpMzuDmlMF+7//21z/23MkX//FkdXt1vTLTUehOc+f0JEku4HQM/jK63CgQnULZmePoKDgPMDrMHMd2pFOy5fgJJ09Px5PO6Bm6HsdHeksGcZeMdCZEe1bRAxATGvjJTguwcQCNFt5Gq1EjyictPwmW1199QswdMMZDVNRDf93uscLhr1YGHrrpg3/zwToozkgpnozLR3/57z/50rP+pz/fSGLQabiUYSxReea5M9lRcGAUzF0aqkJjCViFk6fv7Yt0kV54kTbpQf7kq8LaENhKcq3T8JJsNGI7oydiQkj0iXuSYwzdVqd3vCgOFSAZOyqadbEVGazWMyERnfRw++bOjleU6s+fesMPv/fFqf8JNvKqiRVPTc9f+Cf3XDHx/BdulLc7gaOA2lDej2jPdML10ZHEfuzFo976jMbg7DOHiUa4YpodaS4Lyho9MOOo5TzMDjs6xc/5oCPpGunBJZsqIl7SAHztCM/pBfnpqJeukT62e/SnXtQ3ycpspY6ub6rpqcTH+08cWZMM4DYKjfZUed9r/+iOd3yGPJ9IKeWJIaSw7/at9102cc01efj62zQmdzDE1DNn5LmgIxptUNChwa3AjoojJ2VvvoNAEtjGsUUvUCRS5Udfnj5SmNREHgOB/SSUbROmAFgzETi9VCEUMviJIg0PNIIm+RxdXfNEKVzK4EeFSCgZL8f12vrzW9KXusVitT362ude8rJv3/vYHQ/m+zfa7kmOnXOv+WssPF+2USbEN6N6zZaxckp0iDuINZ2GSk4XAxqdo5cPwBVIhlNIuNpP9CQ2Pkyl5FzSRXgPPWWyx0VJTqRHJNaiFyPyFk9gUHEW8krtHE/p5jhEcnEGcxrxi/SCuU5kLbjJykScmp6JRFzcnlAY6Az+8wsvf8mn79v9xWnp2scmrTk+8JYvve55W679wT54iESBkRV0YsbFMz85PXa5g6wfVuUcyj6nUxBBk9GTuQWKrBIecaJg1bEj63elIn2c1pw/eUmuNRJjxsuK07Mrk08FHCeab3okwdYrameRs5W8vJjeZmvGNUfviOugL3cHyhP18S86ST91So5zRi76cAEZ1w8T0rhhoicXegpfqzKvEM+CICTrZ+iBYsK5jUepiM1Z6egTW/JzeuNtW0Lt43LIQhxQG3/u2g4TTnoThQLyRbKFQSyReLf0BzPC2UFK2zoGAaQh1GoxEI26UlIbDmEcXZOGkY78MnrmkWQB11FJ57LMeusi3kh7YufP3njL28iln6Lk+A//+x0/fvbIBeP9MCCNFFTD2nbaBgCMobk02nCocr4ATnNpIAq3xEv8BI30hil+EZwq4lOO0XMxbIu2hBB7TYrhZX0m0zQ12b3yzYITqZzi1PSixkayo515Xg7XaEQb17KfTFDcTtuLWzAgDxuATqQfbI39qx78DewoOUaLkz+3AZqTo0YjGAsqTF9AXX18KHbHywnoyQ+rzjg30hq1gk+mZjzxnI/TUIqJxzbPgByoCEukJ16CqUOd2BgH0pvWBndc1j3tjAIthYgEKHHkk2yJFWfzieEZryRRfH3kUC2dKa9X17z8vEihm3DbGiFGj/Gzfuqm94zku9bbtmmlXH7eeglOhielqZB5XmiKEX2Bwn4lQvR/BPY42xycc4Z4ARM1g6Wg5+jlYDEiTcSJsiJYcG970kSVkmz2r0Uv8Y5MpJxso+lNlkyYEXmwhRvJjYUzzdErkQwuW0mUUoq2nViI58ki6yOS48YDstAZaf/kidSnhyg5horDPWctpyc7EYOJQAdr4zvYzwxllwBEMriyh3sWd9FzD3DHXU2fcCKeAoi2WEV5PkpRS9JLHbbTdEOJFOPRpkwhkKs31aY9oifvuIiV9iIBUezU1GkUZB0LMKmw80ab/FnMDtKzDRn4eK/QDSvDI63oqQgZGFtjTYBRka/Tix/2S3PdQbHb4EbJsVJf7PsOahlPXaN+rNwhZmwM9FqKRYPZJaNglfhoB2185DQB12AAuDtWDjNPmXzxJH3UB7UFIOMjZ4s3BRPBFIimmDICyaqYTGxboX55W11Xx0isXX8lo/eSB9rclfjMVvFkL/qkkpCIB0SWWJFU5NqPjAAxnxg9cSuVdEeFyNe7UXIs1xbBj8z7K0YLerLI8bFmxtdl+BVFSqNdTu814SpimdE7b+LlxIjeA5XDdhbu2ignysshih+xyDeKZpVvW94Q4sluiSc8gvHNqJ1SQKKomH3A0wjkONinMfrLYJGCKqkvMrCKV1pJEIv7Iw+13m5oFRu87tHXzBCnldHqzOJRl7WxOmaxiNiORwcV9i7Zzn300QAeYSx5AwUgPOK4IyOiOTDyFgyoPTgAkq94Q5b3SZIpQASU6NQ16Nnr+E4vCvGzTsKFg20eJwKJLhHWB0wikx5VUt8Y9NKTLhbiJt7CzXlKjAwx4UQ6okbWib4z2PekgKRCwcNBxb3HdodGvY8f9ORrU57KulMYpMwkIVmfNRNe7JF5wgcPlkSv3Ygl/uqWw2PL5ABF8hkGeMjWE9THsYzE9/OONbmxn+jyMjekX8WA/K1HtW1MjuRH/LTuwb5zSPqJPlFSTNxBI9HHZk4+OSVuTkOI2qztS2ZMxE6hE8bCJBYdkf8GKyUHaXCdI+yZfjg0Go0NsehxHijlUiqJD/fYny38TGnrMzGr6QWlj/BJCaJDjj3kZXTaYifR5+B0VoJTD+KxXkVPXglP9MQhzDfalUzSq1e8DM5too+gLCmBTf6AG2tRyxdqSQgZREKvqBRlAS79HC6jyCsyjYSZfEmJMo0+DLVCOVScw4brlBzFQhkPDZbC0dkDoVZfWRcjKSadsiARJvPMA4mPGyGfaGOOlS9AkdGZt7jvNGRibcNL8Mgn9dNvCWYOitwAN1XY7zgOM32BoGgkil48dpugDI59wSLcKtLHZHQBgEAqu42WcOoaYWpHXNNNGkVckRlupEl0ogeQ8ERv+PXqctgUtqAPnW2DbXSbkoOEmyqbw0pzGQlyKCwuLayLF0SjmOHQUIquJnTFV8MTXaTP4+kIMebJcMOPQEntlZenlyIn0FODHH0KkmnWS0+/Gq7Do5WGzG0MiJufdXirl96hqXaGsfbd1E9d8efyM7i1XLzJt6SnxHp1MWwtnRWRUD3RacU4hTAxuDU0OrUwNX8wzMweC63W2vewusJUkG1zQ9RHWpuyjicjYYXvW71qJCB5dAb7/Suw4Jmj2KdpJ+KZZAbUcMSfevBLTCoYdSWu6A056UQ4i8n1OjeVraInU2ipD/X2YrIpzmywPtpqPIkX1VqFYxx0z4cQMvrVtpJ3j60Ugr/G0FLYWtwZbYp2n4mRw40br2wJA6WhsG9+NxLkeFhaXozCHMNrOp5f27pTM0dRueg1GQvEnBOdVgzIQ96LOGZrolefI8aaDsqXJJ9AlyP50ck5MFFW0zNi/JDU1Ta8XlxnTfx8kfxVOglXburFTXAy4A66zUbiESAM26Y+gFOxZPPdNk5ZuyPtsLl4tpRPax9H6KM+6dWRgeJgOHv4gnBweU+YbGE0qU+EkeHRMDAYL7ZBd15wTP5hQ6lsP3oZ3IJiRtMYEpgTaDpP952eODTI7yVlB7pRGQ9zFnn7vprcVUn0vAczMnf6PA65mj5Gn7WBLbqMH+mIzz9jiQbJotJ5Xg4jrnBEZ7IEAoN0hXUteuBHtY0B9slTX/JarVuUQuXqg8thvDIZ8DM9oEbDWkT0+ZmaVqJmqdo5fGEoF8vh8fldYWZhGvc6H9dU487oOcLcaNR5OJlB5ciThjJRbD+P5zDVsYM+sZJxyNPLaY7hcsXbKDN650PxmXzychwnoyRB0eG9rr24AO66ppERHa6h0Ud5bmAPgxx9kt5L79om/qB3/uyj/EYJlx5GOmHbwNmhgivktENi3CDbc1Ybrk86cuQ5VYrVcM7IxWGhORsOL+8LO2rnheHqSKgODekMhwrxa8qZZtm8GY0CAnt07DMKdBqy2p1Mehaj5qgCVyhahLLt/LlrO+zP4xAzK8Bhv2i5RSFzgS15daVWPIgqjESe0aGlPvRTZdGjmdrWTxwmUpcPzNufyQTc6Umj0dJ6Ip4xNBxwiPSGR32dH3UGf3Q0i7VQwAC+ubjNZBIn6mMGYIcyKJClzzXHupLDJIQwVpnQd7k1Hw7P7A1bls8Ko9VNYWhoGBdoyzKZRpqhTkW9MV0oLWSDuyYhEJ9mMHHojNX0RsVESiQ9DcM3Dmz30gPOrjil5QlFId9HR8ZkzdMTh/QMVqZApojrxMD5zcp5etKSB/EIVzvyZEWjyY1xZOD1IR73XQyJgFevLIdypRS2FM5Cn7wlnnl5pNOzNKKV0L6nlQ0lB21hGS5v0hfvlwh75x4J5flKOHvT+aFaRZLwtUo5w5KxcEvPaJIsN57Eow+0VSN6BniZ8Vk7gxl9dLE4MBySRbfLP8bLdSEF6alC0lX6mAYn0hOi+ERd3JaMnvwyauNPAZSc19XbqtkZiXrEOw2A7WIrNCorYbg0FrYVeBYSk4KEIiILY2KyTCewQDdHIrb6K30lh4sqFyph58iF2p1ZmQrzszNhbHAi7Bg7B78EcnGEQo1VoZEiEWHReep3y4gbjRbcUOM2ejLuJQdjn20ns5CY0+xBACPopaZqEBqJrB0ZR6XpdONlW/ez7REXrTXoXQ+z14LpnPO1dI6yqEd0FWaBtkaJSnkgjBc3QwtczELJP9hFXWibU5E2s89bUb+nYlqhgicrvIDGL8vUwqGw0JrTlLN9ZCeerMVymXGIT4PZDgBIFryvQUZ63tBYBsXPWuhA9vEkJDtqyMyCrzleY767y5yUQhLpecD5r8FyqdNTYXRKJsfunhKdS7cDJwWT4vH1Ih2pM+nJl/qqn/TE8pFGkoXjeKypV7OM19EVV8JguRomYkKQLxmY3rmRCQKYKNSZJb/OIYRSzAumS79nK09o5KBia5UxnFbxy1Iul8Kx+tGw0loO1cKwEkgvOZIV5nwaKUcQpnnXTKNTLGnkYbSZNNYmb7ma+4YECBgwiNZKPD2oWtAxS1KJwSIZZeFj6wZDkCixjDKTnMTAGnl6JYjhu2r+Ipdc1oR2oRXqpZWAWRhTxqYwXphgHqCYTzwxomSCk53SdZUv1E9y6cgG7SQvVE/3yEF11ip4+DqcO3Zx6qq3a+HYyuGw3FyE7oUwUhwLg0gaD6A7w2sSelsO474sdqjtOyyDkg57BERgotdhnWEKLlSH5WpvJrkmLzF1uNPn8IlDVfnraKO4jHsr8EMYFu7DhTFMF5Po81c9SFNwiqOTZQn2ddigtlCbTGRiNIgtHQqUGcG0xew0AHPlGTVyQJ1coXZZGSxVw87RCzMAWniFWpitT+GlAsuh3W7iqS28XTQMhcHikOG5s8jKxms0bKg2BO3KZ3JJ3kEYpjwpiEtWNgAYvfDds4kZ8aLHdWppwTPemaw8X5IyUA1MDa0Crj/gVyteH6qWRsOmwiZI2CKetlB2/tQFejDY0osSrDhvaiFN0GWDnvbAy0ZAGw0JS/kR7TOYts/UkUNan2YzXB4JeN0kxlcLgq9N+CLZ+doMpqTFUGuthDYXHvjDy2dDsVMKFSyIBwpDMZDmcHeqPKQ1jjnJVGA7Oi0mnAUmyk1JZUGzBaD14eW1oYmg49wBHNqhgxdiMqfwRkToMIhEroZqETd5g4evESjKT28lX9llo0HSJOpBvVx3k0gdxC7zXgSo4sFBf3gBQ/Jkn4OVODyY+rxC+qSsOVxf1lRwPYV4cmrOwkphIExWt+F2lW1yHJ3nDvQFK942rPVMu4MFHUYdvpO43eG3iTyyNnE7giGoCgaEQJ5UY41dJhyAWjxji08hDCDwhU4xVIp4ZS7ui5B8hgB/Lj/TKT5AzU4GNY5wCjQDhmQ6tgO37OHGrPHDJWDF9RSdQxLo4bZZ+tjaKfWBn/ebCaTP0VAm+CR8+SoyZ9VHedKTg/qerjBINNydIiuj4Uoan0qAR+NZvFnAumWohCOWr7Ytx6OWjuGH3sLfWoFkX/qCn+GS3o5G7yNfS1owcqHSwDbo5dLJ6NmWTPBGrk2dUwsHL66Fw+fVwszOZti6byC8/FMTiU2SAQjbZquPBmKqBLaEzhLI/GXK0E4ypFhCRM0d3yPyM3daoaKnLtGfQJKp9IJOcUUZjfa2HMGjyFnKU/EoIyzrMI9lgNSpoBDXvJzwclzZq5JnZ55nACgv9rBCQpFnGzddPX7JUth32XI4eFE9NKpZVM7aMxhe/mcToYg7INJ0QPnkFOcB8kjFulyK6So8JhJTwHB1QHlCO3Gk1S7RnrHTijLYtT55bXGiqTAbTuJXbWzcZxpGkRjmU3cSedqYQz94vEXkDJKLBRASr68oGJFAktmNYkFy55t8JkMaIaJuXAPxGsPB82th91ULYe/ly6FZ8SPfeHG7IyZGqQ6dyR9ydH2HwaZ8LXqhQV4+jfYuMtE+AEoEw/VRTojgLPKIYjYQD3yyHCWndZcnfVpZtyZAVADoPjoFn8x442IGs00nMwh0h9xtWzTpQxZPJNvzreGSymcqo4+yQewyRM99fuhgEqjfRqn6QDPsumYhfOcF82FhfO0boihVifGp8YDbLcDJRhjqbSlkPKm87NEuNizMlJ4RErCotLrQpo+oH6lZ1OIGCPIMRzT19Ld50pODTl5fMVPpOD/dswSxkaIn6GkHnOUwYDKAsbCbQaZsJpgHmrypjhJA3gNBJDPpRsN+zfPg2W0zCJaK5LW0qRW+8ZLj4ZErF9YcJVwH1jv2DITv/9RYKDExos6mE/hCbqFQRM3RQ5pFWMSlXlFHVWmf/olKA8WSw7WPJOqPBOT/TJ1W6KTTFQbMriLGMBhAcYv+kePIh47h1xwGBwBXQ3T0V85v0XEm3R3K/kTvioEHg8TA8UxHBfvChSCuCVbwJvdvvuRYeOCFc6FVsuPeydeqdzxWCd+HxCjikkeHScYjHfyZdNSdXxkYrZRO7I+jgzqjTbTR9Tcis9vsQJ/4G09pJuckAWz0VZ70kSN64JTKyQcMQnSc7VvQNc/z4GI/uKRjhB2AcOuhYjANT8yES8EaPYQd+yOty+E8ziNQ8gFUG9R2PaMdvv3CmXDvS4/jjqv1Td7bkRjXfXIUUwk5gR+SC4ME+GNjqpmeUpin0GbB6lHO1iKkk6bAo7Us8eAgd4LYHfmyNwHpDJb1qW24ua0lhzPJdZy5pht0Co6y0azsUhcu1OAQ2qyAAcSfnwUDnAmiH7mAK8cRRnLh+wbo8aOEYj95RlytBQFiQASTd8EVeJ12G0djJ+y6fCHc9X1Hw+LYydcUYNFTtj9aDt/7SfyDiAZ4QWfaUKSeYFwAT4hHXbQRRDo5eTQAu663iOUbAGUrk4gcabf98Ebd5QNAWeiH1fdz4B9TxUvNhrPe7VMwcqxXFTM7ek9EnC7MKXRI9BKbKGv5lej5wqRgobPFV3tGKSdGAnMuxgnu4yLakbNq4e9uOBiObauJYr2bbUiMl/7JUCg0Wwg+VcelNAYLIwbTuRsvtFnKSDEzBE0umSwpCIp6AyhtpT42tiee6on6G76szLsPbSYkkrNV7GvsUHI08I+o8GjUk1Jo0noKTaORdKEKDGdL8XImrGGsgmmHiCEASJgFgjhCis6OLnd8dNtFJcApgwKIzqEEFPdcOx2+dt0UfjV1oQCvo2zdXQov+eOB0G0gMWwOAV+kQ9SlyJ9fwZ82mq4xRSie8tmHhl9ZlUj0yX7saL0iHQkjH9ghKtOTW8Jsz1tmX7vV7iu6IpqpH6vtqJ4L1me+0KjTFeHAKk4V7jwPsJPTSV6URBhW5Q6wtxEG9Fz0AeoBp6eIS5eRXAs38cHZR1z4SSaYL4y2whdevTccOGfj/5Zt6+5iuPaPcJtkDdfGGWDYoWSgLOpHmAIKbTgaaF+ocQM8FF8UJ/0BM3vUGy0xfuu9n6NWWAyL7cVlcthoUXKMlMaq/JGLP68/HYXOMOcxgFEDZQO8yz+1zSm6zzI62k4wLfB26mm4tno3nmSgIwxHHWPFAExvXgmT07hTjesNJMkjl8yGL91wYN0LzryPtuwuhBd9HKekHDE4jPPDNQXOegr4n5SaUrDWwGsQUiLQHE96KIQdasbixqNpyqpSF/dJBHz5Cm0bAdVr+GwKhw0bCRdbC/2eydpkgn+zWdy/8Fi4aPwKcj2jJWfuKfn60SVn0WHuKB5p+KQEolNkePQfgstFJdG3XFoOE+eX8Q9DQ5jb3wyH7qsF/P6mQnqmx73XHA5fue5AeNVXzgmXfmc8fPWVB8MDV82cUreTdW55pBBe8AfQFYlBLbmYLnDhiROQoqYWi5XrzxEO75DFzzX0Cr+W2JYbwkp2mkyDsc1Qm8VGxz22lPLuLtTuJ/Y2C7XQWsByAz9491M0cpD3Vjz7MFefDuN4HPLpKTkLlf3mDuqiXGHND3boMl2PoDPwqY6XwjU/Phy2PKf3ifKFwyPh65+YCcf24mIDytevOaTEYPtLrzgQ7n7RUUwnG3urAGlZNj8SwvP/C6ZB/udZhgkR5m+5HLX4YyBBLNSVpYik4AGgRIj/kSSPBzPUL2RsaCcLt/xmLtEe+s0/6aAiTh4X9DO1qVBs93kFDLx4ki2mNKzWqOPn7/U9QE26M1nMFzBcXjAHsGlOYwWnA5AlCI4aOKgw0ArP/xdDJyQGdRs7qxy+781bw5aLKuGeOGK4zuTTd2I8HMI1/7mpNQZvGVCgYACPYgs4kgC6azFKmD40jXDuWdFIo6YZmiUE7TdXqOEbMkVRhY3wDVV+kteAQl9OdQ6EsKhjv9/LHJYcFEKGWHuEuZWZUGv3tX5xE3pqOmM9xQIPzLyFaCsZBEQycLUuXeNUAvjm66fCdHOPOWoNQWX8i5ju9Z3w1ev2r9G7cdDkw93wvP+E0abmupjKjBgTg+sNTin82KksWnpcA6OKxDHBEWB+cq7J+4l9Zrkq4DHi+GOQCGKFTQ+N80LfTGcqdI/jnpGIL6I+Nho5UiqDwWhpIswu4rHHxrE+2PVHYk6yIyx6QYcHfaCkQUOGYkymvelILeHoHVkMMzMz4eGHH17TGV/91qHw6wN39qfYKqrJhztIDDxthjN/Lgb5YfEglzhd2B+HDcHxr9QtkNhnm/ZoRFHAjV5ESqw4GhhXucLQXI5lgMmztnRAkxiEHGntD83jXAM5bzHra6PkyCcYgzBSHsfquxMOLj3eF9ONElnASRVNgvVmOv0KI6Ug+niwYvDmCMKfywsVDOnRCWslyFe+dTD8avnMJcZVH8PapS4NpBO1ZKBY6/ELPILBuoCRgjXXGUTgWQvvLmNiFJhAMW4cWcTA7VMdvRcdkEJMQer3BLIeyiYc//E6HMKjqt1Z8sxHIHHIA9fVVnLkMakDC2+LG+2Ohz2zD2Ka2fi5v3FZ/9bk0lQaS3s5kqDYrjWYCro+wVPQTmjO4wDlHTax5BPk7755IPxa+S7vekL1xK52eO7HcLUUi08LENRCwOn2gpKACWEjQglwW3wyIZggfALQEiMZQxzQWthgsYy32trsRC9slw+ovfa5J6mi8QPjeOdomJ45EgpLtvjUAUUaFJL1W5QcpoBxyTOjkInS9rCI93PsnXsYC5v1/8bQj0I0VgbTKXCYn7LSIf4bCOs2EoQ3/PJC1sxd43BgcqGmmP/29YfDv63cfVoV8k48GfLEw0yMFUwlOCXkAhgfhlZjAd7gyEQocsrA+XMxfvlIKL9KDOLCFo0a0S4lBmEQKs3lelgOfyedmDCAp9gSMQZHXWgvdRfCIYzuDUwjhRa4kiTiiFdGfTLzTglPp7LCiowThRTCKNIt4610m8OR2YOhW2qHs8fOh8m2Ek64azTSUbBG34kgOouu4LCps3e0eMqKgNAb8XoGVWKQOLXwTOE4FogjOydD5YIZUOO9m3gU4B1DD5zIfhVkaep4mH5od6gMD4WdL1r77d7jTIyPLuvWPpEzoJwWmBpICiUEYP4+NSZDidMKRgotSjVtMNF1DBoddNRJKHxNuBbZYCnrYb4HPrpC2UGJCo0ahbDcWQzHV46EsIAboBGHfEKQk4iwNY+CqQQCsMEirZ25+IKBso7aMFb8skDmUAGPEHQ24Qn7g2HP3IOh3jkzZzXJIRBiIweEQT5Fy1S2oy5MFl7jYALpDnPsP3pHIzT3j4clPFv6tu43pe6pNkyMow88HDqtdmgsreC3trW9t/mbGCmx+DT/2LTBcYNTB59J4ehQ5p3peFCJa4wy9hlwjRqomUjct4OEoaI7zTaOPDSKttNKysj8QBgMTr63w2aucywcWHo0zE3PhMJCJeGbz0gDTmJLCH1mX+vZ+Lbn8GcAXJ9oSYwOGLMzlmpxOAx2q2Fudg7/BHdvGB3cFLYNn41eWepo667FORpFDrYPZ9I4AOx3EJrLYd0MtkUpHj1ot/RIwruO3B2+eeTBUMSrnM9+wZVhYGTty4KeGGZPIWy97MJQKPmR3avyYz82FCqL3bDtay0bCThV4K2LmkrKSA5+mBgcMTwxOHIgeTzodvQyaLTKrCvwvg7aIXGEWXJagliiCBc0/FnjeONoaC4zUcEbD3y5vyIDceHGQsQkA08gUYLpkVA21Mglh6makiAy11HjXZG1YGhz6BztTuCcH3ddLz8aOngYePPw1jA+YFdZafa6Cvj7cXXi/RyWEHQf5XLU4Glku8vfMrjfCv/12m+Eb4YHJaqLezE4Ba1VVifGtudeEkZ3nOqKcDfUdtiRX+T6gh+OGqWK2koMJAdHkvx0wuBQAx8xLBUs6MwRJjwDqRhSVyKnAwsJgc9sC08AruBEYBkJwUvymj6yJCIFgy9StsHQ+BkrixH6HYEEGyxKjt7s0rGZ2Fjm5yVY2xPENOpiysGRih8la/ONMBfwNmS8fWZ8aCJMbt6iITcxPEVDnN1rwLNfW+laDu1ch0RjgcOzFf649Rcvvjd8s2uJQdaTF54fBsbwHMuqsvHEMAYVXDC2i1pYdHKUQJLweVfCuG9TiC1MOeVoTYLga9pIKQ9e0D+NIh5UGhyPoEZnRSNEvY4LbCvg1+a5Dm4BoK34xAySUiSxH916o6OYKPF8isKORiyRbXij5GA8+GVRoqCtJSHhOcVMKSAJOSaRlBepNlSXz7kOtAcD1k1hz6FHw0oBvwxWimFyaGvYPrwTMk4cximHtJJLTuArB0TdKNtGBCRFvCD8Dxc9Fr7R/Q57VKoTeFr9fE5vvaXfxCCXQSYHp5N4ZmKJERNE04wlhl3fsBGDicNAUWe61dpYfOLDQvc1u7Uw2zwWluvLuAwPGQ17Co7PCVs6YEtE4pOLmuDIg8R5o059hip80ZBE9Ozo616f7JSDSYGDEcWU6s3JbDQRHuUBn0lpIzgBorSaSgGR7uHMPNoZD51aF8Mknu84jusmBbx6YKAQhgdHwpah7WFsAK9rIC98JDfSE8YOJaw4C03O5fTyPY+cF75+3blhX30/fomthG1XXhqxsuqJJAa5VBe5EOW0wVECX6wpOGLobEVTjSWOlIS+Jdltow3Vpxd4+j3XQiI0FkKjiWdtMTgUG3aWUcSZoCcB7VW4FdTMBouFHzaecmJOp4mG8RA9aBM/sWBHfz++pTVHiocCAjkUQmkq8SiIMAZL/ei2tmGlhIr9hJIvcU13/HIJZwx3x0J3Baed+B6ZPRL2h32Yhuo4Ort459VAGBkYxa/Dm+0p+0hv+ji/eAQim3/s7ueHD7zwcNh6xcWhPJBdEKPsdqMZpnBWIiWgwenXGKTqLQMY/bTgZCJwOtG1DE4pWHcgUXQNQ9YhDXC0LHbn9XqJegu3C0B+B9NDsUY3o5/+wsggXyBhrJhn1E5N4kYb6XMSkiq1zae9NMaNW48PsGIEn+DIIfmRlVhCF/6QlJTMpCYthGeE0QDrMmPs6KGCLLZN1htMQCQEHKaflnmNDUPsUncF3wNYdDZDHaNMEy86waoMgaBOMSB4wLmIVf+nvueeMLxlSxjeai+LEWPfwEtFvDymg1PVrZdffJrFpxP11kPzPBOxKaGN8b+GBS+nu04DZ0pYZOFSixaMRdyJV2whCbTiJA/oia/OuKL1GefoEwY7Aj35tQt4r6cIBSaBLJEoT6N2ioWh9Ry5EbSRKo4cNnSTN9W1od2HsYydgi4c4LkB0Qqt0AETPYKiezLj3dayin1+NICl4ZGPty0RuU/5XFfw7KDSHkLyYA9P0PO0tYXgtPhEPYbnu647FKZL82Hnc67OlMy1SjitPfclL5CupVWjSg7tpM1XTk2E8Z3T4fH7DuPfjnCkiFOLTn0Ret05R23hBC6jkBjyneZbY+t+YkLJf7CcRVv4icmjMUKHO1rsADv6gUX02NdJDYGxo4c+4hoFtqSPA5PJTD0basSVIQLjZJSfNDRg6sNuvq1eB3hNHBpAY+kqGWqdfoonOm4IztHJKoLkACaL+VyXzokfvcb+oztr4d6te8LmS3C1Fkf2yQqve/STGK9CYtx83cvDm9/3o+GSq8+GZKQqF9JKADu9lUzYF8FoUGcmAYE0jQedwYgrl+QVFS4TCoXGsqJDok/Iq4deGPkNsYkTYZRJPvy6/Dz6BtvyqimkrYRlPKKWCWD7UiDB0KA+3HAbjbRu7meIMpZYTGvC3SggGR25oENwtrhExX7kIToEp4VL+J/73gfD4NgwppQ1ppNMZF+t66fGw79DYpQHSmFwuBJ+/ndfEy66Zjv04t3kvC+UAWXic0t7pDW7UdwodlgfoSzuCz8LM6jTu5HC9C6wiPAcvfvKkSSfzDNU61q97wTrrJUcbg5rmUs5ssR7oGJ+P4INlpdkDiOkt48mgimPInwkAzyEI6Euhz3scPoIp2yMq/zw2ZLP3/BYWKothMmLz88LP227tXL6/yPzyqObwm9c9wolhjNkgrzxva8OF1yNBEGxO7zyOkLPzARgQFPqHMFoWcF+BKuv10eRAXHIgYgohKqJDUeIxAs9jiO8NHzk6CPLOMMQbUPFRo6oCIUlgWIcVfGK/fiYwpmahLGoN/IyQ4SpvkST4yWanEyX7zI0T+v8Wpx1qv3g5dPh0eL+MLJ9SxjcNCre69mszMyFA3d/Oxzb/bjQ+dN/Cxec6gtLYeXYTFg4dDT80NGRExLDeTNB3nDrDeH8q+yKavITEGRytMPhTHLZ4wxYG6IgwosBTd7L+cKnE5FEHqIhwJwZoWQL//g3xmJN+YlifY10KpvQIdiUMIgUV6TNBBOay0UDJ3I2RI+avyd4t9c0zPtFlDq0p9NBM9Qum/N2Hk4t+qm+3A5feg4uejW7YfKi84xgHVsmxtFvP4Tk6oT5ffhHQ0gE/uiWL2+8/Lpw4/BEeOzxR8Oll16qKSPfzzYT5GdvvT78wdu/Evbef9xswxTJQOqwBoRTC+NnCc4EMV8lm4Gb2uCZb1NGlhQcKSK9fMbeXL/tJf7aZT++8l+u7X0brTVykCgpSctUvI57EW7HcETJVSkNgEcFwVAOMg9m/MkmsjKZQs762ekreOlENQBjYP/upbh3oV4LY2fvCJWhak76yZvV+5dC697DonestRLjNWP26uj8DUOOn6+ZIP/ru18RLriKbwfMDhI2ZbGMMyN7fRX9yX7hgCtr2O8BpZwUB3JzPOvgVjDCzW3GU0lERwNoJNawXpH1tUnJIcGKpGb9HmZ5JU2p2E3pOYDwdBQZ3DmdlL5Hil0hpXX88GV9HDEYAP6GsjzcCveNPabL2JMXnruKcu3dofuXw45b9oSr/2M9nL08EbbgR8KzlibDBUcmw6W7JsJVd06Ea28fC1fsqsrpzmU9CfK/IEHOv9JeH2m/GiM7mCC2KnVWPYFPwNiw4GF0wEclVrYDx0bf5v3nMOI43Gv6Ll9yocmD1922NYcrF8lcGEV5mzHHnvaTUDTYn4zL04NY9NyC2Mgzeucr+h6jcI0D+5xGtAjFiEGcL37vI6GFaxtjO7frZ/ko6qTV0ANIjFsf1xt1KP+KjzfD1R+ph8s/XgsX/sVK2Pn5eth2Tz2M7GmF2z50Z3j867PglSw75U3LFDo4XA5MkPOu2gz9qCOhZrSdY7FtvjGunCLMX8TkjvtELuJeFJ98QnrHgw0UwX3ikbOmM2MWSY2H6CMu8aBdX0/ZKzn8CKd0MnMtqasrQJ1OX8wYpydzs5dcexkkmZGp+pEIHC3oONZMEH6OTa6ER4p7xW3TOWedVo3hBxD8W/fhjTrgJX/Fn939h7J4TwZ/ALRrF8Vw24fvCnvvnUsaU8jpRxAkyC1MEIwg1JdnVHSU/kw2+aBlcO5Ej7BFOIv6sRVtgrKHyueSgqBcMfwMYLIzuSYKV2jaWKz1UZQceOW0ThRFT02hkylsRrkSJ6tJZ32WCuJDmMPZAFMlgOAAUIYyjlCTpi0SREWORmpgSvnba7mYbOuaRrl66ud5mRjnvPeAnkSzC1fY4ro7fx9RMuCCGRPC9y1BkKoIwm0fvjvsuxd3LZtXpcZ6EoRrkPOuxOuquQCPNtEknW1pn4vWnL2CgT1q4ue95l0ULs8QEHGMt/ORelGeUFLc1AMaI0XdaJ544mHkp9wqOaaXjtR4JFMZaRqVISWNMu0ZulzJ7TqKKy+thNo79JG9l4QL5pJBY9gJZrwVUB+MHAd2LoSD7cMiGz/v1KPG8Hdq4dzfPaTEYAKk+zz9xzIkCO+/KPFHNPT7neJ2k7CNLp/9SL8J8kokCKYYfPzONflBxvUGlAYn+915tJDRVPGa7iACurT1zSr6iJPoySfKbVXq+Llqpa/7OZUczaWmnrJ30aypDA2Qvq70aqOEZ0HtUR72OInxQC8RSM+PdwKkS+Po41GmH6lYEwcjB38w+8LVu4CP14dUBwLv1zhZGUFiXPA7h/WqJd1bEacMjgx8mMh/cuevqvY4AWtcWtcPZEgM/ZLDRC2G2z/6tb5GkJ+99ZW4DrJFKipBYIsW1HIODxQ1zDnyBVABSj4CDH+xqMP8RYj8wtraTBv5kWgJy1Mp4oCmjh8x7UcIVBssSg68Ma/4+OwjRkqDTmDiiqAn0z5h5YNNI/BH3a0QH19x7elI5MDHCgNoXGfo4hRHDsC41jjWmhbi6PaT3843+mA9XPC+ozZi6C06fFSAN/wi+PiZvVwa0N1b1uZ+Rfu6cSfem+HTDIVR9b/+6NfD/ntxp08yZD1rEF4HwQiCRaqHjLyYFJwsZX7Ou+wzv5gUT5K8P0UPPBbhEoBifLO4OC/nQZx2GT9ULvD1D/2VRNea64b5Blfs7g5PEdaWFIKYhTDU+qOuovONYOgXCjf4MqdpHBOBJdEDmXD8gKs+uRE4XGN89YWPoTb8kbO2OfueevTBRrjwfXiaHItPX0uU8Kupbt9TYtjd4UwI3oNhXyaIJYklDOA+3aD2A+CzH70n7P/GxhPkX77n+nDe87ZqNLSrvHE0lP30m/lEduvgEQRi3ZsMusGELUc6GSDRZ/Sh0dC3Hjc2bH+pjfVTC8gpyujbQMnIwP3gkb1hBQ9RUxALVXW92HDV1ck+fiKyBRs7VDzCqLjzckfkBj6bUuJS2E5dbZphQjQqrfBYZb9EDYwOhwE8X7K6MDEufv80Rgz6g2sMrCUYZI0YHB0q9lL7uF/hCIK2EgWPFGTPm9g9obY45dqDvDDRcIr5yNf6SpA3IEEuuJov9Nd4GH1CL3gx38lvALI2H5pfiSV/R2eKblUAyM39LvrImu3FCp7jmec0hUsDdny54HXXSg7Jx6bQLIW9R3BzcBvPclBhsbEtm668W6hAR4WVwUTFlweANbEVc4NzyuDHiyUP5Apui1DhgOaeqw+GNl68xjK0xi+vYw81wiUfOK4HjvhDGJNCIwcWmxwNuO7wp9AquIXQEsISoxJHkAoeLyCcz5uon3CezWDfRjrTlAmyr48phgnC32LkSyZJtD+mC/xkvqBP5D96ByA7gLI+OVR9gPEPSPwanrnY/G/eXcFd0e3jQrVOM2PD22zksDzFnVil8OjBXWGxybfdUEEOcaaoo7gUquJ9qj0ppHjMfMFOpBet1hZmkBlNB3K90Q7f2XHIxYSRzb0/y296qBme84FZrTHkSh7p+DIpdI8nFpplJASToFLJTSVKEq4/mCxMIiaD9RfZBo/0XEpMNvJl+WtMMf0kyBt/54ZwAaYY+ofrKrmUfiNTbHyadV+zzvtUSRr9n09YklsBE/FlXQgLpWOhcQxvH1AM0MEjtc9iI4eUlaZgg7kbp8WHDh7Ec5j7tJ94A4WFpkXzbF/Kk16dgnEj9Eij/WikGY8O6o4OO2PhOoM/ybfD/Bgeb2jYq5h4N9fgpuxRg027WuE5H5zLTlcZUBzt9uwIkkPTRlmJwTvGeZaiqaToUwpxOFowQThy2H2holebZzY2PfFo1BEJJXmc3q4E2eh1EPzcjwS5kFMMEl+eg52InpLFgg84QfrQU1nJuU+99JcnT8ICcQu3Us52pkMLIwYTgnorRtHnCXcDjdzIkVGZAXgU8+hCePjofXhPSS1TKGprRuVVt0h7oiYD6NhouBwNMaa0GekGKEHQQ+S7r96fFqLVyfGU/eN42v2yDy1o8Un5/GghyVNSrSswPWB0sGkFCcIEwCOSWnTyCTX1sZ94gOcSqUweShZbi/CpESYWE49yWGjt7R/hCNJPgtwYLsQNQ9lIQVORFHSb2DP9eLBwC6/kg2oOBFw9lrBsCwfPzlbmw9zSLNYYRi84+tzfMKGvkpFFZRSsKJhCukvFsG//Y2H/4m49ZZb6YYBsSmKVAZlRzF6LNbkJS/xcDnmzLZx45OAMpQ2HPTpxNHGtjo+prcT48CJGDKyuMFpo8cjAsa2RgwnCdQa/SAAkA69p2D7bMdjA11qEIw6SwRexurOcNwSDl0051mawtAaJ9nBt99k+E+RNv3Mjphj7r1NagEfbOZCwZP6BVMiTr6O/vF+IEZf/XXKmdSTUpnFnNhblIBKN0XryOMXG6yw5KJCRWqPwPwcsTzfC7gPfwVSzV2sCoVEZKZ+nizDC0xGRpZFns8myacQuM3OtgccPh1phsc4j00p101iYwBt19LQ7XpzCO87tWObZBId/CyanB40eSAjBehKE00iEY22hREGylLlo1cIVdRw1ON3wIpnDLTGYUJYsdBhN+2xfl9pxy+H7eEcZrtmAh3ygzMh5HkeUPhDCxJRn4b4chp4mnA1TYWF6AQ+OQaPoasbCPc1avkaMnuDZilSI4YAsWh+LtyUUZzMLRxfDw/u/o39TzmczTBlsI4mMiBmcccl4avrQ3EsYDHA6WgDAfZfjRhyMHix8wHn74Wq4Ej+5F5gY4IuNjm57hgSJoaDbVU9NJxwhMH1oHcLk4RcJBCIlBR2mK6gMdoQJJ/UzUWzNwcRgH9cjHP95NgQm4GXO0Y91X9/4FPPz77sprkHgLfKCD+yUl20G2FIhf+DRV7XyYjjWPoKn7PGfG2aARz+jw30utRLMeLEfGvdVcnTSUMJ6OZknPEnYV2gXQ/14I+w9sDvsmXkI7w+bEkkeJ89jTXhyCExDYnDUwBMh4dEddkWU9BN4Eu7q38MT7rjA5UeBTlcRJD/lZJLYgjNOIxxBfK2ggHOc4SITyRG/liCAItA22thIwUTglKKkYJIx8cBPycNkEh9LKqivoH72I/g19+sb/TUXI8j7kSDX4MIe/WAbbLlgtaIxA67nPyeeLxwPx2pHwuLUcuhQFIpFJasJIy19Tfs8UeQ3dvZRUnJIKZcIRhRiX64HTGWvAZAonFiE5hzeCHxwOjx08P6wd/6RsNiaNzry4Ie44EsljZ+gaJsjeMFLIwWGEP62MlWys5RN1fHwj/7yAiSGOYCB5JdHO4d4BlDXJrCvdQPPTAhjYkCWnXEwIRBSjECq6TTukw8nJySDF+cP7jalkC9lAa/IhW3kT3x/8RsQYEewn/v7SJBfeP8PaIqx6x9gLLfizAOHyWJhJky3DoVjx6dDbQqPUOInEve/+dRHjZggUCSfCMbK/G/jsFu6/jolB0loaFZbprjA2GUI2LqiDihiyqnPtMLhAwfD7kMP6DVRx/GPhKPFEZ9c8IVTWZgM+f45/OuKZr0eNg1OhH92+xVhoMYAMaB21PLI14jB0QFHtdYFasejnHjAZ59oFGC7HN5VOyYH5TMxUDFpuAjVFEMwEw99nKK0mGUddWACGW8mmMmyQ/QJJMh/+EGNIPyftXOF6TBVPxim8H6vxWk8TolfM/izggp9JXdZEtD/9KLiI3ssWQhjIC1u0V4x2PgmJUdPsCHBj3rC1UflVOJ+2nOdvR8dzWJozrbDsf3T4f5HvxW+c+gbYc/8rjDTPCpevqaIp/syhuwfufh44Ijx45+7KgwswzActYwgYmJHOwOHYCGUFiQFKCaGYDzKbdjHrvCiynCW6Ul+1JQ86Ui+D4T87JSSicE+3v5giajEYSKSL+Xzm0tWaslC/f/qQ3dt+I6yKu5J/QUkyNbzqqF2tBE6vOTNW3Oi3xUHn25MlHxowScaBPMPtbpziUJa8vH8kqIb2GhcfekFP/qOSrcyCFZiRnmUkYp21JtAqUH5+EQXUZe0r1NMDPM8zWouNsPCHBZUc0cxfx4O8228DBdjpQKNRw2ZMFNbFsPL7zw/lHn3ARlKEZOkIxtAzf8aIRA8Hd2oMSpw6KfDiMdCGKKpJDBm3JKpbbnGYaFpepMwdjnRmdOt5pNrTJZUSIJ9gYgPnTnyiJMM74Zddx0IO87bEiZ2Zr8F1Wq1sLy8HDZv3hz5J45qVPDw1HU/fFV44K7HMUXPWaDJl1Nt1Fe+IDYVVkVFrJ320ZAusV+9wOmMNj730MG/v5N4GymWHBdacrgoytSI4Zx09kAg/0y8K2GeckTjwC19pbfsYa5WdhMFQAWlgZe2L7bxopeVMDc/G47NHw3H8Z7uoYP1UG/gbnG82YZOQdhVy0FQyoZ8BpxHNUcMtPnBkU1ZTAwGl22lK0+FOCQoEaiVNJM+5KmjEiiur2puWEjKirQOow4Y7nSGodMsu99VdCLhlcp6+NZdu5Ugm3dmV3bXnyB7wvGDCybXNDRFINt9Txt9pNABQX0B45e6uG0Ghq+HGp/bdajv5PiRd5Q75XT/nQdTPpFjKQZFAGty63gna/sij05WgUOtHZOE5gLA6yhdnJHgbsXQWsad5gsrYWFhPszjqt98fTYstGYDf37mjSt4DAkBwEUf3J7O9CnjsjjXIp4YVFEjgQYQ7OlPUFeCGLHNlulE3zqUCUwKFfCmjtAMHyQvgs8X5XHUW8HbaWqtJbx3YynU8BKWFTxR16jVYUc73PfVx8LO87eHLedtNEGuDA/c+Xg4dtBOkU2vOIIo+FAmJgH1dT1TG320iHCNglC+M9z83EN9JIfdWyh5vFjChvkkHTH0jDR0N1o/PeYZrCwGXaInvi7uUFFjSRxLJkAIJF8Vw+BP5LzUwU4e+W2814LUnSZqfPHfSxCgJpKDr2MAf7yDk8nHJmeuLmiKSBgtPLUGNb5EIE70FtrcAR70w3mSaj+Vlv5IVADx0BMTGP1NtKFLu8VfiAHDVVxOPx28i4zTTgevgqAtNKeI1SNvrSFnbMKfvuf/CT/xr18VLrtuB2it+D2pJ3twamhkMPzaH74uvPNn/iQ8dA/eSAzGmro4emvIoimQB3ZmC8VnseAi3+NilgLRZtqowforIwMXEwBCMJdo56w+uoPqoDv/Ja6UEZkFAfvkwWCoj/jcZ0FgYos7xouowqUNFMov2gi2/b5BFRF4ICkZgKUPRwsiwmFd3NBSwFTVwdv2dMqHF650FhBQHHxt3MTUnEFaHcf3GI79KbzzYwr1NCavabx2F3AM1THcPQAAFuNJREFUTDgzgC3EB217CTxxVy2/gS9/RSJxrUM9fO1jZ1CAMCmhC/WjLskGUy58Cgmy678foaapeIIkv6QeazBB/u0fvj5c/uJzKVFTsdhhoxpo8h58Z/4HVH4UNAezRLGDbpWQdewqOSgg/80ygNIzLt5cbVRGC1xHEhmUJe8IdjqdrWixJXcDB3XEM3qOCFCNnqDjdYaAfd4CiGBE1gmHEL2FUHys24gpO1PI5NNWDlEO537EQm3uRTeCzY/XjD1Db4chW9SRayLqaUlDncmVycLiEv701i/2mSA/pQQhI2pGR5Fn0jf60PaJZBLpDxbtRZhBNrY1K/I09AILmboUg9iuyY8ouZ2IIySAOWxLPfIgL3yNHeHW0txOA7HLoPNjowMAOAo5cnDLNmnk9BgItukqDbloE0PGEB0ilICAsch5ssdDT2yDq2FuhAiDc5c0Cjo4U2MWxpxDNhPCarQBtERhEuPLEYak/ADXaftKkFGMIH+EBLn2PCpEDfBhTZ+hJR0JNb0AFBy76iM2Yf2WmBya7E2YlAC7KJwBMHVMoO1Z24VKSWKRlsgorryzI8yCRBR8YgdTxppmBPdJy6AToumEwWdkJMP6yYMpwcetuUYgE+NLSZCPj/hGfQiTzAhM8l1t1dSLmKQ3fO6aJpRjcOnC5FVisBf6xgQmho0c1I5cREbS8MlbvxAe6mOK+fU/RIJ8z/nSn5Gif5j8xp38wZ32xy8QhONw6tBPicmxipQeci+hK1MiazuFDdG+Z7UrCR0THymKXblSgY8GQA6NVQ+dzbYc7QlBPPJlzaMTO/pD8IUrdxEhqUxZWfBjRKMDyYyB8uJ4EiGgtQhnS3rHUc10oB6mM/XWVwtj6AYKH900osEO7pt99CkWqf0kCEeQj78+XIERBBJlp3TDxvWksoRZP2W5X3GArR1ld8FJ60TmTpJkd4pq2SQlyMUcnxtppFJEZMWkotL8sB0L2+mDrLeezACiwY+Ca11BSwlTALKj0JiDExMD2HC/NJAoyo0yJcvly1dRIvXgV9Skt+IXxZyecoiFPJBSrOT4iC/xomZCQ/GkJ5umL+FUgTpySx7cfPKWO8JDf7/BRSoThCMIFqmuY/r5AbIFo/3UmfsU5fZTbh8lJYdoT8JsbSES3yNSxhMSG2spacGwI07vzgK6HVk0husGczYdy4WonCoPGw3ZM4vIR2ADaCuAtdRvm5M7SeZKIVOYdlrQjYkFFW0hokanSTZdGAImgl1JjQmixTP6tf4AvvqBx08MGrl/8t1MEHuSj/sspz2Lya9BwM+nGOkNeqvNFpolv0LmEz5boXJemH0Uoa87hvto88tiNVQQTCC11ef0HCEiPp1Dhr7PWs4yIWrT0WhkssWWDrYwRcmCih48jTzXI5WintLN+kyvVfIBJB/TKYcXYdYncVRLVtkkBrlAZwJg6YsvOvFlIliio+bUSHsIJx4YyAeACB3VJ9+NNchGEwSnuVyDXJY7zZVmFCfe1C2OzNEOatFPydExIeyTZ2TGZk7N91GpfOEeOXhhy51qAbAeGRGR1M8NigeJe0kx7HDpRb7mXN+KJNJYW6IZNZUoRZXb5X2GkdeVEEuGXhxTjQ6n/EgHID9KECSAnV37FGLJzMTgKKMfAtWiDVxg0zJr01uf6HME0SKVaxAwJV/qxpSQntIPUNZmAHo3XhSDTqE17z6lIBUAzFl29FOG7VttOKYY23nnOT0XloS79mq7AZEmyQPcnIwOCNOBJ8IYFBlpbeMTeZswkyOeAlAKYKYX2wqIjDS7iOX91jZNko6i51VScUr0DIJwoI8CQyZsEwOnsZxitHBGEugyvkQzYfBrLj5CFzfqb7w+ccvnNz6CxEXqZZ4gYKZFsGwFX8jgWRx1RULu4u5Gi5KjXqz932QnO8BBjBUMsqPZgAmopm3ivvU6yIDihA7jaDWVZK+tMyywpKUCUoJHU+RpAWIvnIqPZKBP/cwa4UZk7GU6JgaCUrLTipjdCSVPb+gm1+RYuMkZHJxOsnkKzesoACopuAecmCycaqzLdPcRRJyAYyNHtIk0+JK27xGE10Fwmkv+1InacFqxEQM+HWzVP3P3LZ8DeMNFccFNve/GrwIy3TkomBCWr2mHPOUO5h49QTz3emRgcEM3EAJlDIyGDmW3yLmhedk3doiv8ya9JJEolqSfyze2USeyzT4U4PRuS0YfGUZ6wXO0pBM9vMQ+jnKZFqTFHoC6bBdHEAbdbLZk0FkMYfhwVCFUPLAhz75GEF5qx2mu1iDkQ+7grd+FsNcabPzDb/7mb+LEpie80dhTV0qOT/zN2/cvDs59kYpqGM05n+RmINyzCs4+0shxsSaO44kuOdscQJp8ET31hkE0jCJMDAmzb55vnt6kkwsLZPMHtaSnw1fzNWzfUv+opnRffe1GfZliIDNsaswPi2wFjpanqLW4Bp5PMXap3faJyxHEEoR1pAefP+lzivn1eCWVftIIQn+W2p1atfVT1K+fBFFykLg2MPlPmmX83hyLBZiGw3wMU3KI7QpD/XRCxD+hAi5dlQ+qXCle6AMt/iI9kTNeHgzDJx4FmyRrO32Es+I3FmIardiKPlKjTVugGZLIeZEstcXHwg6gGKgPDCRGughMMoZfta01TDITnRw4NjDy+gCmsxcw4X0ppNR4AjhXI9w3uoARpI/TXI4gSBBdKINMJkhjfOX3GiNfP3T//fdLyY0mSEqOP/78Ty/ND83f1C628ZJgeUgKpyZdIxHyhTYKgFxGZ6E/krHNjxWv8+QGE14UsLpNWnf8aj62T3H49NCzJ8IggvFwpTJ9CGMxiLbAXUs+Gbj2UUykFLlyR/xJH/lxVBBP1Jx6NKLERGAyaGrhPs9a8PWpJdka6fueYpAgl117bmiNrty5OHPsrdumthWnpqYK/STIqnCH8NOvfs/rJxc3/2Gho5P45Hx6SY7yYGiP5O4WtHIeZLusp854lFifnKY92xc18LIA8Ki24rxOqCM24XSopKsdF4kn0PNEGHiS45IyXSUdfUxFn064Z/yNZ7JS5MbD9aI4p8tPZ/xnQZKLmtMH7wMhHj+iEdxo1Ue7pGPsp02ge93bXx0uf1nv664mJ/GqzEvXfpEueddWGp39jx/5oV+8/tf+38ZQqb1tZKkztW2qs23btu5VV10lA37jN34Daun6r/RZa3NCchDpJ29896u21Cb/ptis4O4wKp2RulM8pF4bGvbkaMPnw0G8zzMP87YHJbGOdOZggybcHE/BoHW+z5OMUgnP82TbcWkIWcHnEQ874m3J4/TEy9qGq30DMo8ST+et1QbI8gniL57RA9SiQeCVINTDplxLFuzzEQ0mDvRhTZukW58JAr0Wdz+0/8eeSIKkaYW6ePnkF9/+pfrQymW16tIBeSJ2ZI4w5zk+4fxEnzrYqdK+0ZtjzHB2cd/ovT8RrGpYPyh4O0BOBQaEu8bFiXwvQ3T+DJrzIjbbvR9jbzxzooDHqNl6xeUYPdcW5JHDtiQiDDQKtraaXADAuILBWesOIcQ1CDj4GoTc6Kd+FqkYFUYvufzcv/jwl3/7+wdW2qWppZHiRqcY05lKnKT8zA3v/d3x5fFfwh1RsmO1U2nXCTCzCo8l2siRbh+EjITLgERns3KnCoZ9c7Qp5T9Pu7Mc3XEST7Exvt5nIFGImeOy5ocOSDCnz8EMZEO9tY0Xt6TL00vryDfjycVvHAkijaYhEPJ1E+KZm2I09WBfcCYWtYxyXvd/3LThKQa0fY8gtO205Wd/+N9fXFwY+otqbfQFuE1SNHnjvS1GWRzwjAmTI7v7XAGDoSx5Gm8rXHQEjirCEpw0kKp9kufb0XniaYztMAWeD/GkS1NJnlckEt/Ek7K0s6Z8kUdcqgIkw0v0gMWpnCOcfwwVFJEB1xkcazCGQc/e6QZIEUZqG+XcJ69/ChNkzWmFhuTL79/+jkf/81d++UWLw8deVhta3K0RNCJ4APP4NM7hNC+mE8HmeEfOOznCfPEoZPSzZqxEy1216WRru5wkg6gMmNPFOoNRKJHwZcVg5Qu7Iz15uv6Olk8yqeKMnIfoI1+0iWNnKLFtA7BgPFuhvbzsrccu1O49zdXEwzMbKEBeupL6D4eyoQyw0/2au9YUM7XqLIbqw26KSKVnJ0FP0/iZm/79i0vLlY8MNTZdi5vBec83vSjrebS4A4t8YYrO6SnY7FEooqdFR1kkJwzaeLCsBkaOr7wDQMJxPR12Aj35MThcJ0A+rXVZapK5lcRTAl2PrJ9To9vluKR0GxzWW1tASchRTOK5EAWd3zN7sinGz27YT7l8b0m33FpuhOUvL87M/tUtn/qVnxzfMfRyyCNbldOdxQB38b5v7L7pX73mt77Fs5gpnMVsy53F8AyGjJBMVhvb/ravfc27to0sln5noDn0o+V6FW9Z6YirOYH/BtSeWTWHmaO55b7jsMF9/LEnKWI03pfBiZPvo+e0Tx4noyc8x6KXXgqZDkm6ydVu5Cv9TOlV8kkvrRLc6RRVdLo839cahHorYWON6YMPPQCZFKiYRJhUCq1Oo7Syr95aum1pbvZrAJUx3mjEv+VT//p1G02QVrP1rZ//x//mVXd/4/765qGdp0wQmntGyk/e8M5XVOqV/3OwOfxS/EPdQRrpyaFMkMG9Ts8Sg5GT56ULnekOVR21VFtRinwA5y7hRm0ZwH3hghsdnIrgtqd+0YuBxJMXS56eHLzk4b30wHBekZ40phNr8ODhDwEcPwnXIjsmiEnAFgnBlMD/v+y2BmpT+K/Vn1+YPvznrXYXD9p1q3jCrwIM/svqJ5Qgjz2490d+6uVv+XJtoNvePtxqHx0/r3PxxTOd1ddAqOcZLz/zqt++sVsrvnUwDL+s2hmdgCcwokQXWCVHZTDv8052e5uBxn6iz4060JxwR/WpiwZl9NZ2+sgm9huUuBYwlykGLtHqKMT5ppq96uMIFqeMmAg2UkhJYHF6sAThRTEmgqSBlry6Zfxz1MH6bjwkevvs9LE/qa8stYudTrVTKlUL3U4VKINnKkGmDx//d//0ip/+ULdSanmCrJz70va2bffrIplfIHtSkoPB8fLaG955zmCr8IZSe+CHK+2BKwdbQ8MwlO4xp5iL1CaNAoVedzQaEcP6xBcwx029Ma6+L4eT0iIAdPul0gi1K1keZCEK3Rg53GuXl2rFmQQRX4xNRz+zkI0RbjA71SNFt4xVRaV5sD1Qv7NZaP/50p7ddyy1h8ud9srA4EBhAK99H8Q6Z/DJSJA9jxx46z974Rs/0S0PNicqeBvwyEjL1x/XX3+9FodKkKj7U1b9xE3vPK+8UviJbrtwI57sv3qgVd1ealfKCiYdnfOoAk3/xyB74JUwMShU3MPjgUy193gA8zRxvs+SD9wTXp4rBVBy1q9eXoijrtphL9FsBBJMowNaTCL0dKqtpU65+RhGiH9olzufHb5o3+2PPjpZ3D63r3h0uVyqNgqlQrNd7idBIATnQCGscw3S/fPf/9sbb33L7z1YKnUbhUqt2aqWW5xeThg9ZMjTvHntje+6slxv/SDuu/zeUqf83FKrcm65WdmEf02uhZcHTWrGQLFtsVT2KHhuBvGNJqaNIUZyC6TRK6QJntFboBnWDM96xTvCqYBhGD4HvM5Aq9GptKfwA+buQqX9jXYpfAXjwd98+r+/bwW0Sif+Okpu/DHsTCYIed56mkXqkf3Tn/ihq/7lzSW8LaZSKtaXy92Gjx4LWwbavvZ4WkYOGrDe8i9u/NUd7cbAdaVO94UYaa4odkoXFTvF7UiaMbxVcLjQKg8U2jxE7Ri2hPDAUooHtxcmPEayJ4lsnzTez+CLC+oO371Q7rQ6hXa9W+osop7plLr7Q7HzCK6Bf7tSLdxd3HntvZ/+9I/b5U1RnrgB7zOWIFBrEM/xDHCRigOrhHELB1Oh+1sff/Nrd1ww8WqXRS14mjtU2XTbW1/7zt/es2vvXLtUqpUaxTpHj8pgu9GpDrbOHQ9t/kDHqeUZnxwnuvZEyJte/LHKzPChS7ud9pZuuzPRLXfHCq3CpmKnMIajdqzYDqNw0gguM+FdCIVhrAOHsTouI9i1QrG7jP2lbrG7hKTAS06LC91CexH/52WhWwpzxU53rjxQnB1olff96Z3v6n3Q5ERV1g3xoJ2JEYQJgqtoA9C/DLvsChp2XvvmH3j+9T/yPa8vVYqTwGkuziz/t/e97Q/edfDx6dlOsbQyUOqsNBqFermMd0qUq80wVGv61HL99eH/G8mx7og8wxDPfIIUKxj7yhjjNBVzBMH1kNa2s7aUpo7O4oWlzRUMLiuldneli+Rol9q1SrNUa5UGat1ys7l9cKxZGptu5dcdkdEzzHP/P1AHZy+aszh801xeY+B8z2sOPIJ5islTzZHScqtYGmrUG90GVmB1TCN13GpTwz1ZNbyLpIbZsa5vp4uXa3XwNrYi3mZSwhtFeImt0D18cKqGkVAyMGFCKC9Uou5i7Kx2CgPdunKggYF0pbWjsLBwUNMedXo2OeiFp6mcqQTBXWVIkkKt0EHiIEmQdw1cLGgW8eoRvCALiaJTM1tArWHraBf5tEZ5NjnWcMpTCXqiCWLTRAdTRqfWYYJgJMEl1gbeSIiRpIuXq3Xwz90LeE9RaBcL3TZ/CsP6C9fhsKSv4WcxlMVCZc3EeTY5nspMOImsfhMEl9NrnGI6bYQZdanYXeEogsgrUTpMFP67IiZIAT/S4O23ZdStQqeDtzxjccILHYO66DVQrHaHyke6Y2M7U6I8mxwnCdhTDd5ogjRxnQLvQGvg6lcdr9Ws4UxtpdsuYrGJGknia5FiEYuJQqmBn3Ux3eDfMCM5KviW8A9aG8iXYqHWLWHkOBx6T8a4Fno2OZ7qLDiFvPUkSHlguMmzCwwIKIV6CxeyeObR1iiCRSrORvC4ygpundC33cYiFotX3AmP/y7QwSjSbmJEQaoUWwOoBwrVTrVU71RKg93RwVGMGl/W4phqPpscpwjW09F1ugRZqNQ6vKLJ30WKmBXsQhauV+CiFv5BwAr+Xx1GjjLe/ttd5oiCfxuywqmHi1QtVIu4Ngq6TqHUahW77ZViE1fQBrtjA1s6D8Bg3qHudj+bHO6JZ1B9ugSpD4Y2EwRXOVuh1GwWG+1GuVHXKIJfcTGKtLD+KNU4xXSKbbSLtXYJaxK8nl6JUed8UmoNFTvtEfzUx4TjeqNanUyJQXc8mxzPoKTIq3KqBJmoLnY8QXh1s1waaTRKo3WOIkySchkJwpEECcEvp55SCWuURqfBROKUxOsnzRKSozTe4aixF1PK2NiunuRY8/w2r+Sz7afXA2tdSZ2auqqwber+Ih83OL5ysDTWrhaXcKlsoF0o4Qah4kC3wksc+DWomuJb5h1lODOpsC5124PFeme8srXN2wU5auSvjPqFuWdHjqc39qeVvtYIwptyprZd1eGTbLzVj1dTOc3wB7RiZbRRKWOawWjCH9X8SxgXsu1yuUXclUo7JQavypJnXhnKTZmV73i2/czzwNojyFSBd5GfX1+0S9+NY8Vmu17Y3BkvNLv1E2LLhefx4lx3pDLeGSyPdJlcj2KdwenEH5X0UYPJ8ezI8czLgzU1WnsE2da98sqgm3R4J9fFk9XWOWNYpOLOLv4Ezy9HFW8Tzn79NA98jj78PccTwwW7rBOyyxGerZ+ZHlg9glBLf4KeT9OHcD3+48TBQq02U7gyZwJPU/1sxEcKdvtNxWznRw3uP5sc9MJ3YTlVkuTNYcLkr11431pJwT4fNdR25Gfr7z4PeIK45n7zkO+fqvZRwnHySeGw/wFIq5veX6EsnQAAAABJRU5ErkJggg==')
            |Pool Staking
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item class="#{active-item}")
                        img.pug.star(src="#{icons.star}")
                        |How much VLX do you need to become a delegate?
                    if active-item is \active
                        ul.pug.answer
                            li.pug
                                span.pug A minimum of 10,000 VLX
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item2 class="#{active-item2}")
                        img.pug.star(src="#{icons.star}")
                        |How much VLX do you need to run a node?
                    if active-item2 is \active
                        ul.pug.answer
                            li.pug
                                span.pug A minimum of 1,000,000 VLX
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item3 class="#{active-item3}")
                        img.pug.star(src="#{icons.star}")
                        |How much VLX do you need to pool stake?
                    if active-item3 is \active
                        ul.pug.answer
                            li.pug
                                span.pug On our Web Wallet 2.0, you will need a minimum of 10,000 VLX and/or if you have a smaller amount you can also pool stake with one of our exchange partners..
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item4 class="#{active-item4}")
                        img.pug.star(src="#{icons.star}")
                        |How long do you need to stake for?
                    if active-item4 is \active
                        ul.pug.answer
                            li.pug
                                span.pug The staking time period is 30 days
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question(on-click=activate-item5 class="#{active-item5}")
                        img.pug.star(src="#{icons.star}")
                        |How many people can stake in one pool?
                    if active-item5 is \active
                        ul.pug.answer
                            li.pug
                                span.pug There is no limit to the number of delegates per staking pool.
item3 = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
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
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    .pug.faq-content(class="#{file-tree}")
        h1.header.pug 
            img.pug(src='data:image/png;base64,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')
            |Backup / Restore
        h2.sub-header.pug  Coming Soon..
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
item4 = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-style3 =
        color: info.app.text
        border-bottom: "0"
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
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    .pug.faq-content(class="#{file-tree}")
        h1.header.pug 
            img.pug(src="#{icons.faq-others}")
            |Others
        h2.sub-header.pug  Coming Soon..
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
        .pug.section
            .source.pug
                .pug.content-right
                    .pug.header.question.placeholder
                        img.pug.star(src="#{icons.star}")
                        |Does Velas have fees to send or receive?
faq = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    active =
        if store.current.active then \active else \ ""
    switch-progress = ->
        store.current.progress = not store.current.progress
    hide-progress =
        if store.current.progress then \hide-progress else \ ""
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
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
    border-style3 =
        color: info.app.text
        border-bottom: "0"
    border-right =
        color: info.app.text
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-b =
        border-bottom: "1px solid #{info.app.border}"
    button-primary1-style=
        border: "1px solid #{info.app.primary1}"
        color: info.app.text
        background: info.app.primary1
    input-style=
        background: info.app.wallet
        border: "0"
        color: info.app.text
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    activate = (tab)-> ->
        store.faq.tab = tab 
    activate-item = activate \item
    activate-item2 = activate \item2
    activate-item3 = activate \item3
    activate-item4 = activate \item4
    active-class = (tab)->
        if store.faq.tab is tab then 'active' else ''
    active-item = active-class \item
    active-item2 = active-class \item2
    active-item3 = active-class \item3
    active-item4 = active-class \item4
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.faq
        .pug.title.alert(style=border-style2)
            .pug.header This page is under development. You see this only as demo
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") FAQ’S
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            epoch store, web3t
            switch-account store, web3t
        if no    
            .pug.search-input
                .pug.section(style=border-style)
                    span.pug.close(on-click=switch-files)
                        img.icon-svg-video.pug(src="#{icons.menu}")
                    .title.pug
                    .description.search-field.pug
                        .pug.left
                            input.pug(type='text' style=input-style value="velas" placeholder="velas")
                            .pug.icon
                                icon \Search, 15
        .pug.wrapper
            .pug.main-content(class="#{file-tree}")
                .pug.section.filter(style=border-right)
                    .tabs.pug
                        ul.pug(style=border-style3)
                            li.pug(on-click=activate-item class="#{active-item}")
                                .pug.dot
                                span.pug Web Wallet
                                img.icon-svg.pug(src="#{icons.arrow-right}")
                            li.pug(on-click=activate-item2 class="#{active-item2}")
                                .pug.dot
                                span.pug Pool Staking
                                img.icon-svg.pug(src="#{icons.arrow-right}")
                            if no    
                                li.pug(on-click=activate-item3 class="#{active-item3}")
                                    .pug.dot
                                    span.pug Backup / Restore
                                    img.icon-svg.pug(src="#{icons.arrow-right}")
                                li.pug(on-click=activate-item4 class="#{active-item4}")
                                    .pug.dot
                                    span.pug Others
                                    img.icon-svg.pug(src="#{icons.arrow-right}")
            if active-item is \active
                item store, web3t
            if active-item2 is \active
                item2 store, web3t
            if active-item3 is \active
                item3 store, web3t
            if active-item4 is \active
                item4 store, web3t
module.exports = faq