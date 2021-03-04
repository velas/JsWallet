require! {
    \react
    \../../get-primary-info.ls
    \../../round5.ls
    \../../round.ls
    \prelude-ls : { find }
    \../../math.ls : { times }
    \../keyboard.ls
    \../../icons.ls
    \../../icon.ls
}
module.exports = ({ store, ref, style, value, on-change, type, on-key-down, id })->
    #style = get-primary-info store
    #style2 = color: "#{style.app.icon}"
    #button-primary2-style=
        #border: "1px solid #{style.app.wallet}"
        #color: style.app.text
        #background: style.app.primary2
        #background-color: style.app.primary2-spare
    .pug.slider.network-slider.form-group
        label.pug.control-label Choose Network
        .pug
            span.pug.button.left(on-click)
                icon \ChevronLeft, 15
            span.pug.bold
                input.pug.change-index(value="#{value}" on-change)
            span.pug.button.right(on-click)
                icon \ChevronRight, 15