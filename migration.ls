require! {
    \prelude-ls : { map, take, drop, filter }
    \./load-registry.ls
}
module.exports = (store, e)-->
    cb = alert
    e.stop-propagation!
    e.native-event.stop-immediate-propagation!
    store.current.add-coin = yes
    err, registry <- load-registry 
    return cb err if err?
    installed-tokens = 
        store.coins |> map (.token)
    store.current.filter-plugins = ""
    store.registry = 
        registry |> filter (.token not in installed-tokens)