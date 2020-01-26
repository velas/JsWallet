module.exports = (store)-> (event)->
    store.current.copied = event
    <- set-timeout _, 3000
    store.current.copied = ""