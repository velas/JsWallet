require! {
    \react
}
AddressUtil = (props) ->
    style = {width: "200px", height: "100px"}
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
            textarea.pug(style=style placeholder="VLX address" on-change=vlx-address-onhange value=vlx-address)
            textarea.pug(style=style placeholder="ETH address" on-change=eth-address-onhange value=eth-address)
    )
module.exports = ->
    AddressUtil.pug