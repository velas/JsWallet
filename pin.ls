require! {
    \localStorage
    \crypto-js/md5 : md5
    \./seed-encrypt.ls
}
mem =
    encrypt: null
get-key = (value)->
    value + 'cb562eb3-c442-4866-a1a9-70a9'
export del = ->
    local-storage.set-item \spin, ""
export setbkp =->
    local-storage.set-item \spinbkp, local-storage.get-item(\spin)
export set = (value)->
    key = get-key value
    res = seed-encrypt.encrypt(value, key)
    local-storage.set-item \spin, res
export exists = ->
    (local-storage.get-item(\spin) ? "") isnt ""
export encrypt = (str)->
    return mem.encrypt(str) if typeof! mem.encrypt is \Function
    \unsecure
try-migrate = (value)->
    res = local-storage.get-item(\spin) ? ""
    key = get-key value
    decrypted = seed-encrypt.decrypt-old(res, key)
    if decrypted is not value
        return no
    local-storage.set-item \spinbkp, local-storage.get-item(\spin)
    local-storage.set-item \sseedbkp, local-storage.get-item(\sseed)
    key-sseed = encrypt \sseed
    local-storage.set-item \spin, (seed-encrypt.encrypt decrypted, key)
    sseed = seed-encrypt.decrypt-old (local-storage.get-item(\sseed) ? ""), key-sseed
    local-storage.set-item \sseed, (seed-encrypt.encrypt sseed, key-sseed)
    console.log "Migration successed"
    return yes
export check = (value)->
    return no if typeof! value isnt \String
    return no if value.length < 4
    mem.encrypt = (str)->
        md5(value + '234ef' + str).toString!
    res = local-storage.get-item(\spin) ? ""
    return no if res.length is 0
    key = get-key value
    decrypted = seed-encrypt.decrypt(res, key)
    if decrypted is value
        return yes
    #Not decrypted. Try to use old method. Reencrypt in case of success
    try-migrate value
#    decrypted is value