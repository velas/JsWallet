require! {
    \../get-primary-info.ls
    \react
    \prelude-ls : { map }
    \../get-lang.ls
}
.links
    text-align: center
    .link
        display: inline-block
        border-radius: 30px
        background: black
        padding: 5px
        margin: 2px
        width: 30px
        height: 30px
        box-sizing: border-box
        >img
            width: auto
            height: 100%
            &:hover
                background: gray
                transition: background .5s
create-link = (store, item)-->
    info = get-primary-info store
    style =
        background-color: info.color
    a.pug.link(href="#{item.href}" style=style target="_blank")
        img.pug(src="#{item.image}")
module.exports = ({ store })->
    info = get-primary-info store
    style = { info.color }
    if info.links.length is 0
        .pug(style=style) No Links
    else
    .pug.links
        info.links |> map create-link store