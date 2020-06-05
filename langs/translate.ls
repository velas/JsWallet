require! {
    \yandex-translate
    \./support.json
    \./config.json : { key }
    \prelude-ls : { obj-to-pairs, pairs-to-obj, each, map, filter }
    \fs : { write-file, read-file, exists }
}

cb = console.log

filename = \./langs/langs.json 

{ translate } = yandex-translate key


translate-line = (line, to, cb)->
    console.log \translate, line, to
    err, data <- translate line, { to }
    return cb err if err?
    res = data.text?0
    return cb "Cannot translate #{line} -> #{to}" if not res?
    console.log "en -> #{to}", line
    cb null, res
translate-pairs = ([pair, ...rest], to, cb)->
    return cb null, [] if not pair?
    err, item <- translate-line pair.1, to
    return cb err if err?
    new-pair = [pair.0, item]
    err, all-rest <- translate-pairs rest, to
    return cb err if err?
    all = [new-pair] ++ all-rest
    cb null, all

get-new-fields = (new-data, to, cb)->
    res =
        new-data |> obj-to-pairs |> filter (-> not it.1?) |> map (-> it.0)
    cb null, res
translate-object = (set-from, set-to, to, cb)->
    console.log \check, to
    err, new-fields <- get-new-fields set-to, to
    return cb err if err?
    return cb null, set-to if new-fields.length is 0
    en-fields =
        set-from |> obj-to-pairs |> filter (-> it.0 in new-fields)
    err, translated <- translate-pairs en-fields, to
    return cb err if err?
    items =
        translated |> pairs-to-obj
    set-to <<<< items
    cb null, set-to

save-json = (filename, json, cb)->
    result = JSON.stringify json, null, 4
    err <- write-file filename, result
    cb err




get-item = (data, lang)->
    index = data.languages.index-of(lang)
    data.mapping 
        |> obj-to-pairs 
        |> map -> [it.0, it.1[index]]
        |> pairs-to-obj

translate-lang = (filename, to, data, cb)->
    set-from = get-item data , \en
    set-to = get-item data, to
    err, result <- translate-object set-from, set-to, to
    return cb err if err?
    index = data.languages.index-of to
    update-item = ([name, value])->
        return if data.mapping[name][index] is result[name]
        data.mapping[name][index] = result[name]
    data.mapping |> obj-to-pairs |> each update-item
    err <- save-json filename, data
    cb null
    
#err, data <- read-file filename , 'utf8'

#return cb err if err?
    




translate-all = (filename, [lang, ...rest], data, cb)->
    return cb null if not lang?
    err <- translate-lang filename, lang, data
    return cb err if err?
    err <- translate-all filename, rest, data
    return cb err if err?
    cb null



module.exports = translate-all

