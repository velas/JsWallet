require! {
    \prelude-ls : { map, find, keys, filter }
    \./velas/addresses.ls
    \./math.ls : { div }
    \./swaping/addresses.ls : \swapping-addresses
}
export get-contract-by-name = (store, name)->
    network = store.current.network
    addresses[network][name] 
export get-contract-name = (store, address)->
    #res = to-eth-address address
    network = store.current.network
    result = 
        addresses[network] 
            |> keys 
            |> filter (it)->
                (addresses[network][it] ? "").to-lower-case! is address.to-lower-case!
    result[0] ? address
export is-contract = (store, address)->
    return no if not address?
    network = store.current.network
    addresss = "#{address}".trim!
    return no if addresss is ""  
    found = 
        addresses[network] 
            |> keys 
            |> find (it)->
                addresses[network][it].to-lower-case! is addresss.to-lower-case!
    found? and found.length > 0
export is-swap-contract = (store, address)->
    return no if not address?
    network = store.current.network
    addresss = "#{address}".trim!
    return no if addresss is ""  
    found = 
        swapping-addresses[network] 
            |> keys 
            |> find (it)->
                swapping-addresses[network][it].to-lower-case! is addresss.to-lower-case!
    found? and found.length > 0
export get-home-network-fee = ({store, web3t}, address, cb)->
    name = get-contract-name(store, address)
    return cb null if name isnt "ForeignBridge"
    err, fee <- web3t.velas.HomeBridgeNativeToErc.getHomeFee!
    return cb err if err?
    return cb null, (fee `div` (10^18))