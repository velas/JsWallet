require! {
    \prelude-ls : { obj-to-pairs, pairs-to-obj, map }
}
get-lang = (index)-> ([name, value])->
    [name, value[index]]
module.exports = (store)->
    index = store.langs.languages.index-of(store.lang)
    return null if index is -1
    store.langs.mapping 
        |> obj-to-pairs 
        |> map get-lang index
        |> pairs-to-obj