require! {
    \superagent : { get, post }
}
module.exports = (store)->
    err, res <- get "https://web3.space/user-lang" .end
    return if err?
    return store.lang = \ua if res.text is \ua
    return store.lang = \ru if res.text is \ru