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
    \./alert-demo.ls
    \../components/burger.ls
}
.notice
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
        background: inherit
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
        background: inherit
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
        z-index: 3
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
        padding: 0px
        flex-wrap: wrap
        overflow-y: scroll
        scrollbar-width: none
        margin-top: 0px
        @media(max-width: 800px)
            padding: 0px
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
        >.msg-content
            margin-left: 300px
            padding: 0 0px
            width: 100%
            box-sizing: border-box
            .content-msg
                margin-top: 50px
                width: 100%
                height: 100vh
                ul
                    list-style: none
                    padding: 10px 30px
                    .in, .out
                        padding: 10px 0px
                        span
                            padding: 5px 10px
                            border-radius: 5px
                            display: inline-block
                            max-width: 50%
                            position: relative
                            font-size: 15px
                            span
                                float: right
                                opacity: .6
                                font-size: 10px
                                padding-right: 0
                    .in
                        text-align: left
                        >span
                            background: var(--bg-primary-light)
                            &:after
                                border-left: 15px solid transparent
                                left: -10px
                                position: absolute
                                bottom: 0
                                content: ''
                                width: 0
                                height: 0
                                border-bottom: 15px solid var(--bg-primary-light)
                    .out
                        text-align: right
                        >span
                            background: var(--bg-secondary)
                            &:after
                                border-right: 15px solid transparent
                                right: -10px
                                position: absolute
                                bottom: 0
                                content: ''
                                width: 0
                                height: 0
                                border-bottom: 15px solid var(--bg-secondary)
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
            .search
                transform: translateY(0%)
                transition: .5s
                &.active
                    transform: translateY(100%)
                    transition: .5s
                input
                    outline: none
                    width: calc(100vw - 390px)
                    text-align: center
                    box-sizing: border-box
                    height: 30px
                    line-height: 36px
                    border-radius: 0px
                    border-radius: 4px
                    padding: 0px 10px
                    font-size: 14px
                    margin-top: 8px
                    transition: all .5s
                    border: 0px
                    box-shadow: none
                    &:active, &:focus
                        transition: all .5s
                        text-align: left
                    @media(max-width: 800px)
                        width: 100%
            .header, .textarea, .search
                text-align: left
                font-size: 17px
                line-height: 48px
                padding: 0 15px
                height: 50px
                box-sizing: border-box
                font-weight: 600
                margin: 0 0 30px
                position: fixed
                width: 100%
                >img
                    width: 30px
                    height: auto
                    margin-top: 10px
                    background: #909090
                    border-radius: 50px
                    margin-right: 10px
                span
                    display: inline-block
                    width: calc(100vw - 460px)
                    @media(max-width: 800px)
                        width: calc(100vw - 100px)
                    .name
                        font-size: 14px
                        line-height: 20px
                    .activity
                        font-size: 12px
                        line-height: 17px
                        opacity: .6
                .action
                    margin: 0
                    padding: 0
                    list-style: none
                    line-height: 0
                    vertical-align: super
                    width: 100%
                    display: inline
                    li
                        display: inline-block
                        img
                            width: 15px !important
                            height: 15px !important
                            margin-left: 10px
                            cursor: pointer
            .header, .textarea, .search
                text-align: left
                font-size: 18px
                font-weight: 400
                margin: 0 0 20px
                z-index: 1
            .header
                z-index: 2
            .textarea
                bottom: 0
                margin: 0
                input
                    outline: none
                    width: 60%
                    background: transparent !important
                    text-align: left
                    box-sizing: border-box
                    height: 30px
                    line-height: 36px
                    border-radius: 0px
                    border-radius: 4px
                    padding: 0px 10px
                    font-size: 14px
                    margin-top: 8px
                    margin-left: 8px
                    border: 0px
                    box-shadow: none
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
                display: none
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
                    height: calc(100vh - 170px)
                    .action
                        margin: 0
                        padding: 0
                        list-style: none
                        line-height: 0
                        vertical-align: super
                        width: 100%
                        display: inline
                        li
                            display: inline-block
                            img
                                width: 15px !important
                                height: 15px !important
                                margin-left: 10px
                                cursor: pointer
                .left-menu
                    height: 50px
                    background: #331462
                    border-top: 1px solid #6b268e
                    border-right: 1px solid #6b268e
                    position: fixed
                    box-sizing: border-box
                    width: 300px
                    bottom: 0
            @media(max-width: 800px)
                width: 100%
            ul
                list-style: none
                margin: 0
                padding: 0
                li
                    display: inline-block
                    padding: 10px
                    font-size: 14px
                    cursor: pointer
                    width: 100%
                    box-sizing: border-box
                    transition: .5s
                    &:first-child
                        padding: 0
                        display: inline-flex
                        height: 50px
                        background: #331462
                        width: 300px
                        position: fixed
                        z-index: 1
                        border-right: 1px solid #6b268e
                        input
                            outline: none
                            width: 230px
                            text-align: center
                            box-sizing: border-box
                            height: 30px
                            line-height: 36px
                            border-radius: 0px
                            border-radius: 4px
                            padding: 0px 10px
                            font-size: 14px
                            margin-top: 8px
                            margin-left: 8px
                            transition: .5s
                            border: 0px
                            box-shadow: none
                            &:active, &:focus
                                width: 280px
                                transition: .5s
                                text-align: left
                                ~ .edit
                                    transition: .5s
                                    position: absolute
                                    opacity: 0
                                    transform: translateX(100%)
                        .edit
                            width: 15px
                            height: 15px
                            margin-top: 15px
                            margin-left: 25px
                            cursor: pointer
                            transition: .5s
                    &:nth-child(2)
                        margin-top: 50px
                    span.notification
                        display: inline-block
                        width: 10%
                        vertical-align: top
                        text-align: right
                        .count
                            width: 20px
                            height: 20px
                            background: #a0a0a0
                            display: inline-block
                            text-align: center
                            float: right
                            margin-top: 13px
                            border-radius: 50px
                            font-size: 10px
                            line-height: 20px
                            color: #2a0f56
                        .time
                            font-size: 10px
                    .ava
                        width: 50px
                        height: 50px
                        background: #8e8e8e
                        display: inline-block
                        margin-right: 10px
                        border-radius: 100px
                        margin-top: 0
                    .preview
                        display: inline-block
                        width: 190px
                        vertical-align: top
                        .msg
                            font-size: 12px
                            height: 30px
                            overflow: hidden
                            text-overflow: ellipsis
                            display: -webkit-box
                            -webkit-box-orient: vertical
                            -webkit-line-clamp: 2
                            opacity: .6
                    .icon-svg
                        opacity: .8
                        transition: .5s
                        position: relative
                        height: 12px
                        top: 2px
                        opacity: 1
                        float: right
                        margin-right: 3px
                    .icon
                        margin-right: 15px
                        svg
                            vertical-align: middle !important
                    &.active
                        background: var(--bg-secondary)
                        .icon-svg
                            opacity: 1
                    &:hover
                        background: var(--bg-secondary)
                        transition: .5s
                        &:first-child
                            background: transparent
                            cursor: auto
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
        background: info.app.header
    border-t =
        border-top: "1px solid #{info.app.border}"
        background: info.app.header
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
    search = ->
        store.notice.search = not store.notice.search
    search-show =
        if store.notice.search then \active else \ ""
    file-tree =
        if store.current.files then \file-tree else \ ""
    imgs=
        ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    .pug.msg-content(class="#{file-tree}")
        .header.pug(style=border-b)
            img.pug(src="#{imgs.ava}")
            span.pug
                .pug.name Paul Smith
                .pug.activity last seen 2 minutes ago
            ul.action.pug
                li.pug
                    img.icon-svg-video.pug(on-click=search src="#{icons.search}")
        .search.pug(style=border-b class="#{search-show}")
            input.pug(type='text' style=input-style value="" placeholder="#{lang.search}")
        .textarea.pug(style=border-t)
            input.pug(type='text' style=input-style value="" placeholder="#{lang.writemsg}")
        .pug.content-msg
            ul.pug
                li.pug.in
                    span.pug 
                        | Hello
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | Hi
                        span.pug 22:53
                li.pug.in
                    span.pug 
                        | How are you?
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | Fine
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | And you?
                        span.pug 22:53
                li.pug.in
                    span.pug 
                        | Inconspicuous motes of rock and gas how far away brain is the seed of intelligence gathered by gravity concept of the number one Orions sword.
                        span.pug 22:53
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
        background: info.app.header
    border-t =
        border-top: "1px solid #{info.app.border}"
        background: info.app.header
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
    search = ->
        store.notice.search = not store.notice.search
    search-show =
        if store.notice.search then \active else \ ""
    file-tree =
        if store.current.files then \file-tree else \ ""
    imgs=
        ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    .pug.msg-content(class="#{file-tree}")
        .header.pug(style=border-b)
            img.pug(src="#{imgs.ava}")
            span.pug
                .pug.name Nicolas Gate
                .pug.activity last seen 2 minutes ago
            ul.action.pug
                li.pug
                    img.icon-svg-video.pug(on-click=search src="#{icons.search}")
        .search.pug(style=border-b class="#{search-show}")
            input.pug(type='text' style=input-style value="" placeholder="#{lang.search}")
        .textarea.pug(style=border-t)
            input.pug(type='text' style=input-style value="" placeholder="#{lang.writemsg}")
        .pug.content-msg
            ul.pug
                li.pug.in
                    span.pug 
                        | Hi, bro
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | Hello
                        span.pug 22:53
                li.pug.in
                    span.pug 
                        | How are you feeling?
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | Good
                        span.pug 22:53
                li.pug.out
                    span.pug 
                        | And you?
                        span.pug 22:53
                li.pug.in
                    span.pug 
                        | Also good!
                        span.pug 22:53
