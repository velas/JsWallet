add-commas = (x)->
    x = x.toString!
    pattern = /(-?\d+)(\d{3})/
    while pattern.test x
        x := x.replace pattern, "$1,$2"
    x
module.exports = (value)->
    return \.. if not value?
    return \.. if value is \..
    [head, dec] = value.to-string!.split(\.)
    first-head = add-commas head
    return "#{first-head}.00" if (dec ? "").length is 0
    "#{first-head}.#{dec.substr 0, 4}"