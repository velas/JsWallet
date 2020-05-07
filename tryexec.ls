module.exports = (cb)-> 
    try
        cb!
    catch err
        alert "#{err}"