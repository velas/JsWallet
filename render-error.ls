require! {
    \react
}
.error
    color: red
    padding: 20px
    border: 1px solid red
    background: rgba(red, 0.1)
module.exports = (err)->
    message = "UI Rendering Error: #{err?message ? err}. Please contract to wallet developer"
    .pug.error #{message}