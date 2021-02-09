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
    &:disabled
        opacity: 0.3
    &.width-auto
        width: auto !important
loader = ->
    .loader-ios.pug
        svg.pug(width='15px' height='15px' viewbox='0 0 15 15' version='1.1' xmlns='http://www.w3.org/2000/svg')
            path.pug(d='M10.3866667,5.83333333 C10.2338889,5.56722222 10.3238889,5.22777778 10.5894444,5.07388889 L13.2333333,3.54555556 C13.5011111,3.39388889 13.8416667,3.48444444 13.9944444,3.75 C14.1477778,4.01611111 14.0583333,4.35666667 13.7922222,4.50777778 L11.1455556,6.03611111 C10.8794444,6.18944444 10.5405556,6.09833333 10.3866667,5.83333333 Z')
            path.pug(d='M8.96277778,3.85444444 L10.4905556,1.20722222 C10.6438889,0.941666667 10.9844444,0.85 11.25,1.00388889 C11.5161111,1.15722222 11.6061111,1.49611111 11.4527778,1.76277778 L9.92611111,4.40833333 C9.77277778,4.675 9.43277778,4.76666667 9.16666667,4.61277778 C8.90055556,4.45944444 8.80888889,4.11888889 8.96277778,3.85444444 Z')
            path.pug(d='M7.49944444,4.16666667 C7.19277778,4.16666667 6.94388889,3.91777778 6.94388889,3.61055556 L6.94388889,0.555555556 C6.94388889,0.247777778 7.19277778,0 7.49944444,0 C7.80722222,0 8.05666667,0.248333333 8.05666667,0.555555556 L8.05666667,3.61055556 C8.05555556,3.91833333 7.80722222,4.16666667 7.49944444,4.16666667 Z')
            path.pug(d='M4.61277778,5.83333333 C4.45888889,6.09833333 4.11944444,6.18944444 3.85444444,6.03611111 L1.20833333,4.50777778 C0.942777778,4.35666667 0.851111111,4.01611111 1.00444444,3.75 C1.15833333,3.48388889 1.49888889,3.39333333 1.76388889,3.54555556 L4.40944444,5.07388889 C4.67555556,5.22777778 4.76666667,5.56722222 4.61277778,5.83333333 Z')
            path.pug(d='M5.07388889,4.40944444 L3.54611111,1.76333333 C3.39277778,1.49666667 3.48444444,1.15777778 3.74888889,1.00444444 C4.015,0.850555556 4.35444444,0.941111111 4.50833333,1.20777778 L6.03611111,3.855 C6.18833333,4.11944444 6.09833333,4.45944444 5.83222222,4.61277778 C5.56722222,4.76722222 5.22722222,4.675 5.07388889,4.40944444 Z')
            path.pug(d='M3.61055556,8.05555556 L0.555555556,8.05555556 C0.247777778,8.05555556 0,7.80666667 0,7.5 C0,7.19222222 0.248333333,6.94388889 0.555555556,6.94388889 L3.61055556,6.94388889 C3.91722222,6.94388889 4.16666667,7.19277778 4.16666667,7.5 C4.16666667,7.80666667 3.91777778,8.05555556 3.61055556,8.05555556 Z')
            path.pug(d='M4.61277778,9.16777778 C4.76666667,9.43333333 4.67555556,9.77222222 4.41,9.92666667 L1.76444444,11.4538889 C1.49888889,11.6055556 1.15833333,11.5161111 1.00444444,11.2505556 C0.851111111,10.9844444 0.942777778,10.6455556 1.20833333,10.4905556 L3.85388889,8.96388889 C4.11944444,8.80888889 4.45888889,8.90055556 4.61277778,9.16777778 Z')
            path.pug(d='M6.03666667,11.1455556 L4.50888889,13.7938889 C4.355,14.0577778 4.01444444,14.1488889 3.74944444,13.995 C3.48444444,13.8411111 3.39277778,13.5027778 3.54666667,13.2366667 L5.07444444,10.59 C5.22833333,10.325 5.56777778,10.2355556 5.83333333,10.3872222 C6.09888889,10.5411111 6.18944444,10.8805556 6.03666667,11.1455556 Z')
            path.pug(d='M7.49944444,10.8344444 C7.80722222,10.8344444 8.05666667,11.0833333 8.05666667,11.3911111 L8.05666667,14.4455556 C8.05666667,14.7511111 7.80777778,15.0005556 7.49944444,15.0005556 C7.19277778,15.0005556 6.94388889,14.7522222 6.94388889,14.4455556 L6.94388889,11.3911111 C6.94388889,11.0833333 7.19222222,10.8344444 7.49944444,10.8344444 Z')
            path.pug(d='M9.92611111,10.59 L11.4527778,13.2366667 C11.6055556,13.5027778 11.5155556,13.8411111 11.25,13.995 C10.9838889,14.1483333 10.6438889,14.0572222 10.4905556,13.7938889 L8.96277778,11.1455556 C8.80944444,10.8805556 8.90111111,10.5411111 9.16666667,10.3872222 C9.43277778,10.2355556 9.77277778,10.325 9.92611111,10.59 Z')
            path.pug(d='M10.3866667,9.16777778 C10.54,8.90111111 10.8794444,8.80888889 11.145,8.96388889 L13.7922222,10.4905556 C14.0583333,10.6455556 14.1477778,10.9844444 13.9944444,11.2505556 C13.8416667,11.5166667 13.5011111,11.6061111 13.2333333,11.4538889 L10.5894444,9.92666667 C10.3238889,9.77222222 10.2338889,9.43277778 10.3866667,9.16777778 Z')
            path.pug(d='M14.4433333,6.94388889 L11.3872222,6.94388889 C11.0805556,6.94388889 10.8311111,7.19277778 10.8311111,7.5 C10.8311111,7.80666667 11.0794444,8.05555556 11.3872222,8.05555556 L14.4433333,8.05555556 C14.7511111,8.05555556 15,7.80666667 15,7.5 C15,7.19222222 14.7511111,6.94388889 14.4433333,6.94388889 Z')
