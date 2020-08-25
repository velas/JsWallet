require! {
    \react
    \../icons.ls
    \../get-primary-info.ls
    \../get-lang.ls
}
.btn
    @import scheme
    width: auto
    min-width: 80px
    padding: 0 6px
    line-height: 36px
    height: 36px
    text-transform: uppercase
    border: 0
    text-align: center
    font-weight: bold
    border: 0
    margin: 5px
    font-size: 10px
    border-radius: $border
    display: inline-block
    cursor: pointer
    box-sizing: border-box
    transition: all 0.5s
    &:hover
        background: rgba(#6CA7ED, 0.2)
        opacity: 0.9
button-loading = ({ store, text, loading, on-click, icon, type })->
    style = get-primary-info store
    lang = get-lang store
    button-style = get-button-style store, type
    button.pug.btn.btn-primary.loading(style=button-style)
        span.pug ...
get-button-style = (store, type)->
    style = get-primary-info store
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    button-primary2-style=
        border: "0"
        color: style.app.text
        background: style.app.primary2
    button-style =
        | type is \primary => button-primary1-style
        | type is \secondary => button-primary2-style
        | _ => button-primary3-style
    button-style
button-active = ({ store, text, loading, on-click, icon, type })->
    lang = get-lang store
    applied-text = lang[text] ? text ? ""
    applied-icon = icons[icon ? text] ? icons.more
    button-style = get-button-style store, type
    button.pug.btn(on-click=on-click style=button-style)
        if store.current.device is \mobile
            img.icon-svg.pug(src="#{applied-icon}" title="#{applied-text}")
        else
            span.pug
                img.icon-svg.pug(src="#{applied-icon}")
                span.pug #{applied-text}
component = (config)->
    return button-loading(config) if config.loading is yes
    button-active config
module.exports = component