export cut = (str, number)->
    return "" if not str?
    n = number ? 10
    s = str.to-string!
    if s.length > n
        s.substr(0, n) + \...
    else
        s
format-money = (value)->
add = (all, next)->
    l = [3, 7, 11, 15, 19, 23]
    comma = if l.index-of(all.length) > -1 then \, else ""
    next + comma + all
export money = (value)->
    return null if not value?
    [head, tail] = value.to-string!.split(\.)
    h = head.split("").reverse!.reduce(add, "") 
    t = (tail ? "000").substr(0, 3)
    e = switch t.length 
        case 3 then t
        case 2 then "#{t}0" 
        case 1 then "#{t}00"
        case 0 then "00"
    "#{h}.#{e}"