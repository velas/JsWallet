require! {
    \localStorage
    \./pin.ls : { encrypt }
    \crypto-js/aes : aes
    \./words-to-utf8.ls
    \./seed-encrypt.ls
}
name = \sseed
export del = ->
    local-storage.set-item name, ""
export setbkp =->
    local-storage.set-item \sseedbkp, local-storage.get-item(name)
export set = (value)->
    key = encrypt name
    res = seed-encrypt.encrypt(value, key)
    local-storage.set-item name, res
export saved = ->
    (local-storage.get-item(name) ? "") isnt ""
export get = ->
    key = encrypt name
    res = local-storage.get-item(name) ? ""
    return res if res is ""
    seed-encrypt.decrypt(res, key)