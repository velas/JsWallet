require! {
    \react
}
module.exports = (config)->
    change = (e)->
        config.value = e.target.value
    .pug.form-group
        label.pug.col-sm-2.control-label #{config.label}
        .pug.col-sm-10
            select.pug.form-control.m-b(name='account' on-change=change)
                for option in config.options
                    option.pug(value="#{option}") #{option}