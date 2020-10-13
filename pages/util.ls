require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \./epoch.ls
    \./alert-demo.ls
    \../components/burger.ls
    \./switch-account.ls
    \../icons.ls
    \../history-funcs.ls
}
.convert    
    @import scheme
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: 250px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    >.title
        position: sticky
        position: -webkit-sticky
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        z-index: 3
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
    .wrapper
        width: 450px
        margin: 100px auto 0
        text-align: left
        .sub-header
            min-height: 40px
            text-align: left
            padding: 0
            .head
                box-sizing: border-box
                width: 70%
                line-height: 70px
                font-size: 27px
                font-weight: 600
                vertical-align: middle
                line-height: 29px
                display: inline-block
                width: 80%
        .form-group
            margin-top: 15px
            label
                color: var(--ligh-text)
                padding-top: 5px
                padding-left: 3px
                font-size: 13px
            input
                $border-radius: 6px
                outline: none
                width: 100%
                box-sizing: border-box
                height: 36px
                line-height: 36px
                border-radius: $border-radius
                padding: 0px 10px
                font-size: 14px
                border: 0px
                box-shadow: none
AddressUtil = (props) ->
    style = get-primary-info store
    style = {
        border: "1px solid #{style.app.border}",
        background: style.app.input,
        color: style.app.text
    }
    [vlx-address, vlx-address-change] = react.use-state ""
    [eth-address, eth-address-change] = react.use-state ""
    vlx-address-onhange = (event) ->
        vlx-address-change event.target.value
        try
            address = to-eth-address event.target.value
            eth-address-change address || ""
        catch e
            eth-address-change e.message
    eth-address-onhange = (event) ->
        eth-address-change event.target.value
        try
            address = to-velas-address event.target.value
            vlx-address-change address || ""
        catch e
            vlx-address-change e.message
    return (
        .pug
            .pug.form-group
                label.pug Please paste your VLX address here.
                input.pug(style=style placeholder="VLX address" on-change=vlx-address-onhange value=vlx-address)
            .pug.form-group
                label.pug Please paste your ETH address here.
                input.pug(style=style placeholder="ETH address" on-change=eth-address-onhange value=eth-address)
    )
convert = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    style = get-primary-info store
    text=
        color: style.app.text
    border-style =
        color: style.app.text
        border-bottom: "1px solid #{style.app.border}"
        background: style.app.background
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.convert
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") Convert
            .pug.close(on-click=go-back)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        .pug.wrapper
            .pug.sub-header
                span.pug.head(style=text) Convert VLX2ETH
            AddressUtil.pug
module.exports = convert