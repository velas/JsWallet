require! {
    \react
    \../newseed-funcs.ls
    \../get-lang.ls
    \../get-primary-info.ls
    \../icons.ls
    \prelude-ls : { map, find, foldl, unique, take, sort-by }
    \./confirmation.ls : { confirm }
}
# verification seed
.newseed
    @import scheme
    padding-top: 50px
    width: 100%
    height: $height
    box-sizing: border-box
    height: 100%
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
    .title
        color: #ebf6f8
        font-size: 22px
        margin-bottom: 20px
    input
        border-radius: $border
        resize: none
        font-size: 13px
        border: 0
        text-align: center
        outline: none
        &:focus
            border-color: #248295
    button
        outline: none
        width: auto
        min-width: 80px
        height: 36px
        margin: 15px 5px 0
        text-transform: uppercase
        font-weight: 600
        padding: 0px 6px
        border: 0
        cursor: pointer
        background: #248295
        border-radius: $border
        font-size: 10px
        color: white
        text-overflow: ellipsis
        overflow: hidden
        white-space: nowrap
        &:hover
            background: #248295 - 20
    .warning
        padding: 10px 0
        border: 1px solid orange
        margin: 20px auto 0
        max-width: 180px
        border-radius: $border
        font-size: 13px
        background: rgba(orange, 0.2)
    .hint
        color: #f2eeee
        padding: 20px 0
        max-width: 270px
        font-size: 13px
        margin: 0 auto
newseed = ({ store, web3t })->
    lang = get-lang store
    { next, save } = newseed-funcs store, web3t
    style = get-primary-info store
    text-style =
        color: style.app.text
    address-input=
        color: style.app.text
        background: "transparent"
    button-primary1-style=
        border: "1px solid #{style.app.primary1}"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    btn-icon =
        filter: style.app.btn-icon
    seed-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
    newseed-style=
        # filter: style.app.nothingIcon
        margin-bottom: "10px"
        width: "120px"
    wrong-word = (item)->
        console.log item.original.part, item.part
        item.original.part isnt item.part
    verify-seed = ->
        store.current.verify-seed-error = no
        ixs = store.current.verify-seed-indexes
        item = ixs[store.current.verify-seed-index]
        wrong = item.original.part isnt item.part
        return store.current.verify-seed-error = yes if wrong
        return store.current.verify-seed-index += 1 if store.current.verify-seed-index + 1 < ixs.length
        save!
    back = ->
        return store.current.verify-seed-indexes += 1 if store.current.verify-seed-indexes > 0
        yesno <- confirm store, "This action can reset all your words and you have to write down them again. Do you want to continue?"
        return if yesno is no
        store.current.page = \reviewwords
    on-key-down = ->
        verify-seed! if it.key-code is 13
    build-verify-seed = (store, item)-->
        enter-confirm = ->
            item.part = it.target.value
        .pug.word(style=seed-style)
            input.pug(style=address-input key="enter_#{item.index}_word" value="#{item.part}" on-change=enter-confirm placeholder="#{lang.word} ##{item.index + 1}" on-key-down=on-key-down)
    .newseed.pug
        img.pug(style=newseed-style src="#{icons.verifyseed}")
        .title.pug(style=text-style) #{lang.verify-seed-phrase}
        .pug.words
            build-verify-seed store, store.current.verify-seed-indexes[store.current.verify-seed-index]
        .pug
            button.pug.right(style=button-primary3-style on-click=back)
                span.pug
                    img.icon-svg.pug(src="#{icons.close2}" style=btn-icon)
                    | #{lang.cancel}
            button.pug.right(style=button-primary1-style on-click=verify-seed)
                span.pug
                    img.icon-svg.pug(src="#{icons.right}")
                    | #{lang.next}
        if store.current.verify-seed-error is yes
            .pug.warning(style=text-style)
                .pug #{lang.words-are-not-match}
random = ->
    Math.floor((Math.random! * 10) + 1)
get-verifier = (store)-> (original)->
    index = store.current.seed-words.index-of(original)
    { index, part: '', original }
init = ({ store }, cb)->
    store.current.verify-seed-index = 0
    store.current.verify-seed-indexes =
        store.current.seed-words
            |> map get-verifier(store)
            |> sort-by random
    cb null
focus = ({ store }, cb)->
    cb null
newseed.focus = focus
newseed.init = init
module.exports = newseed