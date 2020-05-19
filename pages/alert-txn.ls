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
        height: auto
        &.txn
            visibility: visible
            margin-left: 60px !important
            @media(max-width: 800px)
                margin-left: 0px
        .header
            line-height: 26px !important
            font-size: 12px
            .lavel
module.exports = ({ store, web3t } )->
    .pug.title.alert.txn
        .pug.header 
            | You have a Velas pending transaction
            span.pug.label (2)