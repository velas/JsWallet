module.exports = (value)->
    return "0" if not value?
    value.to-string!.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1')