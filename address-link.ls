get-address-label = (wallet)->
    | wallet.coin.token in <[ xem eos ]> => \account
    | _ => \address
get-address = (wallet, address-suffix="")->
    wallet["address#{address-suffix}"]
export get-address-link = (wallet, address-suffix)->
    address = get-address(wallet, address-suffix)
    res=
        | not wallet.network? => \about:blank
        | wallet.coin.token is \btc => "https://bitpay.com/insight/#/BTC/#{global.store.current.network}/address/#{address}"
        | typeof! address is \String => "#{wallet.network.api.url}/#{get-address-label(wallet)}/#{address}"
        | typeof! address is \Null and wallet.public-key? =>  wallet.network.register-account-link.replace(':public-key', wallet.public-key)
        | _ => "#"
    res
export get-address-title = (wallet, address-suffix)->
    address = get-address(wallet, address-suffix)
    res =
        | typeof! address is \String => address
        | typeof! address is \Null => "..."
        | _ => "n/a"
    res