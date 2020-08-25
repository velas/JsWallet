require! {
    \react
    \../get-primary-info.ls
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
}
module.exports = ({ store, text })->
    style = get-primary-info store
    filter-icon=
        filter: style.app.filterIcon
    icon2=
        filter: style.app.icon2
    enter = ->
        store.current.try-copy = text
    leave = ->
        store.current.try-copy = null
    CopyToClipboard.pug(text="#{text}" on-copy=copied-inform(store) style=icon2 on-mouse-enter=enter on-mouse-leave=leave)
        copy store