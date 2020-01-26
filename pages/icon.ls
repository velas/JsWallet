require! {
    \@primer/octicons-react
    \react
}
Octicon = octicons-react.default
module.exports = (name, size=32)->
    icon = octicons-react[name]
    Octicon.pug(icon=icon size=size)