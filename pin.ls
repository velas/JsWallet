require! {
    \localStorage
    \crypto-js/aes : aes
    \crypto-js/md5 : md5
    \./words-to-utf8.ls
}
mem = 
    encrypt: null
get-key = (value)->
    value + 'cb562eb3-c442-4866-a1a9-70a9'
export set = (value)->
    key = get-key value
    res = aes.encrypt(value, key)
    local-storage.set-item \spin, res
export exists = ->
    (local-storage.get-item(\spin) ? "") isnt ""
export encrypt = (str)->
    return mem.encrypt(str) if typeof! mem.encrypt is \Function
    \unsecure
export check = (value)->
    return no if typeof! value isnt \String
    return no if value.length isnt 4
    mem.encrypt = (str)->
        md5(value + '234ef' + str).toString!
    res = local-storage.get-item(\spin) ? ""
    return no if res.length is 0
    key = get-key value
    decrypted = aes.decrypt(res, key).toString(words-to-utf8)
    decrypted is value