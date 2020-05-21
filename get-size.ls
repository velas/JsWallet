module.exports = ->
    width = Math.max(document.documentElement.clientWidth, window.innerWidth or 0)
    height = Math.max(document.documentElement.clientHeight, window.innerHeight or 0)
    { width, height }