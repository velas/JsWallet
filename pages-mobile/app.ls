require! {
    \./global.js
    \react
    \mobx : { observable }
    \mobx-react : { observer }
    \./Store.js
    \./Pages.js : pages
    \./pages/StartPage.js
    \./web3t.js
}
Main = observer ({ store }) ->
    pages.default[store.tab]({ store, web3t })
build-wallet-info = (token)->
    {
        token: token
        logo: web3t[token].getConfig!.image
        balance: "0"
    }
store = observable Store.default
module.exports = class App extends react.Component
    render: ->
        Main.pug(store=store)