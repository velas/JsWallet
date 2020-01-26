require! {
    \react
    \./wallet.ls
    \prelude-ls : { map, take, drop }
    \./menu.ls
    \../seed.ls : { get }
    \../web3.ls
    \../wallets-funcs.ls
    \./manage-account.ls
    \./add-coin.ls : add-coin-page
    \../get-lang.ls
    \../get-primary-info.ls
    \./history.ls
}
.wallets
    @import scheme
    $real-height: 300px
    $cards-height: 296px
    $pad: 20px
    $radius: 15px    
    height: 395px
    box-sizing: border-box
    position: relative
    left: 0
    bottom: 5px
    $cards-pad: 15px
    right: 0
    z-index: 2
    >*
        width: 100%
    >.arrow
        position: absolute
        text-align: center
        cursor: pointer
        &.arrow-t
            top: 0
            margin-top: 10px
        &.arrow-d
            bottom: 0
            margin-bottom: 10px
            transform: rotate(180deg)
        &:not(.true)
            >.arrow-d
                visibility: hidden
        >.arrow-container
            display: inline-block
            width: 100%
            max-width: 450px
            position: relative
    padding-top: 10px
    >.wallet-container
        overflow: hidden
        overflow-y: auto
        height: 315px
        width: 100%
        border-top: 1px solid #213040
        display: inline-block
mobile = ({ store, web3t })->
    return null if not store.current.account?
    { wallets, go-up, can-up, go-down, can-down } = wallets-funcs store, web3t
    style = get-primary-info store
    border-style =
        border-top: "1px solid #{style.app.border}"
    row =
        display: "flex"
        height: "100vh"
    left-side =
        width: "40%"
    right-side =
        width: "60%"
        border-left: "1px solid #{style.app.border}"
    .pug(key="wallets" style=row)
        .pug(style=left-side)
            menu { store, web3t }
            manage-account { store, web3t }
            add-coin-page { store, web3t }
            .wallets.pug(key="wallets-body")
                .wallet-container.pug(key="wallets-viewport" style=border-style)
                    wallets |> map wallet store, web3t, wallets
        .pug(style=right-side)
            history { store, web3t }
module.exports = mobile