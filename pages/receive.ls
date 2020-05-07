require! {
    \react
    \qrcode.react : QRCode
    \../get-primary-info.ls
    \../get-lang.ls
}
.receive
    @import scheme
    text-align: center
    .receive-body
        padding: 20px 20px 10px
        .ill-qr
            position: relative
            width: 160px
            display: block
            margin: 60px auto 40px
            .ill-top
                position: absolute
                top: -30px
                right: 3px
                z-index: 3
                width: 140px
            .ill-middle
                position: absolute
                top: 5px
                right: 36px
                width: 66px
        .move
            -webkit-animation: diagonal 15s infinite
            -moz-animation: diagonal 15s infinite
            -o-animation: diagonal 15s infinite
            animation: diagonal 15s infinite
        @-webkit-keyframes diagonal
            0%
                transform: translatex(-30px) translatey(-15px)
            50%
                transform: translatex(10px) translatey(10px)
            100%
                transform: translatex(-30px) translatey(-15px)
        img
            width: 160px
            display: block
        canvas
            width: 50%
            height: auto
            padding: 10px
            background: #fff
            border-radius: $border
qrcode = (store, wallet)->
    info = get-primary-info store
    return null if not wallet?address?
    bgColor = info.background
    fgColor = "rgb(158, 79, 235)"
    QRCode.pug(value="#{wallet.address}" size="256" bgColor=bgColor fgColor=fgColor)
module.exports = (store, wallet)->
    .pug.receive
        .receive-body.pug
            qrcode store, wallet