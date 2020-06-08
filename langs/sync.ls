require! {
    \read-write-google-spreadsheet : Spreadsheet
    \./config.json : { oauth2 }
    \./langs.json
    \prelude-ls : { obj-to-pairs, map, zip, pairs-to-obj, find, each }
    \fs : { write-file }
}

opts =
  debug: yes
  spreadsheetId: \1CsISZgog2swmXOarx418BNN-Zy_9zBptWOXqsutzRWs
  worksheetName: \Response
  worksheetId: \od6
  oauth2: oauth2

spreadsheet = new Spreadsheet opts

build-row = (langs, lang)-->
    [name, values] = lang
    headers = langs.languages
    pairs = zip headers, values
    all-pairs = [["key", name]] ++ pairs
    pairs-to-obj all-pairs

add-new-column-to-drive = (headers, google-row, google-row-index, local-row, cb)->
    
    updated-row = { ...google-row }
    
    update-langs = ([name, value])->
        return if name is \key
        index = headers.index-of(name)
        return if index is -1
        updated-row[name] = local-row[index] if updated-row[name].length is 0
    google-row |> obj-to-pairs |> each update-langs
    
    return cb null if JSON.stringify(updated-row) is JSON.stringify(google-row)
    err <- spreadsheet.update-row { row: google-row-index , ...updated-row }
    cb null
    
update-from-drive = (google-row, google-row-index, langs, cb)->
    #console.log \update-from-drive , google-row
    return cb null if not google-row?
    lang = langs.mapping[google-row.key]
    return cb "not exists" if not lang?
    #update from google drive is not implemented yet
    headers = langs.languages
    update-langs = ([name, value])->
        return if name is \key
        index = headers.index-of(name)
        return if index is -1
        lang[index] = value if lang[index].length > 0 and value.length > 0
    google-row |> obj-to-pairs |> each update-langs
    err <- add-new-column-to-drive headers, google-row, google-row-index, lang
    return cb err if err?
    cb null

sync-row = (google-rows, langs, wallet-row, cb)->
    console.log \sync-row, wallet-row.key
    already-there =
        google-rows |> find (.key is wallet-row.key)
    already-there-index = google-rows.index-of already-there
    return update-from-drive already-there, already-there-index, langs, cb  if already-there?
    err <- spreadsheet.add-new-row wallet-row
    return cb err if err?
    cb null

save-langs-updated = (langs, cb)->
    err <- write-file "\./langs/langs.updated.json", JSON.stringify(langs, null, 4)
    return cb err if err?
    cb null

sync-all = (google-rows, langs, [wallet-row, ...wallet-rows], cb)-->
    return save-langs-updated langs, cb if not wallet-row?
    err <- sync-row google-rows, langs, wallet-row
    return cb err if err?
    err <- sync-all google-rows, langs, wallet-rows
    return cb err if err?
    #finalize changes
    cb null
wallet-rows =
    langs.mapping 
        |> obj-to-pairs 
        |> map build-row langs


module.exports = ({ program }, cb)->
    return cb null if not program.sync?
    err, google-rows <- spreadsheet.get-all-rows
    return cb err if err?
    err <- sync-all google-rows, langs, wallet-rows
    return cb err if err?
    cb null, \done
