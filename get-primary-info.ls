require! {
    \./get-primary-coin.ls
    \./themes.ls
    \./icons.ls
}
default-logo = "#{icons.logo-primary}"
small-logo = "#{icons.logo-sm}"
module.exports = (store)->
    coin = get-primary-coin store
    branding =
        logo: coin?branding?logo ? default-logo
        logo-sm: coin?branding?logo-sm ? small-logo
        title: coin?branding?title ? "WALLET"
    links = coin?links ? []
    color = coin?color ? "#000000"
    app = 
        | store.current.network is \mainnet => themes[store.theme] ? themes.dark
        | _ => themes.testnet
    { app, branding, links, color }