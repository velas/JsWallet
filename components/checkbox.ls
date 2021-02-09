require! {
    \react
    \../get-primary-info.ls
    \../round5.ls
    \../round.ls
    \prelude-ls : { find }
    \../math.ls : { times }
    \./keyboard.ls
}
.outer-checkbox
    .active-checkbox
        position: relative
        display: inline-block
        width: 48px
        height: 20px
        margin-top: 7px
        margin-right: 0px
        input
            display: none
            &:checked + .track
                background-color: #3cd5af
                &:before
                    -webkit-transform: translateX(28px)
                    transform: translateX(28px)
        .track
            cursor: pointer
            position: absolute
            top: 0
            left: 0
            right: 0
            bottom: 0
            background-color: #463f50
            -webkit-transition: 0.25s
            transition: 0.25s
            &:before
                content: ""
                position: absolute
                box-shadow: 0 2px 1px -1px rgba(0, 0, 0, 0.2), 0 1px 1px 0 rgba(0, 0, 0, 0.14), 0 1px 3px 0 rgba(0, 0, 0, 0.12)
                background-color: #fafafa
                -webkit-transition: 0.25s
                transition: 0.25s
        .thumb
            border-radius: 35px
            &:before
                top: 0px
                right: 28px
                width: 20px
                height: 20px
                border-radius: 50%
module.exports = ({ store, type, value, on-change, on-click, checked, id, disabled=no, style })->
    classString = ""
    style = get-primary-info store
    .pug.outer-checkbox
        label.active-checkbox.pug
            input.pug(type='checkbox' value=value on-change=on-change checked=checked id="#{id}")
            .track.thumb.pug