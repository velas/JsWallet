module.exports = (value, config)->
    return "0" if not value?
    if +value is 0 then return value
    [head, dec] = value.to-string!.split(\.)
    if not dec? then return value
    {decimals} = config
    decimals = 0 if not decimals?
    dec = dec.substr 0, decimals
    "#{head}.#{dec}"