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
    \./videoupload.ls
    #cannot upload file using crossfetch
    # \cross-fetch : fetch
}
#TODO: move to utils
as-callback = (p, cb)->
    p.catch (err) -> cb err
    p.then (data)->
        cb null, data
json-parse = (text, cb)->
    try
        cb null, JSON.parse(text)
    catch err
        cb err
# .videostorage1812653883
#     @import scheme
#     $border-radius: $border
#     $smooth: opacity .15s ease-in-out
#     position: relative
#     display: block
#     width: auto
#     overflow: hidden
#     margin-left: 60px
#     top: 0
#     height: 100%
#     min-height: 100vh
#     padding-top: 5%
#     box-sizing: border-box
#     padding: 0px
#     background: transparent
#     .active-download
#         bottom: 10px
#         right: 10px
#         width: 226px
#         background: #321260
#         position: fixed
#         display: inline-grid
#         z-index: 3
#         >.hide-progress
#             display: none
#         .file-name
#             text-overflow: ellipsis
#             overflow: hidden
#             width: 90px
#         progress
#             width: 45px
#             height: 16px
#         .pending
#             opacity: .5
#         .progress
#             float: right
#         .cancel
#             text-transform: uppercase
#             float: right
#             cursor: pointer
#             font-weight: 600
#             font-size: 11px !important
#             text-align: right
#             color: #6f6fe2 !important
#         .action
#             position: absolute
#             right: 0px
#             li
#                 display: inline-block
#                 margin-left: 12px
#                 cursor: pointer
#                 &.hide-progress
#                     transform: rotate(180deg)
#         .top
#             border: 0
#         img
#             width: 20px
#             height: 15px
#             margin-right: 10px
#         .col
#             font-size: 12px
#             padding: 10px 15px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             color: rgb(204, 204, 204)
#             overflow-y: hidden
#             &.folder-menu
#                 text-align: left
#                 display: inline-flex
#                 span
#                     margin-right: 10px
#         .table-row-menu
#             text-align: left
#             &.active
#                 background: rgba(75, 40, 136, 0.2)
#         .bottom, .middle
#             padding: 10px
#         .middle
#             button
#                 outline: none
#                 cursor: pointer
#                 border: 1px solid
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 padding: 0 6px
#                 height: 36px
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 100%
#                 margin: 0 auto
#                 opacity: 1
#                 margin-top: 10px
#     .menu
#         width: 160px
#         background: #321260
#         position: absolute
#         top: 188px
#         right: 0px
#         display: inline-grid
#         z-index: 3
#         .col
#             font-size: 12px
#             padding: 10px 15px
#             margin: 0
#             display: inline-block
#             vertical-align: top
#             box-sizing: border-box
#             color: rgb(204, 204, 204)
#             overflow-y: hidden
#             &.folder-menu
#                 text-align: left
#                 display: inline-flex
#                 span
#                     margin-right: 10px
#         .table-row-menu
#             text-align: left
#             &:hover
#                 cursor: pointer
#                 background: rgba(75, 40, 136, 0.2)
#             &.active
#                 background: rgba(75, 40, 136, 0.2)
#         .bottom, .middle
#             padding: 10px
#         .middle
#             button
#                 outline: none
#                 cursor: pointer
#                 border: 1px solid
#                 padding: 0
#                 box-sizing: border-box
#                 border-radius: $border
#                 font-size: 10px
#                 padding: 0 6px
#                 height: 36px
#                 color: #6CA7ED
#                 text-transform: uppercase
#                 font-weight: bold
#                 background: transparent
#                 transition: all .5s
#                 text-overflow: ellipsis
#                 overflow: hidden
#                 width: 100%
#                 margin: 0 auto
#                 opacity: 1
#                 margin-top: 10px
#     @media(max-width:800px)
#         width: 100%
#         margin: 0
#     .search-input
#         position: fixed
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         z-index: 1
#         width: 100%
#         .add
#             line-height: 35px
#             cursor: pointer
#             position: absolute
#             right: 80px
#             @media(max-width:800px)
#                 right: 20px
#         .close
#             line-height: 2.4
#             cursor: pointer
#             width: 20px
#             margin-right: 20px
#             img
#                 height: 15px
#                 width: 15px
#     @media(max-width:800px)
#         width: 100%
#         margin: 0
#     .search-field
#         .left
#             position: relative
#         .icon
#             position: absolute
#             top: 1px
#             right: 0
#             background: #532b94
#             padding: 8px 20px 9px
#     .section
#         border-bottom: 1px solid rgba(240, 237, 237, 0.16)
#         padding: 15px 20px 15px
#         display: flex
#         width: 100%
#         @media(max-width: 800px)
#             width: auto
#         img
#             width: 100%
#             height: 140px
#             opacity: .8
#             transition: .5s
#             &.icon-svg-video
#                 position: relative
#                 height: 12px
#                 top: 2px
#                 width: auto
#             &.icon-svg-menu
#                 height: 12px
#                 margin-right: 10px
#                 width: auto
#         &.filter
#             padding: 0px
#         &:last-child
#             border: 0
#         .title
#             padding: 0px
#             width: 25%
#             text-align: left
#             font-size: 14px
#             @media(max-width: 800px)
#                 display: none
#             h2
#                 font-family: 'Roboto', sans-serif
#             h3, h2
#                 margin: 0
#                 line-height: 36px
#                 font-weight: 400
#         .description
#             padding: 0px
#             font-size: 14px
#             width: 40%
#             text-align: left
#             &.tabs
#                 overflow: hidden
#                 ul
#                     overflow-x: scroll
#                     scrollbar-width: none
#                     white-space: nowrap
#             @media(max-width: 800px)
#                 width: 80%
#             ul
#                 list-style: none
#                 padding: 0
#                 margin: 10px 0 0
#                 li
#                     display: inline-block
#                     padding: 15px
#                     cursor: pointer
#                     &:first-child
#                         padding-left: 0
#                     .icon
#                         margin-right: 5px
#                         svg
#                             vertical-align: middle !important
#                     &.active
#                         color: #c671f1
#                         border-bottom: 1px solid
#                         padding-bottom: 15px
#             input
#                 outline: none
#                 width: 100%
#                 box-sizing: border-box
#                 height: 36px
#                 line-height: 36px
#                 border-radius: $border-radius
#                 padding: 0px 10px
#                 font-size: 14px
#                 margin: 1px
#                 border: 0px
#                 box-shadow: none
#     button
#         background-color: $primary
#         border: 1px solid $primary
#         border-radius: $border
#         color: white
#         height: 36px
#         width: 104px
#         margin-top: 5px
#         padding: 0 6px
#         text-decoration: none
#         text-transform: uppercase
#         font-size: 10px
#         font-weight: bold
#         cursor: pointer
#         outline: none
#         display: inline-block
#         text-overflow: ellipsis
#         overflow: hidden
#         white-space: nowrap
#         &:hover
#             background: transparent
#             color: $primary
#         &.link
#             min-width: 190px
#         float: right
#         margin-top: 12px
#         margin-right: 10px
#     >.title
#         position: sticky
#         position: -webkit-sticky
#         background: linear-gradient(100deg, #331462 4%, #15063c 100%)
#         box-sizing: border-box
#         top: 0
#         width: 100%
#         color: gray
#         font-size: 22px
#         padding: 10px
#         height: 60px
#         z-index: 2
#         >.header
#             margin: 5px
#             text-align: center
#             @media(max-width:800px)
#                 text-align: center
#         >.close
#             position: absolute
#             font-size: 20px
#             left: 20px
#             top: 13px
#             cursor: pointer
#             &:hover
#                 color: #CCC
#     >.toolbar
#         position: relative
#         height: 60px
#         ul
#             display: inline-flex
#             float: left
#             list-style: none
#             padding: 0 20px
#             line-height: 1.8
#             &.path
#     >.wrapper
#         height: calc(100vh - 190px)
#         display: flex
#         flex-wrap: wrap
#         overflow-y: scroll
#         scrollbar-width: none
#         padding: 0
#         margin-top: 69px
#         >.panel-content
#             margin-left: 180px
#             padding: 20px
#             box-sizing: border-box
#             width: 100%
#             .block-content
#                 padding-bottom: 20px
#                 margin-bottom: 20px
#             &.dragarea
#                 overflow: inherit
#             &.subscr
#                 display: grid
#             &.file-tree
#                 margin-left: 0px
#                 @media(max-width: 800px)
#                     margin-left: 0px
#             .dragfile
#                 position: absolute
#                 height: 100vh
#                 background: rgba(35, 16, 68, 0.85)
#                 display: none
#                 &.dragarea
#                     display: block
#                     width: calc(100% - 180px)
#                     display: block
#                     top: 190px
#                     left: 181px
#                     z-index: 2
#                     @media(max-width:800px)
#                         left: 0
#                         width: 100%
#                 div
#                     top: 10rem
#                     text-align: center !important
#                     position: relative
#                     width: 60% !important
#                     padding: 50px 20px
#                     border: 1px dashed
#                     margin: 0 auto
#                     display: block
#                     @media (max-width: 800px)
#                         width: 80% !important
#                     img
#                         display: block
#                         width: 40px
#                         margin: 0 auto 20px
#                     span
#                         color: #6f6fe2
#                         cursor: pointer
#                         display: block
#             iframe
#                 width: 100%
#                 height: 150px
#             @media(max-width: 800px)
#                 width: 100%
#                 margin-left: 0
#             .results
#                 text-align: left
#                 font-size: 13px
#                 margin: 0
#             .header
#                 text-align: left
#                 font-size: 18px
#                 font-weight: 400
#                 margin: 0 0 20px
#             .section
#                 padding: 0 15px 0 0
#                 display: inline-block
#                 width: 25%
#                 min-width: 205px
#                 min-height: 230px
#                 border: 0
#                 box-sizing: border-box
#                 vertical-align: text-top
#                 margin-bottom: 20px
#                 float: left
#                 @media(max-width:800px)
#                     &:nth-child(odd)
#                         padding: 0
#                     width: 50%
#                 @media(max-width:640px)
#                     width: 100%
#                     padding: 0
#                 .play
#                     @media(max-width:800px)
#                         top: 120px !important
#                 iframe
#                     @media(max-width:800px)
#                         height: 240px
#                 .source
#                     cursor: pointer
#                     position: relative
#                     .title-video
#                         display: flex
#                         .account
#                             border-radius: 50px
#                             width: 20px
#                             height: 20px
#                             padding: 10px
#                             margin-top: 5px
#                             background: #4b2788
#                             margin-right: 10px
#                     .play
#                         width: 100%
#                         height: 150px
#                         display: block
#                         line-height: 43px
#                         border-radius: 0
#                         position: absolute
#                         z-index: 1
#                         top: 80px
#                         left: 50%
#                         margin-right: -50%
#                         transform: translate(-50%, -50%)
#                         opacity: 0
#                         transition: .5s
#                         svg
#                             width: 30px
#                             height: 30px
#                             background: rgba(102, 51, 153, 0.55)
#                             padding: 10px
#                             border-radius: 50px
#                             margin-top: 43px
#                     &:hover
#                         .play
#                             opacity: 1
#                             transition: .5s
#                         img
#                             opacity: 1
#                             transition: .5s
#                         .header
#                             text-decoration: underline
#                 &.developing
#                     opacity: .5
#                     .source
#                         cursor: pointer
#                         &:hover
#                             .header, .address
#                                 text-decoration: none
#                                 cursor: not-allowed
#                 .address, .header, .description
#                     width: 100%
#                     text-align: left
#                     margin: 5px 0
#                 .address
#                     color: #969696
#                     font-size: 13px
#                     cursor: pointer
#                 .header
#                     font-weight: 500
#                     color: #fff
#                     font-size: 17px
#                     cursor: pointer
#                     -webkit-line-clamp: 2
#                     -webkit-box-orient: vertical
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     display: block
#                     display: -webkit-box
#                 .description
#                     opacity: .8
#                     line-height: 1.6
#                     font-size: 13px
#                 ul.stat
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                     li
#                         display: inline-block
#                         margin-left: 4px
#                         cursor: pointer
#                         + li
#                             &:before
#                                 content: ' · '
#                         &:first-child
#                             margin-left: 0
#         >.similarvideo
#             margin-left: 180px
#             padding: 20px
#             width: 100%
#             box-sizing: border-box
#             &.file-tree
#                 margin-left: 0px
#                 @media(max-width: 800px)
#                     margin-left: 0px
#             iframe
#                 width: 25%
#                 height: 140px
#             .content-right
#                 width: 60%
#                 margin-left: 20px
#                 @media screen and (max-width: 800px)
#                     width: 100%
#             img
#                 width: 100%
#                 height: 140px
#                 opacity: .8
#                 transition: .5s
#                 &.icon-svg-play
#                     height: 50px
#                     width: 70px
#                     margin-top: 45px
#                     margin-left: 13px
#             @media(max-width: 800px)
#                 width: 100%
#                 margin-left: 0
#             .results
#                 text-align: left
#                 font-size: 13px
#                 margin: 0
#             .header
#                 text-align: left
#                 font-size: 18px
#                 font-weight: 400
#                 margin: 0 0 20px
#             .section
#                 padding: 0
#                 display: inline-block
#                 width: 100%
#                 min-width: 205px
#                 min-height: auto
#                 border: 0
#                 box-sizing: border-box
#                 vertical-align: text-top
#                 margin-bottom: 20px
#                 float: left
#                 .source
#                     cursor: pointer
#                     position: relative
#                     display: flex
#                     .play
#                         width: 30%
#                         height: 140px
#                         display: block
#                         line-height: 43px
#                         border-radius: 0
#                         position: absolute
#                         z-index: 1
#                         top: 70px
#                         left: 12%
#                         margin-right: -50%
#                         transform: translate(-50%, -50%)
#                         opacity: 0
#                         transition: .5s
#                         svg
#                             width: 30px
#                             height: 30px
#                             background: rgba(102, 51, 153, 0.55)
#                             padding: 10px
#                             border-radius: 50px
#                             margin-top: 43px
#                     &:hover
#                         .play
#                             opacity: 1
#                             transition: .5s
#                         img
#                             opacity: 1
#                             transition: .5s
#                         .header
#                             text-decoration: underline
#                 &.developing
#                     opacity: .5
#                     .source
#                         cursor: pointer
#                         &:hover
#                             .header, .address
#                                 text-decoration: none
#                                 cursor: not-allowed
#                 .address, .header, .description
#                     width: 100%
#                     text-align: left
#                     margin: 5px 0
#                 .address
#                     color: #969696
#                     font-size: 13px
#                     cursor: pointer
#                 .header
#                     font-weight: 500
#                     color: #fff
#                     font-size: 17px
#                     cursor: pointer
#                     -webkit-line-clamp: 2
#                     -webkit-box-orient: vertical
#                     overflow: hidden
#                     text-overflow: ellipsis
#                     display: block
#                     display: -webkit-box
#                 .description
#                     opacity: .8
#                     line-height: 1.6
#                     font-size: 13px
#                 ul.stat
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                 ul.stat-text
#                     list-style: none
#                     padding: 0
#                     margin-bottom: 0
#                     color: #969696
#                     font-size: 13px
#                     text-align: left
#                     margin-top: 0
#                     padding-top: 8px
#                     li
#                         display: inline-block
#                         margin-left: 4px
#                         cursor: pointer
#                         + li
#                             &:before
#                                 content: ' · '
#                         &:first-child
#                             margin-left: 0
#         >.menu-content
#             width: 180px
#             position: fixed
#             box-sizing: border-box
#             @media(max-width: 800px)
#                 display: none
#             &.file-tree
#                 display: none
#                 @media(max-width: 800px)
#                     display: none
#             .tabs
#                 height: 100vh
#                 ul
#                     overflow-x: scroll
#                     scrollbar-width: none
#                     text-align: left
#             @media(max-width: 800px)
#                 width: 100%
#             ul
#                 list-style: none
#                 margin: 0
#                 padding: 0
#                 li
#                     display: inline-block
#                     padding: 15px 25px
#                     font-size: 14px
#                     cursor: pointer
#                     width: 100%
#                     box-sizing: border-box
#                     transition: .5s
#                     .icon
#                         margin-right: 15px
#                         svg
#                             vertical-align: middle !important
#                     &.active
#                         color: #c671f1
#                         background: rgb(67, 32, 124)
#                         padding-bottom: 15px
#                         img
#                             filter: grayscale(100%) brightness(40%) sepia(120%) hue-rotate(-140deg) saturate(790%) contrast(0.5)
#                     &:hover
#                         background: rgb(67, 32, 124)
#                         padding-bottom: 15px
#                         transition: .5s
#     .iron
#         -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
#         -webkit-mask-size: 50%
#         animation: shine 2s infinite
#         .logo
#             padding: 6px
#             width: 20px
#             height: 10px
#             display: inline-block
#             background: #ba68e6
#             line-height: 0px
#             text-align: center
#             vertical-align: text-top
#             border-radius: 5px
#             margin-top: 3px
#             svg
#                 vertical-align: top !important
#     @keyframes shine
#         0%
#             -webkit-mask-position: right
#         100%
#             -webkit-mask-position: left
#     .bounce
#         animation: bounce_9418 3.6s ease infinite
#         transform-origin: 50% 50%
#     @keyframes bounce_9418
#         0%
#             transform: translateY(0)
#         5.55556%
#             transform: translateY(0)
#         11.11111%
#             transform: translateY(0)
#         22.22222%
#             transform: translateY(-5px)
#         27.77778%
#             transform: translateY(0)
#         33.33333%
#             transform: translateY(-5px)
#         44.44444%
#             transform: translateY(0)
#         100%
#             transform: translateY(0)
menu = (store, web3t)->
    info = get-primary-info store
    drag-file = ->
        store.video.drag = not store.video.drag
        store.video.menu-open = not store.video.menu-open
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    open-upload-link = ->
        store.video.upload-link = yes
    react.create-element 'div', { style: filter-body, className: 'menu' }, children =
        react.create-element 'div', { className: 'middle' }, children =
            react.create-element 'div', { on-click: open-upload-link, className: 'table-row-menu' }, children =
                react.create-element 'div', { className: 'col folder-menu' }, children =
                    react.create-element 'span', {}, children =
                        react.create-element 'img', { src: "#{icons.add-video}", className: 'icon-svg' }
                        """ Upload link"""
            react.create-element 'div', { on-click: drag-file, className: 'table-row-menu' }, children =
                react.create-element 'div', { className: 'col folder-menu' }, children =
                    react.create-element 'span', {}, children =
                        react.create-element 'img', { src: "#{icons.add-video}", className: 'icon-svg' }
                        """ Upload video"""
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
    react.create-element 'div', { className: "#{file-tree} panel-content dragarea" }, children =
        if store.video.drag
            react.create-element 'div', { on-click: drag-file-close, className: 'header-table dragfile dragarea', on-drop: upload-video-files, on-drag-over: (ev) -> ev.prevent-default! }, children =
                react.create-element 'div', { style: dashed-border, className: 'cell network' }, children =
                    react.create-element 'img', { src: "#{icons.img-drag}", style: icon-style, className: 'bounce' }
                    """ Drag and Drop here"""
                    react.create-element 'br', {}
                    """ or"""
                    react.create-element 'input', {id: 'browse-files-video', type: 'file', multiple: yes, on-change: upload-video-files, style: {visibility: \hidden, width: 0, height: 0} }
                    react.create-element 'span', {on-click: -> (document.get-element-by-id 'browse-files-video').click!}, ' Browse files'
        react.create-element 'h2', { className: 'header' }, ' Recommended'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'div', { className: 'title-video' }, children =
                    react.create-element 'span', {}, children =
                        react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                    react.create-element 'span', {}, children =
                        react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                        react.create-element 'ul', { className: 'stat' }, children =
                            react.create-element 'li', {}, children =
                                react.create-element 'span', {}, ' 2K views'
                            react.create-element 'li', {}, children =
                                react.create-element 'span', {}, ' 5 days ago'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'div', { className: 'title-video' }, children =
                    react.create-element 'span', {}, children =
                        react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                    react.create-element 'span', {}, children =
                        react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                        react.create-element 'ul', { className: 'stat' }, children =
                            react.create-element 'li', {}, children =
                                react.create-element 'span', {}, ' 50K views'
                            react.create-element 'li', {}, children =
                                react.create-element 'span', {}, ' 1 mounth ago'
