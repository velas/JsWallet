fs = require \fs

describe 'Basic', !(_)->
  reactify = require \../reactify.js
  compiler = require \livescript
  it \load, !->
    code = reactify fs.read-file-sync(\./files/basic.ls).to-string(\utf-8)
    console.log code.ls