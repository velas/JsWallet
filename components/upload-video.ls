require! {
    \react
    \prelude-ls : { map, find }
    \../icons.ls
    \../get-primary-info.ls
    \../../web3t/json-parse.ls
}
#TODO: move to utils
as-callback = (p, cb)->
    p.catch (err) -> cb err
    p.then (data)->
        cb null, data
wait-xhr-upload = (xhr, cb) ->
    #maybe timeout is needed here
    xhr.add-event-listener \load, (event) ->
        return null if xhr.readyState != 4
        return cb xhr.statusText if xhr.status != 200
        return cb null, xhr.responseText
        cb null, event
make-video-thumbnail = (file, cb) ->
    url = URL.createObjectURL file
    video = document.create-element \video
    timeupdate = ->
        if snap-image!
            video.remove-event-listener \timeupdate , timeupdate
            video.pause!
    video.add-event-listener \loadeddata , ->
        if snap-image!
            video.remove-event-listener \timeupdate , timeupdate
    video.add-event-listener  \error , ->
        if cb and not cb.is-callback-called
            cb null
            cb.is-callback-called = yes
    snap-image = ->
        canvas = document.create-element 'canvas'
        canvas.width = video.video-width;
        canvas.height = video.video-height;
        (canvas.get-context '2d').draw-image video, 0, 0, canvas.width, canvas.height
        image = canvas.to-dataURL!
        success = image.length > 1000
        if success
            img = document.create-element 'img'
            img.src = image
            (document.get-elements-by-tag-name 'div').0.append-child img
            URL.revoke-objectURL url
            if cb and not cb.is-callback-called
                cb image #(image.split ',').1
                cb.is-callback-called = yes
        else
            if cb and not cb.is-callback-called
                cb null
                cb.is-callback-called = yes
        return success
    video.add-event-listener 'timeupdate', timeupdate
    video.preload = 'metadata'
    video.src = url
    video.muted = yes
    video.plays-inline = yes
    video.play!
on-browse-files = ->
    (document.get-element-by-id 'browse-files-video').click!
get-vlx-private-address = ({ store }, cb)->
    wallets = store?current?account?wallets ? []
    wallet =
        wallets |> find (.coin?token is \vlx2)
    return cb "wallet vlx2 not found" if not wallet?
    cb null, wallet.private-key
upload-video-files-recursive = ({ store, web3t }, [file, ...files], cb)->
    return cb null if not file?
    file-description = store.video.uploading-files.find (desc) -> desc.file == file
    return cb null if not file-description?
    thumbnail <- make-video-thumbnail file
    #need to follow cb err, success standard everywhere
    file-description.thumbnail = thumbnail
    # console.log data
    form-data = new Form-data
    err, private-address <- get-vlx-private-address { store }
    return cb err if err?
    form-data.append \key, private-address.substr 2
    form-data.append \video, file
    form-data.append \preview, file
    form-data.append \len, \file
    form-data.append \title, \file
    url = 'https://video.velas.com/upload'
    xhr = new XMLHttpRequest!
    on-progress = (event) ->
        file-description.status = \uploading
        file-description.uploaded = event.loaded
    xhr.upload.add-event-listener \progress, on-progress
    xhr.open \POST, url
    xhr.set-request-header \Accept, \application/json
    xhr.send form-data
    err, text <- wait-xhr-upload xhr
    # TODO: err processing?
    # p = fetch url, params
    # err, text <- as-callback p
    file-description.status = \error if err?
    file-description.error = err if err?
    return cb err if err?
    err, body <- json-parse text
    file-description.status = \error if err?
    file-description.error = err if err?
    return cb err if err?
    # body = {thumbnail, name: file.name, type: file.type, ...body}
    file-description.id = body.id
    file-description.key = body.key
    file-description.node = body.node
    file-description.status = \uploaded
    return cb null, [body] if files.length is 0
    err, new-bodies-array <- upload-video-files-recursive { store, web3t }, files
    return cb err, null if err?
    return cb null, [body, ...new-bodies-array]
drop-zone = ({ store, web3t }) ->
    upload-video-files = (event) ->
        files = event.target.files or event.data-transfer.files
        file-input = if event.target.tagName is \INPUT then event.target else null
        return null if files.length is 0
        #file is not an array. It is array-like object without map method
        file-descriptions = [...files].map (file) -> {file, uploaded: 0, status: 'waiting'}
        store.video.uploading-files = [...store.video.uploading-files, ...file-descriptions]
        err, data <- upload-video-files-recursive { store, web3t }, files
        if file-input
            try
                file-input.value = ''
            catch {message}
                console.error "Cannot clean up file input", message
    return null if not store.video.drag
    info = get-primary-info store
    dashed-border=
        border-color: "#{info.app.border}"
        color: info.app.color3
    icon-style=
        filter: info.app.nothing-icon
    input-file-style= 
        {visibility: \hidden, width: 0, height: 0}
    drag-file-close = ->
        store.video.drag = not store.video.drag
    on-drag-over = (event) ->
        event.prevent-default!
    .header-table.dragfile.dragarea.pug(on-click=drag-file-close on-drag-over=on-drag-over on-drop=upload-video-files)
        .pug.cell.network(style=dashed-border)
            img.pug.bounce(src="#{icons.img-drag}" style=icon-style)
            | Drag and Drop here
            br.pug
            | or
            input.pug(id='browse-files-video' type='file' multiple=yes on-change=upload-video-files style=input-file-style)
            span.pug(on-click=on-browse-files) Browse files
module.exports = ({ store, web3t })->
    drop-zone { store, web3t }