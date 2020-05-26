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
    funtype = 
        if +send.amount-send > 0 then 'payable' else "not payable"
    text-parts-contract = 
        * "You invoke #{funtype} method of #{contract} contract." 
        * "You will spend #{round-human send.amount-send-fee} #{send.coin.token} fee (maximum)."
        * if +send.amount-send > 0 then "Important! Contract requests #{round-human send.amount-send} #{send.coin.token}" else "This contract does not ask for any amount from your balance."
    text-parts-regular =
        * "Send #{round-human send.amount-send} #{send.coin.token} to #{send.to}"
        * "You will spend #{round-human send.amount-send-fee} #{send.coin.token} fee (maximum)."
        * if +send.amount-send > 0 then "Important! You send #{round-human send.amount-send} #{send.coin.token}" else "You send nothing. This tx does not make any sense."
    if is-data then text-parts-contract else text-parts-regular