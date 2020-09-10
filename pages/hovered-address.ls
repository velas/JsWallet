require! {
    \react
    \../components/qrcode.ls
}
.hovered-address
    position: fixed
    bottom: 0px
    left: 0px
    z-index: 99999
    color: white
    width: 300px
    background: transparent
    background: #31335f
    border-radius: 10px
    padding: 10px 10px 15px
    box-shadow: 7px 10px 13px #0000001f, -16px 20px 13px #00000024
    canvas
        height: 300px
        width: 300px
        padding: 0 10px 10px 10px
        margin-bottom: -5px
    >.text
        font-size: 11px
        padding: 10px 0px
module.exports = ({ store })->
    return null if not store.current.try-copy? or store.current.page is \locked
    .pug.hovered-address
        .pug.text #{store.current.try-copy}
        qrcode { store, address: store.current.try-copy }