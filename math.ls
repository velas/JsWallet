require! {
    \bignumber.js
    \prelude-ls : { map, pairs-to-obj }
}
math = ($)-> (x, y)->
    return '..' if x is '..' or y is '..'
    try
        if typeof x is \number
            debugger
        if typeof y is \number
            debugger
        new bignumber(x)[$](y).to-fixed!
    catch err
        throw "#{x} #{$} #{y} = #{err}"
module.exports =
    <[ plus minus times div ]>
        |> map -> [it, math(it)]
        |> pairs-to-obj