require! {
    \react
    \./get-primary-info.ls
    \./get-lang.ls
}
.copied
    position: fixed
    background: #74cee1
    z-index: 999
    font-size: 14px
    box-sizing: border-box
    color: white
    width: 100%
    height: 80px
    padding: 10px
    left: 0
    text-align: center
    border-radius: 0px 0px 5px 5px
    box-shadow: 0px 0px 0px 0px #aee7f3
    @keyframes top
        0%
            top: -80px
        100%
            top: 0
    &.opened
        animation: top 0.5s forwards
    .mb-5
        margin-bottom: 5px
module.exports = (store)->
    { copied } = store.current
    return null if copied is ''
    copied-class = if copied is '' then '' else 'opened'
    style = get-primary-info store
    lang = get-lang store
    copy-style=
        background: style.app.background
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
    .copied.pug(class="#{copied-class}" key="copy-message" style=copy-style)
        .pug.mb-5 #{lang.copied}
        .pug #{copied}