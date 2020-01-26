require! {
    \react
}
module.exports = (config)->
    change = (e)->
        config.value = e.target.value
    .pug.form-group
        label.pug.control-label.col-sm-2 #{config.label}
        .pug.col-sm-10
            .pug.input-group
                input.pug.form-control(type='text' on-change=change placeholder="#{config.label}")
                .pug.input-group-addon ETH
                .input-group-addon.pug.bootstrap-touchspin-postfix(title="#{config.hint}") ?