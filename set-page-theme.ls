require! {
    \./themes.ls
}
module.exports = (store, name)->
    #console.log \page-theme, name
    body = window?document?body
    return if not body?
    theme = themes[name]
    return if not theme?
    body.style.background-color = theme.background