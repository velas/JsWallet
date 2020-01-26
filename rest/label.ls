require! {
    \react
}
module.exports = ({value, label})->
    .pug.form-group
        label.pug.col-sm-2.control-label #{label}
        label.pug.col-sm-10.control-label.text-left #{value}