trend = (store, web3t)->
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
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    react.create-element 'div', { className: "#{file-tree} similarvideo" }, children =
        react.create-element 'h2', { className: 'header' }, ' Trending'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' How to setup New Velas Web Wallet Tutorial'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 122 views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 5 days ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 1.4K views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 8 mounths ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
subscr = (store, web3t)->
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
    react.create-element 'div', { className: "#{file-tree} panel-content dragarea subscr" }, children =
        if store.video.drag
            react.create-element 'div', { on-click: drag-file-close, className: 'header-table dragfile dragarea' }, children =
                react.create-element 'div', { style: dashed-border, className: 'cell network' }, children =
                    react.create-element 'img', { src: "#{icons.img-drag}", style: icon-style, className: 'bounce' }
                    """ Drag and Drop here"""
                    react.create-element 'br', {}
                    """ or"""
                    react.create-element 'span', {}, ' Browse files'
        react.create-element 'div', { style: header-style-light, className: 'block-content' }, children =
            react.create-element 'h2', { className: 'header' }, ' Today'
            react.create-element 'div', { className: 'section' }, children =
                react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                    react.create-element 'span', { className: 'play' }, children =
                        icon \TriangleRight, 15
                    react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                    react.create-element 'div', { className: 'title-video' }, children =
                        react.create-element 'span', {}, children =
                            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                        react.create-element 'span', {}, children =
                            react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                            react.create-element 'ul', { className: 'stat' }, children =
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 2K views'
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 5 days ago'
            react.create-element 'div', { className: 'section' }, children =
                react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                    react.create-element 'span', { className: 'play' }, children =
                        icon \TriangleRight, 15
                    react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                    react.create-element 'div', { className: 'title-video' }, children =
                        react.create-element 'span', {}, children =
                            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                        react.create-element 'span', {}, children =
                            react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                            react.create-element 'ul', { className: 'stat' }, children =
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 50K views'
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 1 mounth ago'
            react.create-element 'div', { className: 'section' }, children =
                react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                    react.create-element 'span', { className: 'play' }, children =
                        icon \TriangleRight, 15
                    react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                    react.create-element 'div', { className: 'title-video' }, children =
                        react.create-element 'span', {}, children =
                            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                        react.create-element 'span', {}, children =
                            react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                            react.create-element 'ul', { className: 'stat' }, children =
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 2K views'
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 5 days ago'
        react.create-element 'div', { style: header-style-light, className: 'block-content' }, children =
            react.create-element 'h2', { className: 'header' }, ' Yesterday'
            react.create-element 'div', { className: 'section' }, children =
                react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                    react.create-element 'span', { className: 'play' }, children =
                        icon \TriangleRight, 15
                    react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                    react.create-element 'div', { className: 'title-video' }, children =
                        react.create-element 'span', {}, children =
                            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                        react.create-element 'span', {}, children =
                            react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                            react.create-element 'ul', { className: 'stat' }, children =
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 2K views'
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 5 days ago'
            react.create-element 'div', { className: 'section' }, children =
                react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                    react.create-element 'span', { className: 'play' }, children =
                        icon \TriangleRight, 15
                    react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                    react.create-element 'div', { className: 'title-video' }, children =
                        react.create-element 'span', {}, children =
                            react.create-element 'img', { src: "#{info.branding.logo}", className: 'account' }
                        react.create-element 'span', {}, children =
                            react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                            react.create-element 'ul', { className: 'stat' }, children =
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 50K views'
                                react.create-element 'li', {}, children =
                                    react.create-element 'span', {}, ' 1 mounth ago'
