require! {
    \react
    \../components/qrcode.ls
    \../get-primary-info.ls
}
.hovered-address
    position: fixed
    bottom: 10px
    left: 10px
    z-index: 99999
    color: white
    width: 300px
    background: transparent
    background: #31335f
    border-radius: 10px
    padding: 10px 10px 15px
    box-shadow: 14px 7px 13px #0000001f, -16px 20px 13px #00000024
    canvas
        height: 300px
        width: 300px
        padding: 0 10px 10px 10px
        margin-bottom: -5px
    >.text
        font-size: 11px
        padding: 10px 0px
module.exports = ({ store })->
    return null if not store.current.try-copy?
    style = get-primary-info store
    copy-style=
        color: style.app.text
        background: "rgb(255 255 255 / 10%)"
        backdrop-filter: "blur(5px)"
        border: "1px solid #{style.app.border}"
    .pug.hovered-address(style=copy-style)
        .pug.text #{store.current.try-copy}
        qrcode { store, address: store.current.try-copy } 