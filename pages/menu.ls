require! {
    \react
    \../tools.ls : { cut, money }
    \./project-links.ls
    \../menu-funcs.ls
    \./your-account.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \./header.ls
}
.menu
    padding: 0 5px
    height: 219px
    line-height: 30vh
    >.menu-body
        display: inline-block
        line-height: normal
        vertical-align: middle
        vertical-align: -webkit-baseline-middle
        width: 100%
        max-width: 450px
        >.balance
            position: relative
            >.menu
                position: absolute
                right: 0
                top: 0
                >.menu-item
                    &.syncing
                        @keyframes spin
                            from
                                transform: rotate(0deg)
                            to 
                                transform: rotate(360deg)
                        animation-name: spin
                        animation-duration: 4000ms
                        animation-iteration-count: infinite
                        animation-timing-function: linear
                    cursor: pointer
                    opacity: 0.9
                    &:hover
                        opacity: 1
                    vertical-align: top
                    line-height: normal
                    display: inline-block
                    margin-left: 15px
            text-align: center
            >.currency
            >.amount
                font-size: 40px
                >*
                    display: inline-block
module.exports = ({ store, web3t })->
    return null if not store?
    { current, open-account, lock, wallet-style, info, activate-s1, activate-s2, activate-s3, switch-network, refresh, lock } = menu-funcs store, web3t
    style = get-primary-info store
    menu-style=
        color: style.app.text
    icon-style =
        color: style.app.icon
    lang = get-lang store
    syncing = 
        | store.current.refreshing => \syncing
        | _ => ""
    .menu.pug(style=menu-style)
        .menu-body.pug
            .balance.pug
                .currency.pug #{lang.total-balance ? 'Total Balance'}
                .amount.pug
                    .symbol.pug $
                    .number.pug #{money current.balance-usd}
            if store.current.device is \mobile    
                your-account store, web3t
            project-links { store, web3t }