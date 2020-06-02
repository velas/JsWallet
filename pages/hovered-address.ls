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
    >.text
        font-size: 11px
        padding: 10px 0px
module.exports = ({ store })->
    return null if not store.current.try-copy?
    .pug.hovered-address
        .pug.text #{store.current.try-copy}
        qrcode { store, address: store.current.try-copy } 