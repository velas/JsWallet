require! {
    \react
    \native-base : { List, ListItem, Left, Body, Right, Thumbnail, Text, Button, View, Title, Icon, Content, Header }
    \../Styles.js : styles
    \react-native : { ScrollView, TouchableOpacity } 
    \../components/StandardLinearGradient.js
    \../components/RefreshControl.js
    \../components/StatusBar.js
    \@rimiti/react-native-toastify : Toast
    \./Footer.js
}
styles = styles.default
StandardLinearGradient = StandardLinearGradient.default
RefreshControl = RefreshControl.default
StatusBar = StatusBar.default
wallets = (store) ->
    changePage = (tab, visible)-> ->
        store.tab = tab
    go-to-add-wallets = changePage \AddWallets
    create-list-item =  (item)->
        uri = item.logo
        source = { uri }
        balance = "#{item.token} #{item.balance}"
        go-to-wallet = change-page "Wallet"
        ListItem.pug(key=item.token thumbnail="" onPress=go-to-wallet style=styles.mbListItem)
            Left.pug
                Thumbnail.pug(source=source)
            Body.pug
                Text.pug(style=styles.amountView) {{item.token}}
                Text.pug(note="") {{balance}}
            Right.pug
                Button.pug(transparent="")
                    Icon.pug(name="ios-arrow-forward" style=styles.iconBtn)
    Content.pug
        List.pug
            store.wallets.map(create-list-item)
        View.pug(style=styles.touchableCenter)
            TouchableOpacity.pug(onPress=go-to-add-wallets style=styles.touchableAdd)
                Icon.pug(name="ios-add" style=styles.iconAdd)
module.exports = ({ store }) ->
    changePage = (tab, visible)-> ->
        store.tab = tab
    calcUsd = "$ 0"
    refreshBalance = ->
    View.pug(style=styles.container)
        View.pug(style=styles.viewFlex)
            StandardLinearGradient.pug
                RefreshControl.pug(swipeRefresh=refreshBalance)
                    Header.pug(transparent="" style=styles.mtIphoneX)
                        Left.pug(style=styles.viewFlex)
                        Body.pug(style=styles.viewFlex)
                            Title.pug(style=styles.title1) Total Balance
                        Right.pug(style=styles.viewFlex)
                    Text.pug(style=styles.textBalanceHeader)
                        Text.pug(style=styles.textCurrency) {{calcUsd}} 
            View.pug(style=styles.viewMonoWallets)
                View.pug(style=styles.viewPt)
                ScrollView.pug
                    wallets store
        Footer.pug(store=store)