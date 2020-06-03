require! {
    \read-write-google-spreadsheet : Spreadsheet
    \./config.json : { oauth2 }
    \./langs.json
    \prelude-ls : { obj-to-pairs, map, zip, pairs-to-obj, find }
}

opts =
  debug: yes
  spreadsheetId: \1CsISZgog2swmXOarx418BNN-Zy_9zBptWOXqsutzRWs
  worksheetName: \Response
  worksheetId: \od6
  oauth2: oauth2

spreadsheet = new Spreadsheet opts

err, google-rows <- spreadsheet.get-all-rows

build-row = (langs, lang)-->
    [name, values] = lang
    headers = langs.languages
    pairs = zip headers, values
    all-pairs = [["key", name]] ++ pairs
    pairs-to-obj all-pairs

sync-row = (google-rows, langs, wallet-row, cb)->
    console.log \sync-row, wallet-row
    already-there =
        google-rows |> find (.key is wallet-row.key)
    return cb null if already-there?
    err <- spreadsheet.add-new-row wallet-row
    return cb err if err?
    cb null

sync-all = (google-rows, langs, [wallet-row, ...wallet-rows])-->
    return cb null if not wallet-row?
    err <- sync-row google-rows, langs, wallet-row
    return cb err if err?
    
    err <- sync-all google-rows, langs, wallet-rows
    return cb err if err?
    cb null

wallet-rows =
    langs.mapping 
        |> obj-to-pairs 
        |> map build-row langs


cb = console.log
err <- sync-all google-rows, langs, wallet-rows
return cb err if err?
cb null, \done
