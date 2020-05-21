require! {
    \react
    \identicon
}
module.exports = ({ store, address})->
    options =
        backColor: "rbg(255,255,255)"
        size: 36
        id: address
    image = identicon.generate-sync options
    img.pug.identicon(src="#{image}")