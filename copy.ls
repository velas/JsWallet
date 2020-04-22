require! {
    \react
    \./icons.ls
}
.copy
    height: 16px
    cursor: pointer
module.exports = (store)->
    img.copy.pug(src="#{icons.copy-icon}")