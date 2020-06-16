require! {
    \prelude-ls : { obj-to-pairs, pairs-to-obj, each, map, filter }
    \fs : { write-file, read-file, exists }
    \commander : { Command }
    \./translate.ls
    \./newword.ls
    \./sync.ls
    \fs : { read-file }
}

filename = "./langs/langs.json"

cb = console.log


program = new Command!

program.option('--newword <word>', 'enter word')
program.option('--sync', 'sync all words with https://docs.google.com/spreadsheets/d/1CsISZgog2swmXOarx418BNN-Zy_9zBptWOXqsutzRWs/edit#gid=0')

program.parse(process.argv)

err, content <- read-file filename
return cb err if err?
    
body = JSON.parse content

err, body <- newword { filename, program, body }
return cb err if err?


languages = 
    body |> (.languages)

err, result <- translate filename, languages, body
return cb err if err?

err <- sync { filename, program }
return cb err if err?
cb null