require! {
    \../api/ethnamed.ls
    \./get-record.ls
}
module.exports = (web3, store, cb)->
    { whois } = ethnamed web3
    record = get-record store
    err, data <- whois record
    return cb err if err?
    cb null, data