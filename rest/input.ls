require! {
    \react
}
module.exports = (config)->
    change = (e)->
        config.value = e.target.value
    .pug.form-group
        label.pug.col-sm-2.control-label #{config.label}
        .pug.col-sm-10
            if config.hint?
                .input-group.pug
                    input.pug.form-control(type='text' on-change=change placeholder="#{config.label}")
                    .input-group-addon.pug.bootstrap-touchspin-postfix(title="#{config.hint}") ?
            else
                input.pug.form-control(type='text' on-change=change placeholder="#{config.label}")