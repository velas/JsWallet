module.exports = (value)->
    return \... if not value?
    [head, dec] = value.to-string!.split(\.)
    return "#{head}.00" if (dec ? "").length is 0
    "#{head}.#{dec.substr 0, 8}"