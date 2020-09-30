require! {
    \react
    \./get-primary-info.ls
    \./get-lang.ls
}
.copied
    position: fixed
    background: #74cee1
    z-index: 9999999
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
    margin: 10px
    border-radius: 10px
    width: calc(100% - 20px)
    box-shadow: 7px 10px 13px #0000001f, -16px 20px 13px #00000024
    @keyframes top
        0%
            top: -80px
        100%
            top: 0
    &.opened
        animation: top 0.5s forwards
    .mb-5
        margin-bottom: 5px
    .contents
        height: 35px
module.exports = (store)->
    { copied } = store.current
    return null if copied is ''
    copied-class = if copied is '' then '' else 'opened'
    style = get-primary-info store
    lang = get-lang store
    cut = (tx)->
        return \none if not tx?
        t = tx.to-string!
        r = t.substr(0, 10) + \.. + t.substr(tx.length - 25, 0) + \.. + t.substr(t.length - 10, 10)
        #r.to-upper-case!
    copy-style=
        color: style.app.text
        background: "rgb(255 255 255 / 10%)"
        backdrop-filter: "blur(5px)"
        border: "1px solid #{style.app.border}"
    .copied.pug(class="#{copied-class}" key="copy-message" style=copy-style)
        .pug.mb-5 #{lang.copied}
        .pug.contents #{cut copied}