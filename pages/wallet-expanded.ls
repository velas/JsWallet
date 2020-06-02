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
    height: 200px
    box-sizing: border-box
    $tablet: 1200px
    >.wallet-part
        display: inline-block
        position: relative
        box-sizing: border-box
        vertical-align: top
        width: 50%
        padding: 20px
        @media screen and (max-width: $tablet)
            padding: 10px 20px
        &.left
            text-align: left
            >.buttons
                margin-top: 10px
                .btn
                    margin: 0
                    &:last-child
                        margin-left: 10px
            >.details
                display: none
            .uninstall
                position: absolute
                top: 20px
                right: 20px
                text-transform: uppercase
                font-size: 10px
                padding: 7px 10px
                cursor: pointer
                @media screen and (max-width: $tablet)
                    top: 10px
            >.address-holder
                margin-top: 10px
                @media screen and (max-width: $tablet)
                    margin-top: 20px
        &.right
        >.wallet-header
            &.chart
                text-align: right
                padding-top: 0px
                border-left: 1px solid rgba(white, 0.2)
                @media screen and (max-width: $tablet)
                    >.wallet-header-part
                        width: 100%
                        text-align: center
                        >.stats
                            margin: 0 auto
            >.wallet-header-part
                display: inline-block
                box-sizing: border-box
                vertical-align: top
                &.left
                    img
                        width: 60px
                &.right
                    padding: 0 10px
                    >.title
                        font-size: 21px
                .counts
                    margin-bottom: 5px
                    .label
                        font-weight: bold
                        font-size: 12px
        .stats
            $size: 150px
            $size-tablet: 100px
            margin-right: 20px
            display: inline-block
            height: $size
            max-height: $size
            width: $size
            max-width: $size
            @media screen and (max-width: $tablet)
                height: $size-tablet - 10
                max-height: $size-tablet - 10
                width: $size-tablet - 10
                max-width: $size-tablet - 10
            >*
                height: inherit
                width: inherit
cb = console~log
module.exports = (store, web3t, wallets, wallet)-->
    { uninstall, wallet, balance, balance-usd, pending, send, receive, usd-rate } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => "#{lang.hide}"
    wallet-style=
        color: style.app.text3
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
    wallet-style=
        color: style.app.text3
        background: style.app.wallet
        border-bottom: "1px solid #{style.app.border}"
    uninstall=
        background: style.app.bg-primary-light
    text=
        color: style.app.text
    .wallet-detailed.pug(key="#{token}" style=wallet-style)
        .wallet-part.left.pug(style=text)
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
                    .pug.uninstall(on-click=uninstall style=uninstall) #{label-uninstall}
        .wallet-part.right.pug
            .wallet-header.pug.chart
                .wallet-header-part.left.pug
                    .stats.pug
                        wallet-stats store, web3t
                .wallet-header-part.right.pug(style=text)
                    .pug.counts
                        .pug #{ total-sent + ' ' token }
                        .pug.label(style=color1) Total Sent
                    .pug.counts
                        .pug #{ total-received + ' ' token }
                        .pug.label(style=color2) Total Received