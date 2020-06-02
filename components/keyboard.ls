require! {
    \react
    \prelude-ls : { map }
    \../get-primary-info.ls
}
.keyboard
    .key
        $size: 40px
        user-select: none
        cursor: pointer
        display: inline-block
        width: $size
        height: $size
        text-align: center
        line-height: $size
        &:hover
            font-weight: bold
genCharArray = (charA, charZ) ->
    a = []
    i = charA.charCodeAt 0
    j = charZ.charCodeAt 0
    while i <= j
        a.push String.fromCharCode i
        ++i
    a
az = genCharArray 'a', 'z'
di = genCharArray '0', '9'
sp = [".", "←"]
build-key = (store, value, on-change)-> (key)->
    style = get-primary-info store
    change = (e)->
        value2 =
            | key is '←' and typeof! value is \String and value.length > 0 => value.substr(0, value.length - 1)
            | key is '←' => "#{value}"
            | value? => "#{value}#{key}"
            | _ => key
        target = { value: value2 }
        on-change { target }
    button-style =
        background: style.app.background
        color: style.app.text
    .pug.key(on-click=change style=button-style) #{key}
numpad = (store, value, on-change)->
    .pug.keyboard
        (di ++ sp) |> map build-key store, value, on-change
all = (store, value, on-change)->
    .pug.keyboard
        (az ++ di ++ sp) |> map build-key store, value, on-change 
module.exports = ({ store, type, on-change, value })->
    return null if store.current.device is \mobile
    return numpad store, value, on-change if type is \number
    all store, value, on-change