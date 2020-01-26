stringify =  (word-array)->
    { words, sig-bytes } = word-array
    latin1-chars = []
    for i of [0 to sig-bytes - 1]
        s = 24 - (i % 4) * 8
        t = words[i .>>>. 2] .>>>. s
        bite = t .&. 0xff
        latin1-chars.push String.fromCharCode bite
    decodeURIComponent escape latin1-chars.join('')
module.exports = { stringify }