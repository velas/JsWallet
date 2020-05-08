require! {
    \./browser/window.ls
    \./pages.ls
    \./seed.ls : { saved }
    \mobx : { transaction }
    \./scroll-top.ls
}
#https://web3.space/wallet?internal=yes
init-flow = (prev)->
    return \newseedrestore if prev is \chooseinit and store.current.seed-generated is no
    return \locked if prev is \chooseinit and store.current.seed-generated is yes
    return \locked if prev is \newseedrestore
    return \newseed if prev in <[ locked newseedrestore ]> and not saved!
    return \verifyseed if prev is \newseed and store.current.seed-generated is yes
    return \terms if prev is \verifyseed
    #return \chooseinit if not saved!
    \wallets
get-page = (store, page, prev)->
    return page if page isnt \:init
    init-flow prev
init-control = (scope, name, cb)->
    #<- set-timeout _, 1
    control = pages[name] 
    return cb null if typeof! control?init isnt \Function
    control.init scope, cb
focus-control = (scope, name, cb)->
    scroll-top!
    control = pages[name] 
    return cb null if typeof! control?focus isnt \Function
    control.focus scope, cb
module.exports = (store, web3t, page)->
    return alert "store is required" if not store?
    return alert "web3t is required" if not web3t?
    scroll-top!
    <- set-timeout _, 1
    prev = store.current.page
    store.current.page = \loading
    store.current.loading = yes
    name = get-page store, page, prev
    <- init-control { store, web3t }, name
    store.current.page = name
    store.current.loading = no
    <- focus-control { store, web3t }, name