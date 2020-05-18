require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
    \../icons.ls
}
.manage-account
    @import scheme
    @keyframes bounceIn
        from
            opacity: 0
            transform: scale3d(0.8, 0.8, 0.8)
        to
            opacity: 1
            transform: scale3d(1, 1, 1)
    position: fixed
    width: 100%
    top: 0
    z-index: 999
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 10px
    background: rgba(black, 0.8)
    >.account-body
        max-width: 600px
        display: inline-block
        overflow: hidden
        animation-duration: 0.5s
        animation-name: bounceIn
        background: white
        width: 100%
        margin-top: 5vh
        margin-bottom: 25vh
        padding-bottom: 50px
        border-radius: $border
        position: relative
        max-height: 70vh
        box-sizing: border-box
        >.title
            position: absolute
            z-index: 999
            box-sizing: border-box
            top: 0
            width: 100%
            color: gray
            font-size: 22px
            padding: 10px
            height: 60px
            background: black
            >.subheader
                margin: 5px
            >.closed
                position: absolute
                font-size: 20px
                right: 20px
                top: 13px
                cursor: pointer
                &:hover
                    color: #CCC
        >.settings
            padding-top: 60px
            overflow-y: auto
            height: calc(65vh - 30px)
            padding: 60px 40px 0
            @media(max-width: 400px)
                padding: 60px 20px 0
            .tab
                display: flex
                list-style: none
                width: 100%
                padding: 0
                li
                    &:after
                        border-bottom: 1px solid rgba(255, 255, 255, 0.25)
                        display: block
                        content: ""
                        margin: 0px auto
                        padding-top: 10px
                        transition: all .5s
                    width: 50%
                    text-align: center
                    cursor: pointer
                    opacity: .5
                    &.active
                        opacity: 1
                        &:after
                            border-bottom: 1px solid #fff
                            display: block
                            content: ""
                            margin: 0px auto
                            padding-top: 10px
                            transition: all .5s
            .header
                height: calc(100vh - 420px)
                padding: 20px 50px 0
                @media(max-width: 480px)
                    padding: 20px 0px 0
                >img
                    width: 50px
            .title
                padding: 0px
                width: 100%
                margin: 0 auto
                text-align: center
                font-size: 2px
            .box
                input
                    width: 104px
            input
                border-radius: $border
                line-height: 36px
                text-align: center
                font-size: 13px
            .btn-area
                display: inline-block
                margin: 30px 0 0
            .content-upload
                margin: 30px 0 20px
            input
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: 0
                padding: 0px 10px
                font-size: 14px
                border: 0px
                box-shadow: none
                transition: all .5s
                margin: 10px 0 0px
                &:active, &:focus
                    transition: all .5s
                    text-align: left
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: $border
                color: white
                height: 36px
                width: 104px
                margin: 0
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
upload = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    input-style=
        background: style.app.wallet
        border: "0"
        color: style.app.text
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    button-primary4-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: 'rgb(195, 92, 95)'
    .pug
        .pug.content-upload
            | This script automatically deploys your node through the terminal.
            | This script automatically deploys your node through the terminal.
        input.pug(type="text" placeholder="link" style=input-style)
        .pug.btn-area
            button.pug(style=button-primary2-style)
                span.pug
                    img.icon-svg.pug(src="#{icons.apply}")
                    | Upload
preview = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    input-style=
        background: style.app.wallet
        border: "0"
        color: style.app.text
    color =
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    button-primary4-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: 'rgb(195, 92, 95)'
    .pug
        .pug.content-upload
            | Do not transfer this script to anyone, as it is generated in your wallet, using personal wallet data.
            | Do not transfer this script to anyone, as it is generated.
        input.pug(type="text" placeholder="link" style=input-style)
        .pug.btn-area
            button.pug(style=button-primary2-style)
                span.pug
                    img.icon-svg.pug(src="#{icons.apply}")
                    | Preview
video-upload = (store, web3t)->
    style = get-primary-info store
    icon-style=
        filter: style.app.nothingIcon
    lang = get-lang store
    activate = (step)-> ->
        store.video.action = step 
    activate-upload = activate \upload
    activate-preview = activate \preview
    active-class = (step)->
        if store.video.action is step then 'active' else ''
    active-upload = active-class \upload
    active-preview = active-class \preview
    .pug
        ul.pug.tab
            li.pug(on-click=activate-upload class="#{active-upload}") Upload
            li.pug(on-click=activate-preview class="#{active-preview}") Preview
        .pug.header
            img.pug(src="#{icons.img-drag}" style=icon-style)
            if active-upload is \active
                upload store, web3t
            if active-preview is \active
                preview store, web3t
module.exports = ({ store, web3t } )->
    return null if store.video.upload-link isnt yes
    close-upload-link = ->
        store.video.upload-link = no
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    border-style =
        background: style.app.header
        color: style.app.text
    lang = get-lang store
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=border-style)
                .pug.subheader Add
                .pug.closed(on-click=close-upload-link)
                    icon \X, 20
            .pug.settings
                video-upload store, web3t