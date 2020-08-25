require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find }
    \../math.ls : { times }
    \./keyboard.ls
}
.input-area
    @import scheme
    position: relative
    margin: 10px 0
    width: 100%
    box-sizing: border-box
    height: 36px
    line-height: 36px
    >*
        display: inline-block
        box-sizing: border-box
        margin: 0 !important
        height: inherit
        line-height: inherit
        vertical-align: top
        z-index: 1
    >input
        display: inline-block
        width: calc(100% - 70px) !important
        padding: 0 10px
        border-radius: $border 0 0 $border !important
    >.suffix
        $color: rgba(#ccc, 0.3)
        width: 70px
        border-left: 1px solid $color
        text-align: center
        border-radius: 0 $border $border 0
        >*
            display: inline-block
        >.icon
            width: 15px
            margin-bottom: -3px
            margin-right: 3px
    >.show-details
        display: none
    &:hover
        >.show-details
            display: block
            position: absolute
            top: 36px
            right: 0
            width: auto
            padding: 0
            color: white
            height: 90px
            text-align: right
            background: transparent
            >.panel
                padding: 10px
                background: rgba(black, 0.8)
                display: inline-block
                max-width: 250px
                min-width: 250px
                text-align: left
module.exports = ({ store, value, on-change, placeholder })->
    style = get-primary-info store
    input-style =
        background: style.app.input
        color: style.app.text
        overflow-x: \auto
    current=
        ref: null
    { wallets } = store.current.account
    wallet =
        wallets |> find (-> it.coin.token is \vlx2)
    value-vlx = value ? 0
    usd = 
        | wallet.usd-rate? => value-vlx `times` wallet.usd-rate
        | _ => ".."
    eur = 
        | wallet.eur-rate? => value-vlx `times` wallet.eur-rate
        | _ => ".."
    actual-placeholder = placeholder ? ""
    normalize = ->
        return \0 if not it?
        return parse-int it if it.index-of('.') is -1
        return parse-int(it) + "." if it.substr(it.length - 1, 1) is "."
        [first=\0, second=\0] = it.split('.')
        "#{parse-int first}.#{second}"
    get-number = (value)->
        | value is "" => \0
        | typeof! value not in <[String Number]> => \0
        | _ => normalize value.match(/\d+(\.)?(\d{1,})?/)?0
    on-change-internal = (it)->
        value = get-number it.target?value
        on-change { target: { value } }
    .pug.input-area
        input.pug(type="text" value="#{value-vlx}" style=input-style on-change=on-change-internal placeholder=actual-placeholder)
        span.suffix.pug(style=input-style)
            img.icon.pug(src="#{wallet.coin.image}")
            span.pug VLX2
        .show-details.pug
            .panel.pug
                .pug USD: #{round usd}
                .pug EUR: #{round eur}