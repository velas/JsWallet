require! {
    \mobx-react : { observer }
    \mobx : { observable, toJS }
    \react-dom : { render }
    \react
    \./patch-crypto.js
    \./app.ls
    \./data-scheme.ls
    \./browser/window.ls
    \./web3.ls
    \./autodetect-lang.ls
    \./get-device.ls
    \./get-size.ls
    \./background/background-task.ls : { start-service }
    \./render-error.ls
    \./scam-warning.ls
}
state =
    timeout: null
store = observable data-scheme
start-service store
change-device = ->
    store.current.device = get-device!
    store.current.size = get-size!
lock-wallet = ->
    return if window.nolock is yes or store.current.page isnt \wallets
    store.current.page = \locked
new-idle = ->
    set-timeout lock-wallet, 90000
reset-idle = ->
    clear-timeout state.timeout
    state.timeout = new-idle!
window.addEventListener "resize", change-device
for event in <[ mousemove click touchmove keydown ]>
    window.addEventListener event, reset-idle
export web3t = web3 store
export store
safe-render = (func)->
    state =
        result: null
    try 
        state.result = func!
    catch err
        state.result = render-error err
    state.result
Main = observer ({store})->
    safe-render ->
        app { store, web3t }
export bootstrap = (root, options)->
    store.root = root
    render do
        Main.pug( store=store)
        root
    autodetect-lang store if options?auto-lang isnt no
    web3t.set-preference options if typeof! options is \Object
window <<<< out$
scam-warning!