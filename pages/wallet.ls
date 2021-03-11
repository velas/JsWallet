require! {
    \react
    \../tools.ls : { money }
    \prelude-ls : { each, find }
    \../wallet-funcs.ls
    \../get-lang.ls
    \./icon.ls
    \../get-primary-info.ls
    \../../web3t/providers/superagent.ls : { get }
    \../icons.ls
    \../round-human.ls
    \./confirmation.ls : { alert }
    \../components/button.ls
    \../components/address-holder.ls
}
.wallet
    @import scheme
    $cards-height: 324px
    $pad: 20px
    $radius: 15px
    position: relative
    cursor: pointer
    $card-height: 60px
    height: $card-height
    &.disabled-wallet-item
        opacity: 0.4
        filter: grayscale(1)
        cursor: no-drop
    &.last
        height: 60px
    $mt: 20px
    box-sizing: border-box
    overflow: hidden
    transition: height .5s
    border: 0px
    &:first-child
        margin-top: 0
        box-shadow: none
    &:last-child
        margin-bottom: 0px
    .pending
        color: orange
    &.over
        background: #CCC
    &.big
        height: 120px
    &.active
    .wallet-middle
        >.uninstall
            text-align: left
            font-size: 10px
            padding-top: 5px
        box-sizing: border-box
        width: 70%
        height: 85px
        float: left
        padding: 20px
        border-top: 1px solid rgb(107, 38, 142)
        border-right: 1px solid rgb(107, 38, 142)
        &:last-child
            display: block
        &:last-child
            width: 30%
            border-right: 0 !important
        .name
            color: #fff
            font-size: 16px
            font-weight: 700
            &.per
                font-size: 10px
                color: orange
                font-weight: 100
            &:last-child
                font-size: 10px
                text-transform: uppercase
                letter-spacing: 2px
                margin-top: 5px
                opacity: .8
        .title-balance
            color: #fff
            font-size: 14px
            text-align: left
        span
            padding-left: 10px
        a
            text-align: left
    >.wallet-top
        padding: 0 12px
        box-sizing: border-box
        $card-top-height: 50px
        width: 100%
        color: #677897
        font-size: 14px
        text-align: center
        overflow: hidden
        >*
            display: inline-block
            box-sizing: border-box
            vertical-align: top
            padding-top: 12px
            height: $card-top-height
            line-height: 16px
        >.top-left
            width: 30%
            text-align: left
            overflow: hidden
            text-overflow: ellipsis
            @media screen and (min-width: 801px)
                padding-top: 5px
            @media screen and (max-width: 800px)
                width: 15%
            >*
                display: inline-block
            >.img
                line-height: $card-top-height
                vertical-align: top
                margin-right: 10px
                width: 40px
                >img
                    vertical-align: top
                    max-width: 50px
                    $s: 35px
                    border-radius: 0
                    height: $s
                    @media screen and (min-width: 801px)
                        padding-top: 4px
            >.info
                text-align: left
                margin-left: 0px
                text-overflow: ellipsis
                overflow: hidden
                width: auto
                @media screen and (max-width: 390px)
                    display: none
                >.name
                    padding-left: 3px
                >.price
                    font-size: 11px
                    font-weight: bold
                    overflow: hidden
                    text-overflow: ellipsis
                    opacity: .5
                    padding: 0
                    letter-spacing: .4px
                    &.token
                        opacity: 1
                        font-size: 12px
        >.top-middle
            width: 30%
            text-align: center
            .label-coin
                height: 16px
                top: 3px
                padding-left: 4px
                position: relative
            @media screen and (max-width: 800px)
                width: 50%
                text-align: left
            >.balance
                &:last-child
                    font-weight: bold
                    font-size: 13px
                &.title
                    @media screen and (max-width: 220px)
                        display: none
                .title-balance
                    display: none
        >.top-right
            width: 40%  
            text-align: right
            .wallet-swap img
                filter: invert(1)
            .icon
                vertical-align: sub
                .icon-svg-create
                    height: 9px
                    transform: rotate(-90deg)
                    vertical-align: inherit
                    opacity: .3
            @media screen and (max-width: 800px)
                width: 35%
                display: flex
                float: right
                flex-direction: row-reverse
            >button
                outline: none
                margin-bottom: 5px
                margin-left: 5px
                cursor: pointer
                border: 0
                $round: 36px
                padding: 0
                box-sizing: border-box
                border-radius: $border
                font-size: 10px
                width: auto
                padding: 0 6px
                height: $round
                color: #6CA7ED
                text-transform: uppercase
                font-weight: bold
                background: transparent
                transition: all .5s
                text-overflow: ellipsis
                overflow: hidden
                width: 80px
                .icon-svg
                    @media screen and (max-width: 800px)
                        padding: 0
                .icon
                    position: relative
                    height: 16px
                    top: 2px
                @media screen and (max-width: 800px)
                    width: 40px
                    line-height: 30px
