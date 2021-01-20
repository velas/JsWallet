require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \../pages/icon.ls
    \../icons.ls
    \../send-funcs.ls
}
.trx-fee
    @import scheme
    $border-radius: var(--border-btn)
    &.disabled
        opacity:.2
    table
        margin-bottom: -1px
        border-radius: $border-radius $border-radius 0 0
    td
        cursor: pointer
        padding: 2px 5px 10px
        transition: all .5s
        position: relative
        &:first-child
            border-radius: $border-radius 0 0 0
        &:last-child
            text-align: left
            border-radius: 0 $border-radius 0 0
        &:hover
            background: var(--td-hover)
            transition: all .5s
        &.active
            background: var(--td-hover)
            .field
                &.type
                    color: orange
                    &:after
                        opacity: 1
                        filter: none
        .type
            &:after
                content: $check-xs
                position: absolute
                right: 5px
                opacity: .2
                filter: grayscale(1)
                margin-bottom: 20px
        .coin
            text-transform: uppercase
    label
        padding-top: 5px
        padding-left: 3px
        font-size: 13px
    table
        width: 100%
    input
        outline: none
        width: 100%
        box-sizing: border-box
        height: 36px
        line-height: 36px
        border-radius: 0px
        padding: 0px 10px
        font-size: 14px
        border: 0px
        box-shadow: none
        margin-bottom: -1px
trx-fee = ({ store, web3t, wallet })->
    style = get-primary-info store
    lang = get-lang store
    {send} = store.current
    active-cheap = send.fee-type is \cheap
    active-custom = send.fee-type is \custom
    active-auto = send.fee-type is \auto
    active-class= (fee-type) ->
        return null if fee-type isnt send.fee-type
        return \active
    { choose-cheap, choose-custom, choose-auto, has-send-error} = send-funcs store, web3t
    disabled-class = if has-send-error! then "disabled" else ""
    select-custom = ->
        return if has-send-error!
        choose-custom send.amount-send-fee
    on-fee-change = (ev) ->
        {value} = ev.target
        if (value.split \.).length > 2
            value = "0"
        if /[^\.0-9]/.test value
            value = "0"
        if value == ""
            value = "0"
        if value.starts-with "0" and value.index-of \. is -1 and value.length > 1
            value = value.substr 1
        if value.starts-with \.
            value = "0" + value
        choose-custom value
    fee-currency = wallet.network.tx-fee-in ? send.coin.token
    token-display = if fee-currency == \vlx2 then \vlx else fee-currency
    border-style = border: "1px solid #{style.app.border}"
    text = color: "#{style.app.icon}"
    input-style=
        background: style.app.input
        border: "1px solid #{style.app.border}"
        color: style.app.text
    custom-fee-value = ->
        if active-custom
        then send.fee-custom-amount
        else send.amount-send-fee
    cheap-option = ->
        return null if !send.amount-send-fee-options.cheap
        return null if send.amount-send-fee-options.cheap > send.amount-send-fee-options.auto
        td.pug(on-click=choose-cheap class="#{active-class \cheap}")
            .pug.field.type #{lang.cheap}
            .pug.field.coin #{if send.amount-send-fee-options.cheap then send.amount-send-fee-options.cheap + " " + token-display else ""}
    custom-option = ->
        td.pug(on-click=select-custom class="#{active-class \custom}")
            .pug.field.type #{lang.custom}
            .pug.field.coin #{custom-fee-value! + " " + token-display}
    auto-option = ->
        td.pug(on-click=choose-auto class="#{active-class \auto}")
            .pug.field.type #{lang.auto}
            .pug.field.coin #{if send.amount-send-fee-options.auto then send.amount-send-fee-options.auto + " " + token-display else ""}
    .pug.trx-fee(class="#{disabled-class}")
        label.pug(style=text) Transaction Fee
        table.pug.fee(style=border-style)
            tbody.pug
                tr.pug
                    cheap-option!
                    custom-option!
                    auto-option!
        if store.current.send.fee-type is \custom
            input.pug.amount(type='text' style=input-style on-change=on-fee-change placeholder="0" title="Fee" value="#{send.fee-custom-amount}")
module.exports = trx-fee
#???store.current.send.send.fee-custom-amountcheaon-change-xcon-change-custom-fee.send""store.current.send.send.fstore.current.send.fee-custom-amount