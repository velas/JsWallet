require! {
    \./support.json
    \./config.json : { key }
    \yandex-translate
    \prelude-ls : { obj-to-pairs, pairs-to-obj, each, map, filter }
    \fs : { write-file, read-file, exists }
    \node-lcs : lcs
}

module.exports = ({ program, filename, body } , cb)->

    return cb "expected body" if not body?
    return cb "expected filename" if not filename?
    return cb null, body if not program.newword?
    
    items = 
        body.mapping |> obj-to-pairs |> map (-> it.1.0)
    
    
    
    res =
      items 
        |> filter (-> it is program.newword )   
    
    
    
    return cb "`#{program.newword}` is already exist" if res.length > 0
    
    #return cb "#{program.newword} is wrong. supports only [a-z]" if program.newword.match(/[a-zA-Z]+/)?0 isnt program.newword
    
    
    res =
      items 
        |> map (-> lcs(it, program.newword) ) 
        |> filter (.length > program.newword.length - 1)
        |> map (.sequence)
    
    
    return cb "Found #{res.length} places where this word is used somehow: #{res.join(',')}. Please check this places" if res.length > 0
    
    check-grammar = (cb)->
        { translate } = yandex-translate key
        to = \ru
        err, data <- translate program.newword, { to }
        return cb err if err?
        [ translation ] = data.text
        to = \en
        err, data <- translate translation, { to }
        return cb err if err?
        [ origin ] = data.text
        return cb null if origin is program.newword
        cb "Word is not perfect. `#{program.newword}` -> #{translation} -> #{origin}"
    
    #err, data <- check-grammar
    #return cb err if err?
    
    keys = 
        body.mapping |> obj-to-pairs |> filter (-> it.0 is program.newword.to-lower-case!)
        
    return cb "this key is already availabe" if keys.length > 0
    
    console.log \add, program.newword
    body.mapping[program.newword.to-lower-case!] = [program.newword]
    
    #str = JSON.stringify body, null, 4
    #err <- write-file "./langs/langs.json", str
    #return cb err if err?
    cb null, body