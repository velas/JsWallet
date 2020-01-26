require! {
    \react
}
module.exports = ({ children })->
    .pug#wrapper
        .row.pug.content
            .pug.col-lg-2
            .pug.col-lg-8
                children
            .pug.col-lg-2