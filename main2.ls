require! {
    \mobx-react : { observer }
    \mobx : { observable, toJS }
    \react-dom : { render }
    \react
    \./app.ls
    \./data-scheme.ls
    \./browser/window.ls
    \./web3.ls
    \./autodetect-lang.ls
    \./get-device.ls
}
state =
    timeout: null
store = observable data-scheme
change-device = ->
    store.current.device = get-device!
lock-wallet = ->
    return if window.nolock is yes
    store.current.page = \locked
new-idle = ->
    set-timeout lock-wallet, 30000
reset-idle = ->
    clear-timeout state.timeout
    state.timeout = new-idle!
window.addEventListener "resize", change-device
for event in <[ mousemove click touchmove keydown ]>
    window.addEventListener event, reset-idle
export web3t = web3 store
export store
Main = observer ({store})->
    app { store, web3t }
export bootstrap = (root, options)->
    store.root = root
    render do
        Main.pug( store=store)
        root
    autodetect-lang store if options?auto-lang isnt no
    web3t.set-preference options if typeof! options is \Object
window <<<< out$