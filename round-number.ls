module.exports = (value, config)->
    return "0" if not value?
    {decimals, digits, maxValue} = config
    if maxValue? and +value > +maxValue then
        return maxValue 
    decimals = 10 if not decimals?
    if +value is 0 and "#{value}".length <= decimals then return value
    [head, dec] = value.to-string!.split(\.)  
    if digits? and head.length > digits then 
        head = head.substr 0, digits
    if not dec? then return head
    dec = dec.substr 0, decimals
    "#{head}.#{dec}"