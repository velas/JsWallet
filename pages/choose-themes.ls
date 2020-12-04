require! {
    \react
    \../components/button.ls
    \../themes.ls
    \prelude-ls : { obj-to-pairs, map }
}
#monochrome dark_mojave
.choose-theme
    @import scheme
    >.theme
        margin-bottom: 40px
        display: inline-block
        width: 200px
        >.pallete
            .box
                display: inline-block
                width: 40px
                height: 40px
                text-align: top
                box-sizing: border-box
                &:first-child
                    border-top-left-radius: var(--border-btn)
                    border-bottom-left-radius: var(--border-btn)
                &:last-child
                    border-top-right-radius: var(--border-btn)
                    border-bottom-right-radius: var(--border-btn)
create-button = (store, web3t)-> (text)->
    use = ->
        web3t.set-theme text
    background-style=
        background: themes[text].background
        background-color: themes[text].bgspare
    button-style=
        background: themes[text].primary1
        background-color: themes[text].primary1-spare
    control-style=
        background: themes[text].bg-primary-light
    .pug.theme
        .pug.pallete
            .box.pug(style=background-style)
            .box.pug(style=button-style)
            .box.pug(style=control-style)
        button { store, text , on-click: use, icon: \show, type: \secondary }
module.exports = (store, web3t)->
    .pug.choose-theme
        themes |> obj-to-pairs |> map (-> it.0) |> map create-button store, web3t