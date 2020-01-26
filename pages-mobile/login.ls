require! {
    \react
    \react-native : { Image, Clipboard, Keyboard, TouchableOpacity, ImageBackground }
    \native-base : { Text, Button, View, Icon, Container, Content, Item, Input, Card, CardItem, Body, Header, Left, Right, Form, Textarea }
    \../Styles.js : styles
    \react-native-gradient-buttons : GradientButton
}
GradientButton = GradientButton.default
styles = styles.default
module.exports = ({ store }) ->
    changePage = (tab, visible)-> ->
        store.tab = tab;
    confirm-seed = ->
        store.tab = \ConfirmSeed
    generateRandom = ->
    style = 
        color: \#fff
    intro-bg = require "../assets/intro-bg.jpg"
    velas-logo = require "../assets/velas-logo.png"
    back =
        width: "100%"
        height: "100%"
    card-item-style =
        borderWidth: 1
        borderRadius: 5
        width: "100%"
        borderColor: \#fff
        marginTop: 20
    large =
        fontSize: 14
    seed-style=
        padding: 10
    changePin = ->
    selectionColor = \#fff
    View.pug(style=styles.viewFlex)
        ImageBackground.pug(source=intro-bg style=back)
            Header.pug(transparent="" style=styles.mtIphoneX)
                Left.pug(style=styles.viewFlex)
                Body.pug(style=styles.viewFlex)
                Right.pug(style=styles.viewFlex)
            View.pug(style=styles.containerFlexStart)
                Image.pug(source=velas-logo style=styles.styleLogo)
                Text.pug(style=styles.textH1Seed) Please Enter Your Password
                View.pug(style=styles.card1)
                    CardItem.pug(style=styles.cardItemSeed)
                        Body.pug
                            View.pug(style=card-item-style)
                                View.pug(style=seed-style)
                                    Item.pug(regular="")
                                        Input.pug(onChangeText=changePin returnKeyType="done" placeholder="Password" keyboardType="password" placeholderTextColor="#707070" style=styles.inputSize selectionColor=selectionColor)
                            View.pug(style=styles.marginBtn)
                                GradientButton.pug(style=styles.gradientBtnPh text="Enter" textStyle=large gradientBegin="#9d41eb" gradientEnd="#9d41eb" gradientDirection="diagonal" height=50 width="100%" radius=10 onPressAction=generateRandom)
                TouchableOpacity.pug(onPress=confirm-seed)
                    Text.pug(style=styles.textLoginStyle) Continue