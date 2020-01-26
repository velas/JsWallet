require! {
    \react
    \native-base : { Footer, FooterTab, Button }
    \../Styles.js : styles 
    \@expo/vector-icons : { Ionicons }
}
styles = styles.default
button = (store, name, icon)->
    is-active = store.tab is name
    activate = ->
        store.tab = name
    Button.pug(active=is-active style=styles.footerButtonStyle onPress=activate )
        Ionicons.pug(name=icon size=32 style=styles.iconFooter)
module.exports = ({ store }) ->
    Footer.pug(style=styles.footerHeight)
        FooterTab.pug(style=styles.footerTab)
            button store, "Wallets", "ios-wallet"
            button store, "WalletHistory", "ios-time"
            button store, "Settings", "ios-settings"