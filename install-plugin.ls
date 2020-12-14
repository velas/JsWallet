require! {
    \localStorage
    \prelude-ls : { any, map, filter }
    #react controls
    \./modal.ls : { install, replace }
    \../web3t/providers/superagent.ls : { get }
    \./json-parse.ls
    \./providers.ls
    \../web3t/plugins/dash-coin.js : dash
    \../web3t/plugins/eth-coin.js : eth
    \../web3t/plugins/etc-coin.js : etc
    \../web3t/plugins/symblox.js : syx
    \../web3t/plugins/symblox-v2.js : syx2
    \../web3t/plugins/ltc-coin.js : ltc
    \../web3t/plugins/usdt-coin.js : usdt
    \../web3t/plugins/usdt_erc20.json : usdt_erc20
}
current-configs = {dash, eth, syx, syx2, usdt, usdt_erc20, ltc}
required-fields = <[ type token enabled ]>
not-in = (arr, arr2)->
    arr |> any -> arr2.index-of(it) is -1
verify-plugin = (plugin, cb)->
    return cb "Expected Object" if typeof! plugin isnt \Object
    return cb "Required fields: #{required-fields.join(', ')}" if required-fields `not-in` Object.keys(plugin)
    cb null
get-registry = (cb)->
    registry-string = local-storage.get-item(\plugin-registry) ? "[]"
    #console.log registry-string
    json-parse registry-string, cb
get-plugin = (name, cb)->
    coin-name = name.substr("plugin-".length)
    if current-configs[coin-name]
        item = JSON.stringify current-configs[coin-name]
    else
        return cb null
    return cb null if typeof! item isnt \String
    json-parse item, cb
get-plugin-one-by-one = ([item, ...rest], cb)->
    return cb null, [] if not item?
    err, plugin <- get-plugin item
    return cb err if err?
    err, other <- get-plugin-one-by-one rest
    return cb err if err?
    all = all = if plugin then ([plugin] ++ other) else other
    cb null, all
export get-install-list = (cb)->
    err, data <- get-registry
    return cb err if err?
    err, res <- get-plugin-one-by-one data
    return cb err if err?
    cb null, res
save-registry = (registry)->
    resulted-string = JSON.stringify registry
    local-storage.set-item \plugin-registry, resulted-string
add-to-registry = (name, cb)->
    err, registry <- get-registry
    return cb err if err?
    return if registry.index-of(name) > -1
    registry.push name
    save-registry registry
    cb null
remove-from-registry = (name, cb)->
    err, registry <- get-registry
    return cb err if err?
    index = registry.index-of(name)
    return cb null if index is -1
    registry.splice index, 1
    save-registry registry
    cb null
build-name = (token)-> "plugin-#{token}"
install-plugin = (plugin, cb)->
    err <- verify-plugin plugin
    return cb err if err?
    plugin.can-uninstall = yes
    name = build-name plugin.token
    body = JSON.stringify plugin
    local-storage.set-item name, body
    err <- add-to-registry name
    return cb err if err?
    cb null
uninstall-plugin = (cweb3, token, cb)->
    return cb "expected string argument" if typeof! token isnt \String
    name = build-name token
    err <- remove-from-registry name
    return cb err if err?
    local-storage.set-item name, ""
    cweb3.refresh cb
ask-user = (cweb3, store, plugin, cb)->
    err, registry <- get-registry
    return cb err if err?
    return cb "pluing is required" if typeof! plugin isnt \Object
    return cb "callback is required" if typeof! cb isnt \Function
    return install store, plugin, cb if registry.index-of(plugin.token) is -1
    replace store, plugin, cb
export build-install = (cweb3, store)-> (plugin, cb)->
    return cb "Please unlock the wallet" if store.current.page is \locked
    err <- verify-plugin plugin
    return cb err if err?
    err <- ask-user cweb3, store, plugin
    return cb err if err?
    err <- install-plugin plugin
    return cb err if err?
    cweb3.refresh cb
export build-quick-install = (cweb3, store)-> (plugin, cb)->
    return cb "Please unlock the wallet" if store.current.page is \locked
    err <- verify-plugin plugin
    return cb err if err?
    err <- install-plugin plugin
    return cb err if err?
    cweb3.refresh cb
export build-uninstall = (cweb3, store)-> (name, cb)->
    uninstall-plugin cweb3, name, cb
export build-install-by-name = (cweb3, store)-> (name, cb)->
    err, resp <- get "https://raw.githubusercontent.com/web3space/plugin-registry/master/plugins/#{name}.json" .end
    return cb err if err?
    err, plugin <- json-parse resp.text
    return cb err if err?
    return cb "type is required" if not plugin.type?
    return cb "enabled is true" if plugin.enabled isnt yes
    err <- install-plugin plugin
    return cb err if err?
    cweb3.refresh cb