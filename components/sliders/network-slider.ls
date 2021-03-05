require! {
    \react
    \../../get-primary-info.ls
    \../../round5.ls
    \../../round.ls
    \prelude-ls : { find }
    \../../math.ls : { times }
    \../../icon.ls
    \../../icons.ls
}
.network-slider
    .button
        .button-inner
            position: relative
            img
                height: 15px !important
                top: 0 !important
module.exports = ({ store, value, id })->
    style = get-primary-info store
    style2 = color: "#{style.app.icon}"
    input-style2 =
        background: style.app.input
        color: style.app.text
        border: "0"
    button-primary2-style=
        border: "1px solid #{style.app.wallet}"
        color: style.app.text
        background: style.app.primary2
        background-color: style.app.primary2-spare
    ###
    network-type = store.current.network
    networks = store.current.send.networks
    display-value = store.current.send.chosen-network["#{network-type}"].to-upper-case!
    ###   
    on-change-contract-network = (event)->   
        store.current.send.chosen-network["#{network-type}"] = event.target.value
    form-group = (title, style, content)->
        .pug.form-group
            label.pug.control-label(style=style) #{title}
            content!
    .pug.network-slider
        label.pug.control-label(style=style2) Choose Network
        .pug
            span.pug.button.left(on-click style=button-primary2-style)
                .pug.button-inner
                    img.icon-svg.pug(src="#{icons.arrow-left}")
            span.pug.bold
                input.pug.change-network(value="#{display-value}" style=input-style2 on-change=on-change-contract-network disabled=true)
            span.pug.button.right(on-click style=button-primary2-style)
                .pug.button-inner
                    img.icon-svg.pug(src="#{icons.arrow-right}")