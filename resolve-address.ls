require! {
    \./web3.ls
    \prelude-ls : { map, split, find, head, filter }
}
is-valid = (coin, network)-> (address)->
    return no if not address?
    return no if typeof! address isnt \String
    [type, addr] = address.split(\:)
    return no if coin.type is type
    address.length is network.mask.length
verify = (verify-record, coin, network, to, cb)->
    return cb null, to if is-valid(coin, network) to
    verify-record to, cb
module.exports = (web3t, to, coin, network, cb)->
    is-name = to.index-of(\.) isnt -1 or to.index-of(\@) isnt -1
    return cb null, to if not is-name
    { verify-record } = web3t.naming
    err, data <- verify verify-record, coin, network, to
    return cb err if err?
    return cb "Address not found" if data is ""
    address =
        data 
            |> -> it.split \,
            |> map -> it.split \:
            |> filter -> it.0 is coin.token
            |> map -> it.1
            |> head
    return cb "Address not found" if not address?
    cb null, address