notice = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
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
        background: info.app.background
    border-users =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
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
    search-bg =
        border-bottom: "1px solid #{info.app.border}"
        border-right: "1px solid #{info.app.border}"
        background: info.app.header
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
    border-t =
        border-top: "1px solid #{info.app.border}"
        border-right: "1px solid #{info.app.border}"
        background: info.app.header
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
    imgs=
        ava: "https://res.cloudinary.com/dfbhd7liw/image/upload/v1588866150/velas/interface_1.png"
    .pug.notice
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") #{lang.velas-messenger}
            .pug.close(on-click=goto-search)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
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
            .pug.main-content(class="#{file-tree}" style=border-users)
                .pug.section.filter(style=border-right)
                    .tabs.pug
                        .pug.left-menu(style=border-t)
                        ul.pug(style=border-style3)
                            li.pug(style=search-bg)
                                input.pug(type='text' style=input-style value="" placeholder="#{lang.search}")
                                img.edit.pug(src="#{icons.create}")
                            li.pug(on-click=activate-item class="#{active-item}" style=border-b)
                                img.pug.ava(src="#{imgs.ava}")
                                span.pug.preview
                                    .pug.name Paul Smith
                                    .pug.msg Inconspicuous motes of rock and gas how far away brain is the seed of intelligence gathered by gravity concept of the number one Orions sword.
                                span.pug.notification
                                    .pug.time 22:51
                                    .pug.count 2
                            li.pug(on-click=activate-item2 class="#{active-item2}" style=border-b)
                                img.pug.ava(src="#{imgs.ava}")
                                span.pug.preview
                                    .pug.name Nicolas Gate
                                    .pug.msg Hey
                                span.pug.notification
                                    .pug.time Thu
                                    .pug.count 10
            if active-item is \active
                item store, web3t
            if active-item2 is \active
                item2 store, web3t
module.exports = notice