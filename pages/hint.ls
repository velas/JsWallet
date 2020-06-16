require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \../icons.ls
    \./icon.ls
}
.hint-content
    background: rgba(0, 0, 0, 0.35)
    height: 100vh
    position: fixed
    z-index: 99
    top: 0
    left: 0
    width: 100vw
    .closed
        margin: 10px 20px
        cursor: pointer
        display: inline-block
        float: right
    .hint
        width: 200px
        position: absolute
        left: 50%
        top: 50%
        .hint-header
            font-size: 13px
            margin: 0 0 10px
            text-align: left
            text-shadow: 1px 1px 0px #000000, 0 0 1em black
        .arrow
            float: right
            right: -20px
            position: relative
module.exports = (store, web3t)->
    return null if store.current.hint isnt yes
    lang = get-lang store
    style = get-primary-info store
    closed = ->
        store.current.hint = no
    .pug.hint-content
        .pug.closed(on-click=closed)
            icon \X, 20
        .pug.hint
            .pug.hint-header #{lang.newSeedWarning}
            img.pug.arrow(src="#{icons.arrow-hint-l}")