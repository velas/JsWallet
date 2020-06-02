require! {
    \react
    \../get-primary-info.ls
    \../pages/icon.ls
}
module.exports = ({ store, web3t } )->
    info = get-primary-info store
    file-descriptions = store.video.uploading-files.filter ({status}) -> status != 'uploaded'
    row = (desc) ->
        .pug.table-row-menu(key="#{desc.file.name}")
            .col.folder-menu.pending.pug
                img.pug(src="#{store.filestore.extension-icons.txt}")
                .pug.file-name #{desc.file.name}
            .col.folder-menu.progress.pug
                progress.pug(value="#{Math.floor desc.uploaded / desc.file.size * 100}" max="100")
    filter-body =
        border: "1px solid #{info.app.border}"
        background: info.app.header
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
        position: "sticky"
    hide-progress =
        if store.current.progress then \hide-progress else \ ""
    active =
        if store.current.active then \active else \ ""
    switch-progress = ->
        store.current.progress = not store.current.progress
    box =
        .pug.active-download(style=filter-body)
            .pug.top(style=header-table-style)
                .pug.table-row-menu
                    span.col.folder-menu.pug
                        .pug Uploading #{file-descriptions.length} item(s)
                    ul.action.col.pug(class="#{active}")
                        li.pug(on-click=switch-progress class="#{hide-progress}")
                            span.pug
                                icon "ChevronDown", 15
                        li.pug
                            span.pug
                                icon \X, 15
            .pug(style=header-table-style class="#{hide-progress}")
                .pug.table-row-menu
                    span.col.folder-menu.pug
                        .pug Left ?min.
                    span.col.cancel.pug Cancel
            .pug(class="#{hide-progress}")
                file-descriptions.map row
    return box