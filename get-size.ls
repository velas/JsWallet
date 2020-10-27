module.exports = ->
    width = Math.max(document?.documentElement?.clientWidth or 0, window?.innerWidth or 0)
    height = Math.max(document?.documentElement?.clientHeight or 0, window?.innerHeight or 0)
    { width, height }