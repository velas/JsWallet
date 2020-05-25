require! {
    \../web3t/providers/superagent.ls : { get, post }
    \atob
    \./providers.ls
    \./json-parse.ls
}
root = \https://api.github.com/repos/web3space/plugin-registry/contents
load-item = (item, cb)->
    err, data <- get "#{root}/#{item.path}" .end
    return cb err if err?
    err, content <- json-parse atob data.body.content
    return cb err if err?
    #content = JSON.parse atob data.body.content
    return cb null if not providers[content.mainnet?api?provider]?
    cb null, content
only-supported = (item)->
    #console.log \check-supported, item
    providers[item.mainnet?api?provider]?
load-items = ([item, ...items], cb)->
    return cb null, [] if not item?
    err, data <- load-item item
    return cb err if err?
    err, rest <- load-items items
    return cb err if err?
    current =
        | data? => [data]
        | _ => []
    all = current ++ rest
    cb null, all
module.exports = (cb)->
    err, data <- get "#{root}/plugins" .end
    load-items data.body, cb