button-loading = ({ store, text, loading, on-click, icon, type })->
    style = get-primary-info store
    lang = get-lang store
    button-style = get-button-style store, type
    button.pug.btn.btn-primary.loading(style=button-style)
        span.pug 
            loader
get-button-style = (store, type)->
    style = get-primary-info store
    button-primary1-style=
        border: "0"
        color: style.app.text-invert
        background: style.app.primary1
        background-color: style.app.primary1-spare
    button-primary3-style=
        border: "0"
        color: style.app.text4
        background: style.app.primary3
        background-color: style.app.primary3-spare
    button-primary2-style=
        border: "0"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    button-style =
        | type is \primary => button-primary1-style
        | type is \secondary => button-primary2-style
        | _ => button-primary3-style
    button-style
button-active = ({ store, classes, text, loading, on-click, icon, type, mstyle, id, error, makeDisabled, no-icon })->
    lang = get-lang store
    style = get-primary-info store
    applied-text = lang[text] ? text ? ""
    applied-icon = icons[icon ? text] ? icons.more
    button-style = get-button-style store, type
    filter=
        filter: style.app.filter
    icon-style=
        | type is \primary => filter
    disabled = (makeDisabled? and makeDisabled) or (error? and typeof! error is \String and error.length > 0)
    custom-style = mstyle ? {}
    button.pug.btn(class="#{classes}" on-click=on-click style=button-style id=id disabled=disabled)
        if (no-icon? and no-icon is no) or !no-icon? then
            if store.current.device is \mobile
                img.icon-svg.pug(src="#{applied-icon}" title="#{applied-text}" style=icon-style)
            else
                span.pug
                    img.icon-svg.pug(src="#{applied-icon}" style=icon-style)
                    span.pug #{applied-text}
        else
            span.pug #{applied-text}
component = (config)->
    return button-loading(config) if config.loading is yes
    button-active config
module.exports = component