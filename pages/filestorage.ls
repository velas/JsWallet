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
.filestore
    @import scheme
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
    .active-download
        bottom: 10px
        right: 10px
        width: 226px
        position: fixed
        display: inline-grid
        z-index: 1
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
        width: 226px
        position: absolute
        top: 60px
        right: 0
        display: inline-grid
        z-index: 1
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
        z-index: 1
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
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
    >.toolbar
        position: relative
        height: 60px
        @media (max-width: 800px)
            position: fixed
            height: 60px
            z-index: 11
            width: 100%
            background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        ul.path
            @media (max-width: 800px)
                display: none
        .files
            float: left
            top: 15px
            position: relative
            right: 0px
            margin-left: 20px
            cursor: pointer
            line-height: 2
            img
                width: 15px
                transition: $smooth
                -webkit-transition: $smooth
                -moz-transition: $smooth
                -ms-transition: $smooth
                -o-transition: $smooth
            &.file-tree
                img
                    opacity: .5
                    transition: $smooth
                    -webkit-transition: $smooth
                    -moz-transition: $smooth
                    -ms-transition: $smooth
                    -o-transition: $smooth
        .add-file
            float: right
            top: 15px
            position: absolute
            right: 20px
            margin-left: 20px
            cursor: pointer
            line-height: 1.8
        .action
            float: right
            margin: 15px 20px 0
            padding: 0
            visibility: hidden
            right: 35px
            position: absolute
            &.active
                visibility: visible
            li
                margin-left: 20px
                cursor: pointer
        ul
            display: inline-flex
            float: left
            list-style: none
            padding: 0 20px
            line-height: 1.8
            &.path
    >.wrapper
        height: 100vh
        display: flex
        @media (max-width: 800px)
            margin-top: 60px
            position: fixed
            width: 100%
        >.panel-content
            width: 30%
            @media(max-width: 800px)
                display: none
            &.file-tree
                display: none
                @media(max-width: 800px)
                    display: block
            @media(max-width: 800px)
                position: absolute
                z-index: 1
                height: 100%
                width: 240px
                background: #2d125b
                box-shadow: -6px 9px 19px 0px rgb(19, 9, 37)
        >.store-content
            width: 100%
            overflow: scroll
            position: relative
            margin-bottom: 25vh
            &.dragarea
                overflow: inherit
            .dragfile
                position: absolute
                height: 100vh
                background: rgba(35, 16, 68, 0.85)
                display: none
                &.dragarea
                    display: block
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
        .header-table, .table-row
            text-align: left
            height: 40px
            box-sizing: border-box
            left: 0
            top: 0
            width: 100%
            .cell
                font-size: 12px
                padding: 10px 15px
                margin: 0
                display: inline-block
                vertical-align: top
                box-sizing: border-box
                overflow-y: hidden
                text-overflow: ellipsis
                white-space: nowrap
                overflow: hidden
                &.network
                    width: 50%
                    text-align: left
                &.txhash
                    width: 30%
                    text-align: center
                &.amount
                    width: 20%
                    text-align: right
                &.file
                    width: 50%
                    text-align: left
                    display: inline-flex
                    img
                        width: 20px
                        height: 15px
                        margin-right: 10px
                &.folder
                    width: 60%
                    text-align: left
                    display: inline-flex
                    img
                        width: 20px
                        height: 15px
                        margin-right: 10px
                &.indent
                    width: 10%
                &.empty
                    visibility: hidden
                &.date
                    width: 30%
                    text-align: center
                &.size
                    width: 20%
                    text-align: right
        .table-row
            &:hover
                cursor: pointer
                background: rgba(75, 40, 136, 0.2)
            &.active
                background: rgba(75, 40, 136, 0.2)
            .arrow
                transition: all .5s
            &.arrow-down
                .arrow
                    transform: rotate(90deg)
                    transition: all .5s
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
filestorage = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    switch-progress = ->
        store.current.progress = not store.current.progress
    hide-progress =
        if store.current.progress then \hide-progress else \ ""
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    action = ->
        store.current.active = not store.current.active
    active =
        if store.current.active then \active else \ ""
    dragarea =
        if store.current.dragfile then \dragarea else \ ""
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
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
    lightText=
        color: info.app.color3
    icon-style=
        filter: info.app.nothingIcon
    dragarea-bg=
        background: info.app.dragarea
    expand-collapse = ->
        store.filestore.menu-open = not store.filestore.menu-open
        store.current.dragfile = not store.current.dragfile
    open-tree = ->
        store.filestore.file-tree = not store.filestore.file-tree
    active-folder =
        if store.filestore.file-tree then \arrow-down else \ ""
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.filestore
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") File Storage
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        .pug.toolbar(style=border-style)
            span.files.pug(on-click=switch-files class="#{file-tree}")
                img.pug(src="#{icons.file-side-menu}")
            ul.path.pug
                li.pug
                    span.pug Files  #{store.filestore.path} 
                li.pug
                    span.pug Documents
            span.add-file.pug(on-click=expand-collapse)
                icon "Plus", 20
            ul.action.pug(class="#{active}")
                li.pug
                    span.pug
                        icon "CloudDownload", 20
                li.pug
                    span.pug
                        icon "LinkExternal", 20
                li.pug
                    span.pug
                        icon "Trashcan", 20
            if store.filestore.menu-open
                .pug.menu(style=filter-body)
                    .pug.middle
                        .pug.table-row-menu
                            .col.folder-menu.pug
                                span.pug
                                    icon "CloudDownload", 20
                                .pug Folder
                        .pug.table-row-menu
                            .col.folder-menu.pug
                                span.pug
                                    icon "CloudDownload", 20
                                .pug Upload Files
                        .pug.table-row-menu
                            .col.folder-menu.pug
                                span.pug
                                    icon "CloudDownload", 20
                                .pug Upload Folder
        .pug.wrapper
            .pug.panel-content(style=border-right class="#{file-tree}")
                .pug.table-row(on-click=open-tree class="#{active-folder}")
                    .cell.arrow.pug
                        icon "ChevronRight", 20
                    .cell.folder.pug
                        img.pug(src="#{icons.file-folder}")
                        .pug Files
                if store.filestore.file-tree
                    .pug.table-row
                        .cell.indent.pug
                        .cell.arrow.pug
                            icon "ChevronRight", 20
                        .cell.folder.pug
                            img.pug(src="#{icons.file-folder}")
                            .pug Images
            .pug.store-content(class="#{dragarea}")
                .header-table.dragfile.pug(class="#{dragarea}" style=dragarea-bg)
                    .pug.cell.network(style=dashed-border)
                        img.pug.bounce(src="#{icons.file-drag}" style=icon-style)
                        | Drag and Drop here
                        br.pug
                        | or
                        span.pug Browse files
                .header-table.pug(style=header-table-style)
                    span.pug.cell.network(style=lightText) Name
                    span.pug.cell.txhash(style=lightText) Date Modified
                    span.pug.cell.amount(style=lightText) File Size
                .pug.table-row(on-click=action class="#{active}")
                    .cell.file.pug
                        img.pug(src="#{store.filestore.extension-icons.txt}")
                        .pug File.txt
                    .cell.date.pug
                        .pug 16/03/2020
                    .cell.size.pug
                        .pug 2 KB
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
module.exports = filestorage