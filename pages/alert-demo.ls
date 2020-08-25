require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
.title
    &.alert
        color: rgb(255, 255, 255)
        border-bottom: 1px solid rgb(107, 38, 142)
module.exports = (store, web3t)->
    lang = get-lang store
    style = get-primary-info store
    border-style2 =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.alert
    .pug.title.alert(style=border-style2)
        .pug.header This page is under development. You see this only as demo