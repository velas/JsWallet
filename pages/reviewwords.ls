require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \prelude-ls : { map, sort-by }
    \../navigate.ls
    \../icons.ls
}
.newseed
    @import scheme
    padding-top: 50px
    width: 100%
    height: $height
    box-sizing: border-box
    height: 100%
    .button-container
        width: 100%
        position: relative
        margin: 0 auto
    .title
        color: #ebf6f8
        font-size: 22px
        margin-bottom: 20px
        span
            width: 10px
            height: 10px
            background: rgb(118, 81, 174)
            color: white
            padding: 3px
            line-height: 11px
            border-radius: 50px
            position: absolute
            font-size: 10px
            display: inline-block
            cursor: help
            margin-left: 5px
            filter: brightness(1.5)
            z-index: 2
    .no-copy
        z-index: 1
        height: 100%
        top: 0
        width: 100%
        position: absolute
    textarea
        min-width: 250px
        height: 70px
        border-radius: $border
        resize: none
        padding: 10px
        font-size: 17px
        border: 0
        text-align: center
        outline: none
        &:focus
            border-color: #248295
    button, a
        outline: none
        width: auto
        margin: 5px 5px 0
        text-transform: uppercase
        font-weight: bold
        min-width: 80px
        width: auto
        height: 36px
        line-height: 36px
        display: inline-block
        padding: 0px 6px
        text-decoration: none
        border: 0 !important
        cursor: pointer
        background: #248295
        border-radius: $border
        font-size: 10px
        white-space: nowrap
        text-overflow: ellipsis
        overflow: hidden
        color: white
        position: relative
        z-index: 2
        &:hover
            background: #248295 - 20
    .warning
        padding: 10px 10px
        border: 1px solid orange
        margin: 20px auto 0
        max-width: 250px
        border-radius: $border
        font-size: 13px
        background: rgba(orange, 0.2)
    .hint
        color: #f2eeee
        padding: 20px 0
        max-width: 270px
        font-size: 13px
        margin: 0 auto
    .words
        max-width: 500px
        display: inline-block
        margin-bottom: 20px
        .word
            display: inline-block
            color: #fff
            padding: 10px
            margin: 5px
            font-size: 14px
            min-width: 25%
            border-radius: 40px
            -ms-user-select: none
            cursor: default
            @media(max-width: 500px)
                min-width: 35%
            >input
                background: transparent
                border: 0
                display: inline-block
                color: #fff
                padding: 0
                width: 100px
                margin: 0
                font-size: 14px
                text-align: center
                cursor: auto
            input:focus ~ span.effect
                background: rgb(60, 213, 175) !important
                color: #190841 !important
                transition: all .5s
                animation: pulse_effect 1.5s linear
                transform-origin: 50% 50%
            @keyframes pulse_effect
                0%
                    transform: scale(1)
                50%
                    transform: scale(1.3)
                100%
                    transform: scale(1)
            span
                &:first-child
                    background: #7651ae
                    color: #fff
                    display: inline-block
                    padding: 4px
                    float: left
                    border-radius: 50px
                    width: 11px
                    height: 10px
                    font-size: 10px
                    line-height: 11px
                    @media(max-width: 500px)
                        margin-right: 5px
                &.effect    
                    &:last-child
                        background: #7651ae
                        color: #fff
                        display: inline-block
                        padding: 4px
                        float: left
                        border-radius: 50px
                        width: 11px
                        height: 10px
                        font-size: 10px
                        line-height: 11px
                        @media(max-width: 500px)
                            margin-right: 5px
    .about
        border-radius: $border
        padding: 10px
        margin-bottom: 20px
        max-width: 250px
        font-style: italic
create-word = (store, index, word) ->
    index = index + 1
    style = get-primary-info store
    seed-style =
        border: "1px solid #{style.app.border}"
        color: style.app.text
    .pug.word(style=seed-style)
        span.pug #{index}
        span.pug #{word.part}
review-words-panel = (store, web3t)->
    lang = get-lang store
    { next } = newseed-funcs store, web3t
    style = get-primary-info store
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    btn-icon =
        filter: style.app.btn-icon
    back = ->
        store.current.page = 'chooseinit'
    text-style =
        color: style.app.text
    print = ->
        store.current.hide-btn = not store.current.hide-btn
        window.open('https://drive.google.com/file/d/1mE53JDe2722D0BY2Mi7qIcXUFtwqSZFx/view')
    .pug
        .pug.words
            store.current.seed-words.map((word, index) -> create-word store, index, word ) 
        .pug
            .pug.button-container
                button.pug.right(on-click=back style=button-primary3-style )
                    img.icon-svg.pug(src="#{icons.arrow-left}" style=btn-icon)
                    | #{lang.back}
                button.pug.right.doc(on-click=print style=button-primary2-style)
                    img.icon-svg.pug(src="#{icons.print}")
                    | #{lang.print }
                button.pug.right.save(on-click=next style=button-primary1-style)
                    img.icon-svg.pug(src="#{icons.right}")
                    | #{lang.next }
        .pug.hint(style=text-style) #{lang.new-seed-warning}
reviewwords = ({ store, web3t })->
    lang = get-lang store
    style = get-primary-info store
    text-style =
        color: style.app.text
    newseed-style=
        margin-bottom: "10px"
        width: "120px"
    .newseed.pug
        img.pug(style=newseed-style src="#{icons.newseed}")
        .title.pug(style=text-style) #{lang.new-seed-phrase}
        review-words-panel store, web3t
module.exports = reviewwords