require! {
    \./web3.ls
    \prelude-ls : { map, split, find, head, filter }
    \./api.ls : { is-valid-address }
}
module.exports = (config, cb)->
    console.log "config:" config
    { store, network, coin, address, send } = config
    return cb "Address not found" if address.trim! is ""
    err, isValid <- is-valid-address { network, address }
    return cb null, address if isValid
    return cb err if err? if err.index-of("method is not supported") is -1
    is-name = address.index-of(\.) isnt -1 or address.index-of(\@) isnt -1
    return cb null, address if not is-name
    cb "Address is not valid"