doCache = no
CACHE_NAME = 'velas-pwa-cache-v1'
cb = console.log
as-callback = (p, cb)->
    p.then (res)->
        cb null, res
    p.catch (err)->
        cb err
urlsToCache =
    * './'
    * './main-bundle.css'
    * './main-bundle.js'
self.addEventListener 'activate', (event) ->
    console.log \activate event.waitUntil
    cacheWhitelist = [CACHE_NAME]
    event.waitUntil caches.keys!.then ((keyList) ->
        console.log 'caches' caches
        Promise.all keyList.map ((key) ->
            if not cacheWhitelist.includes key
                console.log 'Deleting cache: ' + key
                return caches.delete key
            return )
        return )
    return
#
self.addEventListener 'install', (event) ->
    event.waitUntil (caches.open CACHE_NAME).then ((cache) ->
        cache.addAll urlsToCache
    )
    return
#
self.addEventListener 'fetch', (event) ->
    #console.log event.request.url
    if doCache
        event.respondWith (caches.match event.request).then ((response) -> response || fetch event.request)
    return