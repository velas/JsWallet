require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find, filter }
    \../math.ls : { times }
    \./keyboard.ls
    \../icons.ls
}
.input-area
    position: relative
    display: inline-block
    margin: 0
    box-sizing: border-box
    height: 36px
    line-height: 36px
    min-width: 100px
    >*
        display: inline-block
        box-sizing: border-box  
        margin: 0 !important
        height: inherit
        line-height: inherit
        vertical-align: top
    >input
        position: absolute
        width: 100% !important
        border: 0px
        display: inline-block
        width: calc(100% - 70px)
        padding: 0 10px
        left: 0
        top: 2px
        &.typeahead
            z-index: 1
        &.userinput
            z-index: 2
get-actual-values = (value)-> (item)->
    return no if not value?
    return no if value is ""
    item.index-of(value) is 0
module.exports = ({ store, value, on-change, placeholder, on-key-down, list })->
    style = get-primary-info store
    base-style =
        background: style.app.wallet
        color: style.app.text
        overflow-x: \auto
        margin-bottom: \5px
    input-style = { ...base-style, background: \transparent }
    btn-icon =
        filter: style.app.btn-icon
    actual-placeholder = placeholder ? ""
    actual-list =
        list |> filter get-actual-values value
    console.log { actual-list, list }
    typeahead-placeholder = actual-list.0
    on-typehead-focus = ->
        (document.query-selector \.userinput).focus!
    .pug.input-area
        input.typeahead.pug(type="text" style=input-style placeholder=typeahead-placeholder auto-complete="off" on-key-down=on-key-down on-focus=on-typehead-focus)
        input.userinput.pug(type="text" value="#{value}" style=input-style on-change=on-change placeholder=actual-placeholder auto-complete="off" on-key-down=on-key-down)