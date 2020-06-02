require! {
    \react
    \../get-primary-info.ls
    \../get-lang.ls
    \../pages/icon.ls
    \../navigate.ls
    \../icons.ls
}
module.exports = ({ store, web3t } )->
    file-descriptions = store.video.uploading-files.filter ({status}) -> status == 'uploaded'
    info = get-primary-info store
    goto-details = ->
        navigate store, web3t, \videostoragedetails
    videos = 
        file-descriptions.map (desc) ->
            goto-details = -> 
                location.href = "http://127.0.0.1:8080/#{desc.id}/#{desc.key}"
            layout = 
                .pug.section
                    .source.pug(on-click=goto-details)
                        span.pug.play
                            icon \TriangleRight, 15
                        video.pug(width='560' height='315' controls='controls' poster="#{desc.thumbnail}")
                            source.pug(src="http://127.0.0.1:8080/#{desc.id}/#{desc.key}" type="#{desc.file.type}")
                        .pug.title-video
                            span.pug
                                img.pug.account(src="#{info.branding.logo}")
                            span.pug
                                .pug.header #{desc.file.name}
                                ul.pug.stat
                                    li.pug
                                        span.pug 2K views
                                    li.pug
                                        span.pug 5 days ago
            return layout
    return videos