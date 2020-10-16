require! {
    \./providers.ls
    \mobx : { toJS }
    \prelude-ls : { pairs-to-obj, obj-to-pairs }
}
action = (func)-> (config, cb)->
    return cb "provider is not defined" if not config?network?api?provider?
    provider = providers[config.network.api.provider]
    return cb "providr not found for #{config.network.api.provider}" if not provider?
    func provider, config, cb
export calc-fee = action (provider, config, cb)->
    switch config.fee-type
    case \auto then provider.calc-fee config, cb
    case \cheap then provider.calc-fee config, cb
    case \custom then cb null, config.fee-custom-amount
export get-keys = action (provider, config, cb)->
    provider.get-keys config, cb
export get-balance = action (provider, config, cb)->
    provider.get-balance config, cb
export get-transactions = action (provider, config, cb)->
    provider.get-transactions config, cb
export get-reward-history = action (provider, config, cb)->
    provider.get-reward-history config, cb
export create-transaction = action (provider, config, cb)->
    provider.create-transaction config, cb
export push-tx = action (provider, config, cb)->
    provider.push-tx config, cb
export get-transaction-info = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-transaction-info isnt \Function
    provider.get-transaction-info config, cb
export is-valid-address = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.is-valid-address isnt \Function
    provider.is-valid-address config, cb
#
#
#
#
export get-sync-status = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-sync-status isnt \Function
    provider.get-sync-status cb
export get-peer-count = action (provider, config, cb)->
    return cb "method is not supported" if typeof! provider.get-peer-count isnt \Function
    provider.get-peer-count cb