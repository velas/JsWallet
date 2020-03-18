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
}
.filestore
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:800px)
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
        position: relative
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        background: transparent
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
        height: 60px
        ul
            display: inline-flex
            float: left
            list-style: none
            padding: 0 10px
            span
                &:before
                    content: "/"
                    margin-left: 5px
    >.wrapper
        height: 100vh
        display: flex
        >.panel-content
            width: 30%
        >.store-content
            width: 70%
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
                color: rgb(204, 204, 204)
                overflow-y: hidden
                &.network
                    width: 60%
                    text-align: left
                &.txhash
                    width: 20%
                    text-align: center
                &.amount
                    width: 20%
                    text-align: right
                &.file
                    width: 60%
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
                    width: 20%
                    text-align: center
                &.size
                    width: 20%
                    text-align: right
        .table-row
            &:hover
                background: rgba(75, 40, 136, 0.2)
filestorage = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
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
        color: info.app.addressText
    file =
        folder: "data:image/png;base64,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YII"
        txt: "data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iRmxhdCIgaGVpZ2h0PSI1MTJweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTJweCI+PHBhdGggZD0ibTM5MiA0ODhoLTI3MmE0OCA0OCAwIDAgMSAtNDgtNDh2LTM2OGE0OCA0OCAwIDAgMSA0OC00OGgyMjRsOTYgOTZ2MzIwYTQ4IDQ4IDAgMCAxIC00OCA0OHoiIGZpbGw9IiNjZmQyZmMiLz48cGF0aCBkPSJtNzIgMzYwaDM2OGEwIDAgMCAwIDEgMCAwdjgwYTQ4IDQ4IDAgMCAxIC00OCA0OGgtMjcyYTQ4IDQ4IDAgMCAxIC00OC00OHYtODBhMCAwIDAgMCAxIDAgMHoiIGZpbGw9IiM1MTUzZmYiLz48ZyBmaWxsPSIjODY5MGZhIj48cGF0aCBkPSJtNDQwIDEyMGgtNDhhNDggNDggMCAwIDEgLTQ4LTQ4di00OHoiLz48cGF0aCBkPSJtMzc2IDE3NmgtMTc2YTggOCAwIDAgMSAwLTE2aDE3NmE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjgwIDIwOGgtMTQ0YTggOCAwIDAgMSAwLTE2aDE0NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI0MGgtMTI4YTggOCAwIDAgMSAwLTE2aDEyOGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzIwIDI3MmgtMTg0YTggOCAwIDAgMSAwLTE2aDE4NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMTY4IDE3NmgtMzJhOCA4IDAgMCAxIDAtMTZoMzJhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAyMDhoLTY0YTggOCAwIDAgMSAwLTE2aDY0YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMjQwaC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI3MmgtMjRhOCA4IDAgMCAxIDAtMTZoMjRhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTE4NCAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMTQ0aC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjk2IDMwNGgtODBhOCA4IDAgMCAxIDAtMTZoODBhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjwvZz48cGF0aCBkPSJtMTY4IDM4NGE4IDggMCAwIDAgLTggOHY2NGE4IDggMCAwIDAgOCA4IDQwIDQwIDAgMCAwIDAtODB6bTggNjIuNjI5di00NS4yNThhMjQgMjQgMCAwIDEgMCA0NS4yNTh6IiBmaWxsPSIjZmZmIi8+PHBhdGggZD0ibTI1NiAzODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDAgMzItMTcuOTQ0IDMyLTQwLTE0LjM1NS00MC0zMi00MHptMCA2NGMtOC42NzMgMC0xNi0xMC45OTEtMTYtMjRzNy4zMjctMjQgMTYtMjQgMTYgMTAuOTkxIDE2IDI0LTcuMzI3IDI0LTE2IDI0eiIgZmlsbD0iI2ZmZiIvPjxwYXRoIGQ9Im0zMzYgNDAwYTEwLjcwOCAxMC43MDggMCAwIDEgNC41OSAxLjA1OCA4IDggMCAxIDAgNi44Mi0xNC40NzQgMjYuNTgxIDI2LjU4MSAwIDAgMCAtMTEuNDEtMi41ODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDBhMjYuNiAyNi42IDAgMCAwIDExLjQxMS0yLjU4NCA4IDggMCAwIDAgLTYuODIyLTE0LjQ3MyAxMC43MSAxMC43MSAwIDAgMSAtNC41ODkgMS4wNTdjLTguNjczIDAtMTYtMTAuOTkxLTE2LTI0czcuMzI3LTI0IDE2LTI0eiIgZmlsbD0iI2ZmZiIvPjwvc3ZnPgo="
        doc: "data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBpZD0iRmxhdCIgaGVpZ2h0PSI1MTJweCIgdmlld0JveD0iMCAwIDUxMiA1MTIiIHdpZHRoPSI1MTJweCI+PHBhdGggZD0ibTM5MiA0ODhoLTI3MmE0OCA0OCAwIDAgMSAtNDgtNDh2LTM2OGE0OCA0OCAwIDAgMSA0OC00OGgyMjRsOTYgOTZ2MzIwYTQ4IDQ4IDAgMCAxIC00OCA0OHoiIGZpbGw9IiNjZmQyZmMiLz48cGF0aCBkPSJtNzIgMzYwaDM2OGEwIDAgMCAwIDEgMCAwdjgwYTQ4IDQ4IDAgMCAxIC00OCA0OGgtMjcyYTQ4IDQ4IDAgMCAxIC00OC00OHYtODBhMCAwIDAgMCAxIDAgMHoiIGZpbGw9IiM1MTUzZmYiLz48ZyBmaWxsPSIjODY5MGZhIj48cGF0aCBkPSJtNDQwIDEyMGgtNDhhNDggNDggMCAwIDEgLTQ4LTQ4di00OHoiLz48cGF0aCBkPSJtMzc2IDE3NmgtMTc2YTggOCAwIDAgMSAwLTE2aDE3NmE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjgwIDIwOGgtMTQ0YTggOCAwIDAgMSAwLTE2aDE0NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI0MGgtMTI4YTggOCAwIDAgMSAwLTE2aDEyOGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzIwIDI3MmgtMTg0YTggOCAwIDAgMSAwLTE2aDE4NGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMTY4IDE3NmgtMzJhOCA4IDAgMCAxIDAtMTZoMzJhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAyMDhoLTY0YTggOCAwIDAgMSAwLTE2aDY0YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMjQwaC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMzc2IDI3MmgtMjRhOCA4IDAgMCAxIDAtMTZoMjRhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTE4NCAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjxwYXRoIGQ9Im0yMTYgMTQ0aC04MGE4IDggMCAwIDEgMC0xNmg4MGE4IDggMCAwIDEgMCAxNnoiLz48cGF0aCBkPSJtMjk2IDMwNGgtODBhOCA4IDAgMCAxIDAtMTZoODBhOCA4IDAgMCAxIDAgMTZ6Ii8+PHBhdGggZD0ibTM3NiAzMDRoLTQ4YTggOCAwIDAgMSAwLTE2aDQ4YTggOCAwIDAgMSAwIDE2eiIvPjwvZz48cGF0aCBkPSJtMTY4IDM4NGE4IDggMCAwIDAgLTggOHY2NGE4IDggMCAwIDAgOCA4IDQwIDQwIDAgMCAwIDAtODB6bTggNjIuNjI5di00NS4yNThhMjQgMjQgMCAwIDEgMCA0NS4yNTh6IiBmaWxsPSIjZmZmIi8+PHBhdGggZD0ibTI1NiAzODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDAgMzItMTcuOTQ0IDMyLTQwLTE0LjM1NS00MC0zMi00MHptMCA2NGMtOC42NzMgMC0xNi0xMC45OTEtMTYtMjRzNy4zMjctMjQgMTYtMjQgMTYgMTAuOTkxIDE2IDI0LTcuMzI3IDI0LTE2IDI0eiIgZmlsbD0iI2ZmZiIvPjxwYXRoIGQ9Im0zMzYgNDAwYTEwLjcwOCAxMC43MDggMCAwIDEgNC41OSAxLjA1OCA4IDggMCAxIDAgNi44Mi0xNC40NzQgMjYuNTgxIDI2LjU4MSAwIDAgMCAtMTEuNDEtMi41ODRjLTE3LjY0NSAwLTMyIDE3Ljk0NC0zMiA0MHMxNC4zNTUgNDAgMzIgNDBhMjYuNiAyNi42IDAgMCAwIDExLjQxMS0yLjU4NCA4IDggMCAwIDAgLTYuODIyLTE0LjQ3MyAxMC43MSAxMC43MSAwIDAgMSAtNC41ODkgMS4wNTdjLTguNjczIDAtMTYtMTAuOTkxLTE2LTI0czcuMzI3LTI0IDE2LTI0eiIgZmlsbD0iI2ZmZiIvPjwvc3ZnPgo="
    .pug.filestore
        .pug.title(style=border-style2)
            .pug.header This page is under development. You see this only as demo
        .pug.title(style=border-style)
            .pug.header File Storage
            .pug.close(on-click=go-back)
                icon "ChevronLeft", 20
        .pug.toolbar(style=border-style)
            ul.pug
                li.pug
                    span.pug Files
                li.pug
                    span.pug Documents
            button.pug(style=button-primary2-style) My Store
        .pug.wrapper
            .pug.panel-content(style=border-right)
                .pug.table-row
                    .cell.arrow.pug
                        icon "ChevronDown", 20
                    .cell.folder.pug
                        img.pug(src="#{file.folder}")
                        .pug Files
                .pug.table-row
                    .cell.indent.pug
                    .cell.arrow.pug
                        icon "ChevronRight", 20
                    .cell.folder.pug
                        img.pug(src="#{file.folder}")
                        .pug Images
                .pug.table-row
                    .cell.indent.pug
                    .cell.arrow.pug.empty
                        icon "ChevronRight", 20
                    .cell.folder.pug
                        img.pug(src="#{file.folder}")
                        .pug Documents
            .pug.store-content
                .header-table.pug(style=header-table-style)
                    span.pug.cell.network(style=lightText) Name
                    span.pug.cell.txhash(style=lightText) Date Modified
                    span.pug.cell.amount(style=lightText) File Size
                .pug.table-row
                    .cell.file.pug
                        img.pug(src="#{file.txt}")
                        .pug File.txt
                    .cell.date.pug
                        .pug 16/03/2020
                    .cell.size.pug
                        .pug 2 KB
module.exports = filestorage