cb = console~log
module.exports = (store, web3t, wallets, wallet)-->
    { button-style, uninstall, wallet, active, big, balance, balance-usd, pending, send, receive, swap, expand, usd-rate, last } = wallet-funcs store, web3t, wallets, wallet
    lang = get-lang store
    style = get-primary-info store
    label-uninstall =
        | store.current.refreshing => \...
        | _ => "#{lang.hide}"
    wallet-style=
        color: style.app.text
    border-style =
        border-bottom: "1px solid #{style.app.border}"
    border =
        border-top: "1px solid #{style.app.border}"
        border-right: "1px solid #{style.app.border}"
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
        background-color: style.app.primary3-spare
    address-input=
        color: style.app.color3
        background: style.app.bg-primary-light
    btn-icon =
        filter: style.app.btn-icon
    icon-color=
        filter: style.app.icon-filter
    placeholder =
        | store.current.refreshing => "placeholder"
        | _ => ""
    placeholder-coin =
        | store.current.refreshing => "placeholder-coin"
        | _ => ""
    name = wallet.coin.name ? wallet.coin.token
    #load-terms = (cb)->
    #    #return cb null if store.current.content-migrate?
    #    err, res <- get \https://raw.githubusercontent.com/okhrimenkoalexey/Velas/master/terms.md .end
    #    return cb err if err?
    #    store.terms2 = res.text
    #    cb null
    #migrate = (wallet)-> ->
    #    err <- load-terms
    #    address =
    #        store.current.account.wallets
    #            |> find (-> it.coin.token is \vlx2)
    #            |> (.address)
    #    return alert store, "addres #{address} is wrong", cb if typeof! address isnt \String
    #    err, data <- get "https://mainnet-v2.velas.com/migration/topup-velas-address/#{address}" .end
    #    return alert store, "#{err}", cb if err?
    #    return alert store, "cannot create address", cb if not data.body?address?
    #    store.current.token-migration = data.body.address
    #    #store.current.token-migration = "V123"
    receive-click = receive(wallet)
    send-click = send(wallet)
    swap-click = swap(wallet)
    token = wallet.coin.token.to-upper-case!
    token-display = if token == \VLX2 then \VLX else token
    makeDisabled = store.current.refreshing
    wallet-is-disabled  = isNaN(wallet.balance) or isNaN(wallet.balanceUsd)
    is-loading = store.current.refreshing is yes
    disabled-class = if not is-loading and wallet-is-disabled then "disabled-wallet-item" else ""
    .wallet.pug.wallet-item(class="#{big} #{disabled-class}" key="#{wallet.coin.token}" style=border-style)
        .wallet-top.pug(on-click=expand)
            .top-left.pug(style=wallet-style)
                .img.pug(class="#{placeholder-coin}")
                    img.pug(src="#{wallet.coin.image}")
                .info.pug
                    .balance.pug.title(class="#{placeholder}") #{name}
                    if store.current.device is \desktop
                        .price.token.pug(class="#{placeholder}" title="#{wallet.balance}")
                            span.pug #{ round-human wallet.balance }
                            span.pug #{ token-display }
                    .price.pug(class="#{placeholder}" title="#{balance-usd}")
                        span.pug #{ round-human balance-usd}
                        span.pug USD
            if store.current.device is \mobile
                .top-middle.pug(style=wallet-style)
                    if +wallet.pending-sent is 0
                        .balance.pug.title(class="#{placeholder}") #{name}
                    .balance.pug(class="#{placeholder}")
                        span.pug(title="#{wallet.balance}") #{ round-human wallet.balance }
                            img.label-coin.pug(class="#{placeholder-coin}" src="#{wallet.coin.image}")
                            span.pug #{ wallet.coin.token.to-upper-case! }
                        if +wallet.pending-sent >0
                            .pug.pending
                                span.pug -#{ pending }
            .top-right.pug
                if no and store.current.device is \desktop                    
                    span.pug.icon(on-click=expand)
                        img.icon-svg-create.pug(src="#{icons.arrow-down}" style=icon-color)
                            .pug expand
                button { store, on-click=send-click, text: \send , icon: \send , type: \secondary }
                button { store, on-click=receive-click, text: \receive , icon: \get  , type : \primary }
                if token is \VLX_ERC20 then
                    button {    store, on-click=swap-click, text: \swap , icon: \swap  , id: "wallet-swap", makeDisabled=no, classes="wallet-swap" }
                else if token is \VLX2 then
                    button { store, on-click=swap-click, text: \swap , icon: \swap  , id: "wallet-swap", makeDisabled=no, classes="wallet-swap" }
        .wallet-middle.pug(style=border)
            address-holder { store, wallet, type: \bg }
            if wallet.coin.token not in <[ btc vlx2 ]>
                .pug.uninstall(on-click=uninstall style=wallet-style) #{label-uninstall}
        .wallet-middle.title-balance.pug(style=border)
            .name.pug(class="#{placeholder}" title="#{usd-rate}") $#{ round-human(usd-rate)}
            .name.per.pug(class="#{placeholder}")
                span.pug #{lang.per}
                | #{ wallet.coin.token.to-upper-case! }