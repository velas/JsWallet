require! {
    \./velas/addresses.ls
    \prelude-ls : { map, filter, obj-to-pairs }
    \./round-human.ls
}
module.exports = (store, web3t)->
    { send } = store.current
    is-data = (send.data ? "").length > 0
    contract =
        addresses
            |> obj-to-pairs
            |> filter -> it.1 is send.to
            |> map -> it.0
            |> -> it ? send.to
    token-display = if send.coin.token == \vlx2 then \vlx else send.coin.token
    funtype =
        if +send.amount-send > 0 then "Send #{send.amount-send} #{token-display} to #{contract} contract" else "Execute the #{contract} contract"
    text-parts-contract =
        * funtype
        * "You are allowed to spend your resources on execution #{round-human send.amount-send-fee} #{token-display}."
    text-parts-regular =
        * "Send #{round-human send.amount-send} #{token-display} to #{send.to}"
        * "You are allowed to spend your resources on execution #{round-human send.amount-send-fee} #{token-display}."
    if is-data then text-parts-contract else text-parts-regular