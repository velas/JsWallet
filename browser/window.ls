require! {
    \./location.ls
}
document = {}
scroll-to = ->
mock-window = { scroll-to, location, document }
module.exports = window ? mock-window