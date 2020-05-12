require! {
    \./support.json
    \./config.json : { key }
    \yandex-translate
    \prelude-ls : { obj-to-pairs, pairs-to-obj, each, map, filter }
    \fs : { write-file, read-file, exists }
    \commander : { Command }
    \node-lcs : lcs
    \./translate.ls
}

filename = "./langs/langs.json"

cb = console.log

program = new Command!

program.option('--word <word>', 'enter word')

program.parse(process.argv)

return console.log "expected --word Someword" if not program.word?


err, content <- read-file filename

body = JSON.parse content

items = 
    body.mapping |> obj-to-pairs |> map (-> it.1.0)



res =
  items 
    |> filter (-> it is program.word )   



return cb "`#{program.word}` is already exist" if res.length > 0

return cb "#{program.word} is wrong. supports only [a-z]" if program.word.match(/[a-zA-Z]+/)?0 isnt program.word


res =
  items 
    |> map (-> lcs(it, program.word) ) 
    |> filter (.length > program.word.length - 1)
    |> map (.sequence)


return cb "Found #{res.length} places where this word is used somehow: #{res.join(',')}. Please check this places" if res.length > 0

check-grammar = (cb)->
    { translate } = yandex-translate key
    to = \ru
    err, data <- translate program.word, { to }
    return cb err if err?
    [ translation ] = data.text
    to = \en
    err, data <- translate translation, { to }
    return cb err if err?
    [ origin ] = data.text
    return cb null if origin is program.word
    cb "Word is not perfect. `#{program.word}` -> #{translation} -> #{origin}"

err, data <- check-grammar
return cb err if err?

keys = 
    body.mapping |> obj-to-pairs |> filter (-> it.0 is program.word.to-lower-case!)
    
return cb "this key is already availabe" if keys.length > 0

console.log \add, program.word
body.mapping[program.word.to-lower-case!] = [program.word]

#str = JSON.stringify body, null, 4
#err <- write-file "./langs/langs.json", str
#return cb err if err?

languages = 
    body |> (.languages)

err, result <- translate filename, languages, body
return cb err if err?
cb null, \done