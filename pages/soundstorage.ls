require! {
    \react
    \react-dom
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \./switch-account.ls
    \../icons.ls
}
.videostorage
    @import scheme
    $border-radius: $border
    $smooth: opacity .15s ease-in-out
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    .active-download
        bottom: 10px
        right: 10px
        width: 226px
        background: #321260
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
        background: #321260
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
    @media(max-width:800px)
        width: 100%
        margin: 0
    .search-input
        position: fixed
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        z-index: 1
        width: 100%
        .add
            line-height: 63px
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
        .menu-content
            .tabs
                ul
                    display: inline-flex
                    padding: 0
                    margin: 0
                    list-style: none
                    li
                        padding: 20px 15px
                        cursor: pointer
                        &.active
                            background: #43207c
    @media(max-width:800px)
        width: 100%
        margin: 0
    .search-field
        .left
            position: relative
        .icon
            position: absolute
            top: 12px
            right: 0
            padding: 8px 10px 9px
    .section
        border-bottom: 1px solid rgba(240, 237, 237, 0.16)
        padding: 0px
        display: flex
        width: 100%
        @media(max-width: 800px)
            width: auto
        img
            width: 100%
            transition: .5s
            &.icon-svg-video
                position: relative
                height: 12px
                top: 2px
                width: auto
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
            text-align: left
            width: 70px
            font-size: 14px
            background: linear-gradient(#f70,#f30)
            @media(max-width: 800px)
                display: none
            h2
                font-family: 'Roboto', sans-serif
            h3, h2
                margin: 0
                line-height: 36px
                font-weight: 400
        .description
            padding: 0px
            font-size: 14px
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
                width: 200px
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: $border-radius
                border-radius: 4px
                padding: 0px 10px
                font-size: 14px
                margin-top: 12px
                margin-left: 15px
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
        >.close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            &:hover
                color: #CCC
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
        flex-wrap: wrap
        overflow-y: scroll
        scrollbar-width: none
        padding: 0
        margin-top: 69px
        >.panel-content
            padding: 20px
            box-sizing: border-box
            width: 100%
            .block-content
                padding-bottom: 20px
                margin-bottom: 20px
            &.dragarea
                overflow: inherit
            &.library
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
            iframe
                width: 100%
                height: 150px
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
                .play
                    @media(max-width:800px)
                        top: 120px !important
                iframe
                    @media(max-width:800px)
                        height: 240px
                .source
                    cursor: pointer
                    position: relative
                    .title-video
                        display: flex
                        .account
                            border-radius: 50px
                            width: 20px
                            height: 20px
                            padding: 10px
                            margin-top: 5px
                            background: #4b2788
                            margin-right: 10px
                    .play
                        width: 100%
                        height: 150px
                        display: block
                        line-height: 43px
                        border-radius: 0
                        position: absolute
                        z-index: 1
                        top: 80px
                        left: 50%
                        margin-right: -50%
                        transform: translate(-50%, -50%)
                        opacity: 0
                        transition: .5s
                        svg
                            width: 30px
                            height: 30px
                            background: rgba(102, 51, 153, 0.55)
                            padding: 10px
                            border-radius: 50px
                            margin-top: 43px
                    &:hover
                        .play
                            opacity: 1
                            transition: .5s
                        img
                            opacity: 1
                            transition: .5s
                        .header
                            text-decoration: underline
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
                    cursor: pointer
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
        >.similarvideo
            margin-left: 180px
            padding: 20px
            width: 100%
            box-sizing: border-box
            &.file-tree
                margin-left: 0px
                @media(max-width: 800px)
                    margin-left: 0px
            iframe
                width: 25%
                height: 140px
            .content-right
                width: 60%
                margin-left: 20px
                @media screen and (max-width: 800px)
                    width: 100%
            img
                width: 100%
                height: 140px
                opacity: .8
                transition: .5s
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
                padding: 0
                display: inline-block
                width: 100%
                min-width: 205px
                min-height: auto
                border: 0
                box-sizing: border-box
                vertical-align: text-top
                margin-bottom: 20px
                float: left
                .source
                    cursor: pointer
                    position: relative
                    display: flex
                    .play
                        width: 30%
                        height: 140px
                        display: block
                        line-height: 43px
                        border-radius: 0
                        position: absolute
                        z-index: 1
                        top: 70px
                        left: 12%
                        margin-right: -50%
                        transform: translate(-50%, -50%)
                        opacity: 0
                        transition: .5s
                        svg
                            width: 30px
                            height: 30px
                            background: rgba(102, 51, 153, 0.55)
                            padding: 10px
                            border-radius: 50px
                            margin-top: 43px
                    &:hover
                        .play
                            opacity: 1
                            transition: .5s
                        img
                            opacity: 1
                            transition: .5s
                        .header
                            text-decoration: underline
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
                    cursor: pointer
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
                ul.stat-text
                    list-style: none
                    padding: 0
                    margin-bottom: 0
                    color: #969696
                    font-size: 13px
                    text-align: left
                    margin-top: 0
                    padding-top: 8px
                    li
                        display: inline-block
                        margin-left: 4px
                        cursor: pointer
                        + li
                            &:before
                                content: ' · '
                        &:first-child
                            margin-left: 0
        >.menu-content
            width: 180px
            position: fixed
            box-sizing: border-box
            @media(max-width: 800px)
                display: none
            &.file-tree
                display: none
                @media(max-width: 800px)
                    display: none
            .tabs
                height: 100vh
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
                    .icon
                        margin-right: 15px
                        svg
                            vertical-align: middle !important
                    &.active
                        color: #c671f1
                        background: rgb(67, 32, 124)
                        padding-bottom: 15px
                        img
                            filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
                    &:hover
                        background: rgb(67, 32, 124)
                        padding-bottom: 15px
                        transition: .5s
    .iron
        .logo
            padding: 6px
            width: 60px
            height: 10px
            display: inline-block
            line-height: 0px
            text-align: center
            vertical-align: text-top
            border-radius: 5px
            margin-top: 3px
            svg
                vertical-align: top !important
    .bounce
        animation: bounce_9418 3.6s ease infinite
        transform-origin: 50% 50%
    @keyframes bounce_9418
        0%
            transform: translateY(0)
        5.55556%
            transform: translateY(0)
        11.11111%
            transform: translateY(0)
        22.22222%
            transform: translateY(-5px)
        27.77778%
            transform: translateY(0)
        33.33333%
            transform: translateY(-5px)
        44.44444%
            transform: translateY(0)
        100%
            transform: translateY(0)
menu = (store, web3t)->
    info = get-primary-info store
    drag-file = ->
        store.video.drag = not store.video.drag
        store.video.menu-open = not store.video.menu-open
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    .pug.menu(style=filter-body)
        .pug.middle
            .pug.table-row-menu(on-click=drag-file)
                .col.folder-menu.pug
                    span.pug
                        img.icon-svg.pug(src="#{icons.add-video}")
                        | Upload video
home = (store, web3t)->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
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
        color: info.app.addressText
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
        color: info.app.addressText
    icon-style=
        filter: info.app.nothingIcon
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    drag-file-close = ->
        store.video.drag = not store.video.drag
    header-style-light =
        border-bottom: "1px solid #{info.app.border-light}"
        color: info.app.text
    .pug.panel-content.dragarea.library(class="#{file-tree}")
        if store.video.drag
            .header-table.dragfile.dragarea.pug(on-click=drag-file-close)
                .pug.cell.network(style=dashed-border)
                    img.pug.bounce(src="#{icons.img-drag}" style=icon-style)
                    | Drag and Drop here
                    br.pug
                    | or
                    span.pug Browse files
        .block-content.pug(style=header-style-light)
            h2.header.pug Chill
            .pug.section
                .source.pug
                    iframe.pug(width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    .pug.title-video
                        span.pug
                            img.pug.account(src="#{info.branding.logo}")
                        span.pug
                            .pug.header Velas Explainer Video
                            ul.pug.stat
                                li.pug
                                    span.pug 2K views
                                li.pug
                                    span.pug 5 days ago
            .pug.section
                .source.pug(on-click=goto-details)
                    iframe.pug(width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    .pug.title-video
                        span.pug
                            img.pug.account(src="#{info.branding.logo}")
                        span.pug
                            .pug.header Velas Explainer Video
                            ul.pug.stat
                                li.pug
                                    span.pug 50K views
                                li.pug
                                    span.pug 1 mounth ago
            .pug.section
                .source.pug(on-click=goto-details)
                    iframe.pug(width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    .pug.title-video
                        span.pug
                            img.pug.account(src="#{info.branding.logo}")
                        span.pug
                            .pug.header Velas Explainer Video
                            ul.pug.stat
                                li.pug
                                    span.pug 2K views
                                li.pug
                                    span.pug 5 days ago
        .block-content.pug(style=header-style-light)
            h2.header.pug Party
            .pug.section
                .source.pug(on-click=goto-details)
                    iframe.pug(width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    .pug.title-video
                        span.pug
                            img.pug.account(src="#{info.branding.logo}")
                        span.pug
                            .pug.header Velas Explainer Video
                            ul.pug.stat
                                li.pug
                                    span.pug 2K views
                                li.pug
                                    span.pug 5 days ago
            .pug.section
                .source.pug(on-click=goto-details)
                    iframe.pug(width='100%' height='300' scrolling='no' frameborder='no' allow='autoplay' src='https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/51957607&color=%2343207c&auto_play=false&hide_related=false&show_comments=true&show_user=true&show_reposts=false&show_teaser=true&visual=true')
                    .pug.title-video
                        span.pug
                            img.pug.account(src="#{info.branding.logo}")
                        span.pug
                            .pug.header Velas Explainer Video
                            ul.pug.stat
                                li.pug
                                    span.pug 50K views
                                li.pug
                                    span.pug 1 mounth ago
stream = (store, web3t)->
    .pug.panel-content
        p.results.pug This tab is under development
library = (store, web3t)->
    .pug.panel-content
        p.results.pug This tab is under development
videostorage = ({ store, web3t })->
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
        border-right: "1px solid #{info.app.border}"
        background: info.app.header
    border-menu =
        color: info.app.text
        border-right: "1px solid #{info.app.border-light}"
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
        color: info.app.addressText
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
        color: info.app.addressText
    icon-style=
        filter: info.app.nothingIcon
    activate = (tab)-> ->
        store.video.tab = tab 
    activate-home = activate \home
    activate-stream = activate \stream
    activate-library = activate \library
    active-class = (tab)->
        if store.video.tab is tab then 'active' else ''
    active-home = active-class \home
    active-stream = active-class \stream
    active-library = active-class \library
    expand-collapse = ->
        store.video.menu-open = not store.video.menu-open
    .pug.videostorage
        .pug.active-download(style=filter-body)
            .pug.top(style=header-table-style)
                .pug.table-row-menu
                    span.col.folder-menu.pug
                        .pug Uploading 1 item
                    ul.action.col.pug(class="#{active}")
                        li.pug(on-click=switch-progress class="#{hide-progress}")
                            span.pug
                                icon "ChevronDown", 15
                        li.pug
                            span.pug
                                icon \X, 15
            .pug(style=header-table-style class="#{hide-progress}")
                .pug.table-row-menu
                    span.col.folder-menu.pug
                        .pug Left 7min.
                    span.col.cancel.pug Cancel
            .pug(class="#{hide-progress}")
                .pug.table-row-menu
                    .col.folder-menu.pending.pug
                        img.pug(src="#{store.filestore.extension-icons.txt}")
                        .pug.file-name File.txt
                    .col.folder-menu.progress.pug
                        progress.pug(value="30" max="100")
        .pug.title.alert(style=border-style2)
            .pug.header This page is under development. You see this only as demo
        .pug.title(style=border-style)
            .pug.header Sound storage
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            switch-account store, web3t
        if store.video.menu-open
            menu store, web3t
        .pug.search-input
            .pug.section(style=border-style)
                span.add.pug(on-click=expand-collapse)
                    img.icon-svg-video.pug(src="#{icons.video}")
                .title.pug
                    h2.pug.iron
                        span.logo.pug
                            img.pug(src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAAAsCAQAAAAwC3WkAAACUklEQVR4Ae2YA4wdURSGv+fattu4MWrbtu24bqOacWrbjNHYrm3bOF3vSXrzOpM7d3c22e8k31P03//ME0WdCM6QsvSlNS1pQGV+8JxnPOEKlyM3CD9SVjbJFzFzV1ZKJcKMVJBrkp6PslaqEFZku3jhmXQjPEhjuZkxjQHkgXjjj2yQBOFAFolksAhA/HBM4lgQJShKK/thMPskFoYASWV/DGeTTQCLXdeQUPbLHOlWcA0Mo0nGDAs0AOyQigUVoEyuVRt2KwRQm+UFFSClrNqwbAAmS0UnAdKedFlluwagNDPdNaBPOmW0fQMw3V2AcspJZRXAugGoIy1cBSihnFLWz9s3AB3wTdx3AHcNwABJ0I3m1EB4wm0ucCbyKIgAJZXdXQPQJWNyaZYxPdgiu1geeeJlhdS7jdUKBUuMyVyTvh4DMJwmGTPcwQrZUJZTMtdbgEq5Vm2oABYrZEeUTdLXS4ByyrqNkspJZWMzjiLsl1rGF/RJU1a5mrJ9A/aUZaU52QiaZMyIfxqoqFyI14BigtQxBagNkGHdgApQyO9Cmhj9TAGqA2QYc4AAPwfs6ZU+QNhXCBqbAtQAyHD4Vwhqhb8By2+johxR/q38y2x+KrviiSnAc4AcfwzIrrhtCvAMIMvhD3Dhfw18CMhu+M2Zor1CuyKPTAEeA2Q47A18ZDmYAhziVsYcCnkDfxgdeYKBeOQ2TQFC3cAfFkTOevkcCKqBpwEvz4DIVvAS4E1A3ktQ/GY7LSJn/f91bnc/KavlidjwUa7LRZkldSimGLf8BYloKYNdaWi1AAAAAElFTkSuQmCC")
                .pug.menu-content(class="#{file-tree}")
                    .pug.section.filter
                        .tabs.pug
                            ul.pug
                                li.pug(on-click=activate-home class="#{active-home}" style=border-menu)
                                    span.icon.pug
                                        | Home
                                li.pug(on-click=activate-stream class="#{active-stream}" style=border-menu)
                                    span.icon.pug
                                        | Stream
                                li.pug(on-click=activate-library class="#{active-library}" style=border-menu)
                                    span.icon.pug
                                        | Library
                .description.search-field.pug
                    .pug.left
                        input.pug(type='text' style=input-style value="velas" placeholder="velas")
                        .pug.icon
                            icon \Search, 15
        .pug.wrapper
            if active-home is \active
                home store, web3t
            if active-stream is \active
                stream store, web3t
            if active-library is \active
                library store, web3t
module.exports = videostorage