history = (store, web3t)->
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
    switch-files = ->
        store.current.files = not store.current.files
    file-tree =
        if store.current.files then \file-tree else \ ""
    react.create-element 'div', { className: "#{file-tree} similarvideo" }, children =
        react.create-element 'h2', { className: 'header' }, ' Watch history'
        react.create-element 'h2', { className: 'header' }, ' Today'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' How to setup New Velas Web Wallet Tutorial'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 122 views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 5 days ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 1.4K views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 8 mounths ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
        react.create-element 'h2', { className: 'header' }, ' Yesterday'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/2jdA5EwQV9M', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' How to setup New Velas Web Wallet Tutorial'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 122 views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 5 days ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
        react.create-element 'div', { className: 'section' }, children =
            react.create-element 'div', { on-click: goto-details, className: 'source' }, children =
                react.create-element 'span', { className: 'play' }, children =
                    icon \TriangleRight, 15
                react.create-element 'iframe', { on-click: goto-details, width: '560', height: '315', src: 'https://www.youtube.com/embed/USGLlp-zfhI', frameborder: '0', allow: 'accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture', allowfullscreen: '' }
                react.create-element 'span', { className: 'content-right' }, children =
                    react.create-element 'div', { className: 'header' }, ' Velas Explainer Video'
                    react.create-element 'ul', { className: 'stat' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 1.4K views'
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' 8 mounths ago'
                    react.create-element 'ul', { className: 'stat-text' }, children =
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, ' Velas blockchain uses AI-enhanced DPOS (AIDPOS) consensus for high volume transactions processing without sacrificing decentralization and security.'
make-video-thumbnail = (file, cb) ->
    url = URL.createObjectURL file
    video = document.create-element 'video'
    timeupdate = ->
        if snap-image!
            video.remove-event-listener 'timeupdate', timeupdate
            video.pause!
    video.add-event-listener 'loadeddata', ->
        if snap-image!
            video.remove-event-listener 'timeupdate', timeupdate
    video.add-event-listener 'error', ->
        if cb and not cb.is-callback-called
            cb null
            cb.is-callback-called = yes
    snap-image = ->
        canvas = document.create-element 'canvas'
        canvas.width = video.video-width;
        canvas.height = video.video-height;
        (canvas.get-context '2d').draw-image video, 0, 0, canvas.width, canvas.height
        image = canvas.to-dataURL!
        success = image.length > 1000
        if success
            img = document.create-element 'img'
            img.src = image
            (document.get-elements-by-tag-name 'div').0.append-child img
            URL.revoke-objectURL url
            if cb and not cb.is-callback-called
                cb (image.split ',').1
                cb.is-callback-called = yes
        else
            if cb and not cb.is-callback-called
                cb null
                cb.is-callback-called = yes
        return success
    video.add-event-listener 'timeupdate', timeupdate
    video.preload = 'metadata'
    video.src = url
    video.muted = yes
    video.plays-inline = yes
    video.play!
upload-video-files-recursive = ([file, ...files], cb)->
    data <- make-video-thumbnail file
    console.log data
    form-data = new Form-data
    formData.append 'key', '3132333435363738393031323334353637383930313233343536373839303132'
    formData.append 'video', file
    params =
        headers:
            'Accept': 'application/json'
            # 'Content-Type': 'multipart/form-data'
        method: \POST
        body: formData
    url = 'http://127.0.0.1:8080/upload'
    p = fetch url, params
    err, data <- as-callback p
    return cb err if err?
    return cb "expected data" if not data?
    err, text <- as-callback data.text!
    return cb err if err?
    console.log text
    err, body <- json-parse text
    return cb err if err?
    cb null, { body, text }
    return null if files.length is 0
    return upload-video-files-recursive files,cb
upload-video-files = (event) ->
    files = event.target.files or event.data-transfer.files
    return null if files.length is 0
    err, data <- upload-video-files-recursive files
video = (store, web3t)->
    react.create-element 'div', { className: 'panel-content' }, children =
        react.create-element 'p', { className: 'results' }, ' Upload your video(s)'
        react.create-element 'input', { type: 'file', multiple: yes, on-change: upload-video-files }
videostorage = ({ store, web3t })->
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
    activate-trend = activate \trend
    activate-subscr = activate \subscr
    activate-history = activate \history
    activate-video = activate \video
    active-class = (tab)->
        if store.video.tab is tab then 'active' else ''
    active-home = active-class \home
    active-trend = active-class \trend
    active-subscr = active-class \subscr
    active-history = active-class \history
    active-video = active-class \video
    expand-collapse = ->
        store.video.menu-open = not store.video.menu-open
    show-class =
        if store.current.open-menu then \hide else \ ""
    open-upload-link = ->
        store.video.upload-link = yes
    react.create-element 'div', { className: 'videostorage videostorage1812653883' }, children =
        videoupload { store, web3t }
        react.create-element 'div', { style: filter-body, className: 'active-download' }, children =
            react.create-element 'div', { style: header-table-style, className: 'top' }, children =
                react.create-element 'div', { className: 'table-row-menu' }, children =
                    react.create-element 'span', { className: 'col folder-menu' }, children =
                        react.create-element 'div', {}, ' Uploading 1 item'
                    react.create-element 'ul', { className: "#{active} action col" }, children =
                        react.create-element 'li', { on-click: switch-progress, className: "#{hide-progress}" }, children =
                            react.create-element 'span', {}, children =
                                icon "ChevronDown", 15
                        react.create-element 'li', {}, children =
                            react.create-element 'span', {}, children =
                                icon \X, 15
            react.create-element 'div', { style: header-table-style, className: "#{hide-progress}" }, children =
                react.create-element 'div', { className: 'table-row-menu' }, children =
                    react.create-element 'span', { className: 'col folder-menu' }, children =
                        react.create-element 'div', {}, ' Left 7min.'
                    react.create-element 'span', { className: 'col cancel' }, ' Cancel'
            react.create-element 'div', { className: "#{hide-progress}" }, children =
                react.create-element 'div', { className: 'table-row-menu' }, children =
                    react.create-element 'div', { className: 'col folder-menu pending' }, children =
                        react.create-element 'img', { src: "#{store.filestore.extension-icons.txt}" }
                        react.create-element 'div', { className: 'file-name' }, ' File.txt'
                    react.create-element 'div', { className: 'col folder-menu progress' }, children =
                        react.create-element 'progress', { value: "30", max: "100" }
        react.create-element 'div', { style: border-style2, className: 'title alert' }, children =
            react.create-element 'div', { className: 'header' }, ' This page is under development. You see this only as demo'
        react.create-element 'div', { style: border-style, className: 'title' }, children =
            react.create-element 'div', { className: "#{show-class} header" }, ' Video storage'
            react.create-element 'div', { on-click: goto-search, className: 'close' }, children =
                react.create-element 'img', { src: "#{icons.arrow-left}", className: 'icon-svg' }
            epoch store, web3t
            switch-account store, web3t
        if store.video.menu-open
            menu store, web3t
        react.create-element 'div', { className: 'search-input' }, children =
            react.create-element 'div', { style: border-style, className: 'section' }, children =
                react.create-element 'span', { on-click: switch-files, className: 'close' }, children =
                    react.create-element 'img', { src: "#{icons.menu}", className: 'icon-svg-video' }
                react.create-element 'span', { on-click: expand-collapse, className: 'add' }, children =
                    react.create-element 'img', { src: "#{icons.video}", className: 'icon-svg-video' }
                react.create-element 'div', { className: 'title' }, children =
                    react.create-element 'h2', { className: 'iron' }, children =
                        react.create-element 'span', { className: 'logo' }, children =
                            icon \TriangleRight, 10
                        react.create-element 'span', {}, ' Vtube'
                react.create-element 'div', { className: 'description search-field' }, children =
                    react.create-element 'div', { className: 'left' }, children =
                        react.create-element 'input', { type: 'text', style: input-style, value: "velas", placeholder: "velas" }
                        react.create-element 'div', { className: 'icon' }, children =
                            icon \Search, 15
        react.create-element 'div', { className: 'wrapper' }, children =
            react.create-element 'div', { className: "#{file-tree} menu-content" }, children =
                react.create-element 'div', { style: border-right, className: 'section filter' }, children =
                    react.create-element 'div', { className: 'tabs' }, children =
                        react.create-element 'ul', { style: border-style }, children =
                            react.create-element 'li', { on-click: activate-home, className: "#{active-home}" }, children =
                                react.create-element 'span', { className: 'icon' }, children =
                                    react.create-element 'img', { src: "#{icons.home}", className: 'icon-svg-menu' }
                                    """ Home"""
                            react.create-element 'li', { on-click: activate-trend, className: "#{active-trend}" }, children =
                                react.create-element 'span', { className: 'icon' }, children =
                                    react.create-element 'img', { src: "#{icons.flame}", className: 'icon-svg-menu' }
                                    """ Trending"""
                            react.create-element 'li', { on-click: activate-subscr, className: "#{active-subscr}" }, children =
                                react.create-element 'span', { className: 'icon' }, children =
                                    react.create-element 'img', { src: "#{icons.subscriptions}", className: 'icon-svg-menu' }
                                    """   Subscriptions"""
                        react.create-element 'ul', { style: border-style }, children =
                            react.create-element 'li', { on-click: activate-history, className: "#{active-history}" }, children =
                                react.create-element 'span', { className: 'icon' }, children =
                                    react.create-element 'img', { src: "#{icons.history}", className: 'icon-svg-menu' }
                                    """ History"""
                            react.create-element 'li', { on-click: activate-video, className: "#{active-video}" }, children =
                                react.create-element 'span', { className: 'icon' }, children =
                                    react.create-element 'img', { src: "#{icons.u-video}", className: 'icon-svg-menu' }
                                    """ Your videos"""
            if active-home is \active
                home store, web3t
            if active-trend is \active
                trend store, web3t
            if active-subscr is \active
                subscr store, web3t
            if active-history is \active
                history store, web3t
            if active-video is \active
                video store, web3t
module.exports = videostorage