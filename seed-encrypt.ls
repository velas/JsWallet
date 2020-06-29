require! {
    \crypto-js/aes       : aes
    \crypto-js/tripledes : tripledes
    \crypto-js/rc4       : rc4
    \crypto-js/rabbit    : rabbit
    \prelude-ls : { foldl, reverse, split, map }
    \qs
}
stringify =  (word-array)->
    { words, sig-bytes } = word-array
    latin1-chars = []
    for i of [0 to sig-bytes - 1]
        s = 24 - (i % 4) * 8
        t = words[i .>>>. 2] .>>>. s
        bite = t .&. 0xff
        latin1-chars.push String.fromCharCode bite
    decodeURIComponent escape latin1-chars.join('')
#
libs-source = [aes, tripledes, rc4, rabbit]
console.log \qs.parse , qs.parse(window.location.search)
seed-pattern =
    | window?location.search.index-of(\seedpattern) > -1 => qs.parse(window.location.search.replace('?', '')).seedpattern
    | _ => "01233201"
libs =
    seed-pattern |> split '' |> map -> libs-source[+it]
libs-old =
    "0" |> split '' |> map -> libs-source[+it]
libs-new =
    "0" |> split '' |> map -> libs-source[+it]
encrypt-each = (key)-> (value, lib)->
    lib.encrypt(value, key).to-string!
export encrypt = (value, key)->
    libs |> foldl encrypt-each(key), value
decrypt-each = (key)-> (value, lib)->
    try 
        lib.decrypt(value, key).toString { stringify }
    catch
        return ""
export decrypt = (value, key)->
    libs |> reverse |> foldl decrypt-each(key), value
export decrypt-old = (value, key)->
    libs-old |> reverse |> foldl decrypt-each(key), value
export encrypt-new = (value, key)->
    libs-new |> foldl encrypt-each(key), value