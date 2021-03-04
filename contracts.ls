require! {
    \prelude-ls : { map, find, keys, filter }
    \./velas/addresses.ls
}
export get-contract-by-name = (name)->
    addresses[name] 
export get-contract-name = (address)->
    #res = to-eth-address address
    result = 
        addresses 
            |> keys 
            |> filter (it)->
                (addresses[it] ? "").to-lower-case! is address.to-lower-case!
    result[0] ? address
export is-contract = (address)->
    return no if not address?
    addresss = "#{address}".trim!
    return no if addresss is ""  
    found = 
        addresses 
            |> keys 
            |> find (it)->
                addresses[it] is addresss
    found? and found.length > 0