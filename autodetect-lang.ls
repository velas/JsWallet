require! {
    \../web3t/providers/superagent.ls : { get }
}
module.exports = (store)->
    return
    err, res <- get "https://web3.space/user-lang" .end
    return if err?
    return store.lang = \uk if res.text is \ua
    return store.lang = \ru if res.text is \ru