module.exports = ->
    m = Math.max(document.documentElement.clientWidth, window.innerWidth or 0)
    r =
        | m > 800 => \desktop
        | _ => \mobile