require! {
    \react
    \../components/button.ls
    \prelude-ls : { map, filter, head, find } 
    \../../web3t/providers/superagent.ls : { get }
    \../get-primary-info.ls
    \../icons.ls
    \../navigate.ls
    \../components/burger.ls
}
.wallets
    @import scheme
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    margin-left: $left-margin
    >.title
        position: sticky
        position: -webkit-sticky
        z-index: 1
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
    >.header
        padding: 50px
        font-size: 40px
    >.platforms
        text-align: center
        padding: 40px 0
        >.platform
            display: inline-block
            width: 300px
            padding: 20px
            vertical-align: top
            text-overflow: ellipsis
            border: 1px solid white
            overflow: hidden
            margin: 10px 1%
            border-radius: $border
            >.tag_name
                margin-bottom: 10px
            .title-icons
                height: 40px
                margin: 10px 0
            a
                padding: 10px
            >.title
                font-size: 15px
                font-weight: bold
            >.source
                &.link
                    a
                        text-decoration: underline
                        padding: 0
            >.source, >.download
                padding: 10px 0 0
                box-sizing: content-box
                a
                    text-decoration: none
                    text-transform: uppercase
                    font-size: 10px
                    font-weight: bold
                    cursor: pointer
                    outline: none
                    display: inline-block
                    overflow: hidden
                    white-space: nowrap
                    width: 80px
                    border-radius: $border
build-version = (store, release)-->
    style = get-primary-info store
    button-primary1-style=
        border: "0"
        color: style.app.text
        background: style.app.primary1
    button-primary3-style=
        border: "0"
        color: style.app.text2
        background: style.app.primary3
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-link=
        border: "0"
        color: style.app.text2
        background: "transparent"
    resource =
        color: style.app.text
        border: "1px solid #{style.app.border}"
        background: style.app.header
    #md5-file = store.releases |> filter (.name is "#{name}.md5") |> head
    #md5 = md5-file.release.browser_download_url
    [...parts, last] = release.name.split('.')
    source = "https://github.com/velas/JsWalletDesktop"
    name = 
        | last is 'dmg' => \MacOS
        | last is 'exe' => \Windows
        | last is 'snap' => \Linux
    icon = 
        | last is 'dmg' => \ "#{icons.macos}"
        | last is 'exe' => \ "#{icons.windows}"
        | last is 'snap' => \ "#{icons.linux}"
    console.log "#{release.name}.md5"
    md5-file =
        store.releases |> find (-> it.name is "#{release.name}.md5")
    .pug.platform(style=resource)
        img.pug.title-icons(src="#{icon}")
        .pug.title #{name}
        .pug.tag_name #{release.tag_name}
        .pug.source
            a.pug(href="#{source}" style=button-primary3-style target="_blank") Source Code
        .pug.download
            a.pug(href="#{release.browser_download_url}" style=button-primary1-style target="_blank") Download
        .pug.source.link
            a.pug(href="#{md5-file?browser_download_url}" style=button-link target="_blank") MD5
only-version = (item)->
    [...parts, last] = item.name.split('.')
    last in <[ dmg exe snap ]>
only-md5 = (item)->
    [...parts, last] = item.name.split('.')
    last in <[ md5 ]>
header = (store, web3t)->
    info = get-primary-info store
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
    goto-search = ->
        navigate store, web3t, \search
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.title(style=border-style)
        .pug.header(class="#{show-class}") Download Wallets
        .pug.close(on-click=goto-search)
            img.icon-svg.pug(src="#{icons.arrow-left}")
        burger store, web3t
module.exports = ({ store, web3t })->
    .pug.wallets
        header store, web3t
        .pug.platforms
            store.releases |> filter only-version |> map build-version store
#update-md5 = ([release, ...releases], cb)->
#    return cb null if not release?
#    err, data <- get release.browser_download_url .end
#    return cb err if err?
#    console.log data.text
#    release.content = data.text 
#    update-md5 releases, cb
module.exports.init = ({ store, web3t}, cb)->
    console.log \init
    #https://github.com/velas/JsWalletDesktop/releases/download/v0.12.111/velas-desktop-wallet-0.12.111-mac.zip
    #https://uploads.github.com/repos/velas/JsWalletDesktop/releases/27269358/assets{?name,label}
    err, data <- get \https://api.github.com/repos/velas/JsWalletDesktop/releases .end
    return cb err if err?
    console.log \init, err, data
    latest-release =
        data.body |> head
    return cb "latest release is not found" if not latest-release? 
    console.log \latest-release.assets_url , latest-release.assets_url
    err, data <- get latest-release.assets_url .end
    console.log \init, err, data
    return cb err if err?
    store.releases = data.body |> map (-> { ...it, latest-release.tag_name })
    #md5-items = 
    #    store.releases |> filter only-md5
    #<- update-md5 md5-items
    cb null