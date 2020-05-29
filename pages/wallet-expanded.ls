require! {
    \react
    \../tools.ls : { money }
    \prelude-ls : { each, find, filter, foldl, map }
    \../wallet-funcs.ls
    \../get-lang.ls
    \../math.ls : { plus }
    \./icon.ls
    \../get-primary-info.ls
    \../../web3t/providers/superagent.ls : { get }
    \../icons.ls
    \../round-human.ls
    \./confirmation.ls : { alert }
    \../components/button.ls
    \../components/address-holder.ls
    \./wallet-stats.ls
}
#
.wallet-detailed
    >.wallet-part
        display: inline-block
        box-sizing: border-box
        vertical-align: top
        width: 50%
        padding: 20px
        &.left
            text-align: left
            >.buttons
                text-align: center
            >.details
                display: none
        &.right
        >.wallet-header
            &.chart
                text-align: right
                padding-top: 20px
                border-left: 1px solid rgba(white, 0.2)
            >.wallet-header-part
                display: inline-block
                box-sizing: border-box
                vertical-align: top
                &.left
                    img
                        width: 100px
                &.right
                    padding: 9px
                    >.title
                        font-size: 25px
                .counts
                    margin-bottom: 5px
                    .label
                        font-weight: bold
                        font-size: 12px
        .stats
            $size: 150px
            margin-right: 20px
            display: inline-block
            height: $size
            max-height: $size
            width: $size
            max-width: $size
            >*
                height: inherit
                width: inherit
cb = console~log
module.exports = (store, web3t, wallets, wallet)-->
    { button-style, uninstall, wallet, active, big, balance, balance-usd, pending, send, receive, usd-rate, last } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => "#{lang.hide}"
    wallet-style=
        color: style.app.text3
    border =
        border-top: "1px solid #{style.app.border}"
        border-right: "1px solid #{style.app.border}"
    button-primary3-style=
        border: "1px solid #{style.app.primary3}"
        color: style.app.text2
        background: style.app.primary3
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    btn-icon =
        filter: style.app.btn-icon
    placeholder = 
        | store.current.refreshing => "placeholder"
        | _ => ""
    placeholder-coin = 
        | store.current.refreshing => "placeholder-coin"
        | _ => ""
    name = wallet.coin.name ? wallet.coin.token
    receive-click = receive(wallet)
    send-click = send(wallet)
    token = wallet.coin.token.to-upper-case!
    style = get-primary-info store 
    color1 =
        color: style.app.primary1
    color2 =
        color: style.app.primary2
    get-total = (type)->
        store.transactions.applied 
            |> filter (.type is type)
            |> map (.amount)
            |> foldl plus, 0
            |> round-human
    total-sent = get-total \OUT
    total-received = get-total \IN
    .wallet-detailed.pug(key="#{token}")
        .wallet-part.left.pug
            .wallet-header.pug
                .wallet-header-part.left.pug
                    img.label-coin.pug(class="#{placeholder-coin}" src="#{wallet.coin.image}")
                .wallet-header-part.right.pug
                    .title.pug(class="#{placeholder}") #{name}
                    .balance.pug(class="#{placeholder}")
                        span.pug(title="#{wallet.balance}") 
                            span.pug #{ round-human wallet.balance }
                            span.pug #{ token }
                        if +wallet.pending-sent >0
                            .pug.pending 
                                span.pug -#{ pending }
            address-holder { store, wallet, type: \bg }
            .buttons.pug
                button { store, on-click=send-click, text: \send , icon: \send , type: \primary }
                button { store, on-click=receive-click, text: \receive , icon: \get  , type : \secondary }
            .details.pug
                .price.pug(class="#{placeholder}" title="#{balance-usd}") $#{ round-human balance-usd }
                .name.pug(class="#{placeholder}" title="#{usd-rate}") $#{ round-human usd-rate}
            .pug
                if wallet.coin.token not in <[ btc vlx vlx2 ]>
                    .pug.uninstall(on-click=uninstall style=wallet-style) #{label-uninstall}
        .wallet-part.right.pug(style=border)
            .wallet-header.pug.chart
                .wallet-header-part.left.pug
                    .stats.pug
                        wallet-stats store, web3t
                .wallet-header-part.right.pug
                    .pug.counts
                        .pug #{ total-sent + ' ' token }
                        .pug.label(style=color1) Total Sent
                    .pug.counts
                        .pug #{ total-received + ' ' token }
                        .pug.label(style=color2) Total Received