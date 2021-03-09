require! {
    \./velas/addresses.ls
    \prelude-ls : { map, filter, obj-to-pairs }
    \./round-human.ls
    \./round-number.ls
}
module.exports = (store, web3t)->
    { send } = store.current
    decimalsConfig = send.network.decimals
    is-data = (send.data ? "").length > 0
    network = store.current.network
    contract =
        addresses[network]
            |> obj-to-pairs
            |> filter -> it.1 is send.to
            |> map -> it.0
            |> -> it ? send.to
    token-display = if send.coin.token == \vlx2 then \vlx else send.coin.token
    funtype =
        if +send.amount-send > 0 then "Send #{send.amount-send} #{token-display} to #{contract} contract" else "Execute the #{contract} contract"
    text-parts-contract =
        * funtype
        * "You are allowed to spend your resources on execution #{round-number send.amount-send-fee, {decimals: decimalsConfig}} #{token-display}."
    text-parts-regular =
        * "Send #{round-number send.amount-send, {decimals: decimalsConfig}} #{token-display} to #{send.to}"
        * "You are allowed to spend your resources on execution #{round-number send.amount-send-fee, {decimals: decimalsConfig}} #{token-display}."
    if is-data then text-parts-contract else text-parts-regular