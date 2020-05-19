require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
}
.title
    &.alert
        color: rgb(255, 255, 255)
        border-bottom: 1px solid rgb(107, 38, 142)
        background: rgb(75, 40, 136)
module.exports = ({ store, web3t } )->
    .pug.title.alert
        .pug.header This page is under development. You see this only as demo