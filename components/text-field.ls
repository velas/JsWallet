require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find }
    \../math.ls : { times }
    \./keyboard.ls
    \../icons.ls
}
.input-area
    position: relative
    margin: 10px 0
    width: 100%
    box-sizing: border-box
    height: 36px
    line-height: 36px
    >*
        display: inline-block
        box-sizing: border-box  
        margin: 0 !important
        height: inherit
        line-height: inherit
        vertical-align: top
    >input
        display: inline-block
        width: calc(100% - 70px)
        padding: 0 10px
    >.keyboard-panel
        >.show-details
            position: absolute
            display: none
            top: 25px
            left: 0px
            z-index: 9999
            width: 400px
        &:hover
            >.show-details
                display: inline-block
        >.icon-svg
            position: absolute
            right: 8px
            top: 13px
module.exports = ({ store, value, on-change, placeholder, type, on-key-down })->
    style = get-primary-info store
    input-style =
        background: style.app.input
        color: style.app.text
        overflow-x: \auto
        margin-bottom: \5px
        border-radius: \6px
    btn-icon =
        filter: style.app.btn-icon
    actual-placeholder = placeholder ? ""
    chosen-type = 
        | type is \password => \password
        | _ => \text
    .pug.input-area
        input.pug(type="#{chosen-type}" value="#{value}" style=input-style on-change=on-change placeholder=actual-placeholder auto-complete="off" on-key-down=on-key-down)
        if store.current.device isnt \mobile
            span.keyboard-panel.pug
                img.icon-svg.pug(src="#{icons.keyboard}" style=btn-icon)
                .show-details.pug(style=input-style)
                    .panel.pug
                        keyboard { store , on-change=on-change, value }