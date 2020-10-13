require! {
    \react
    \react-dom
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \./icon.ls
    \./switch-account.ls
    \../icons.ls
    \./epoch.ls
    \./alert-demo.ls
    \prelude-ls : { map }
    \../math.ls : { minus }
    \../components/text-field.ls
    \../components/button.ls
    \../components/burger.ls
}
.vote
    @import scheme
    $border-radius: $border
    $smooth: opacity .15s ease-in-out
    position: relative
    display: block
    width: auto
    overflow: hidden
    margin-left: $left-margin
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:$ipad)
        width: 100%
        margin: 0
    >.title
        position: sticky
        position: -webkit-sticky
        background: linear-gradient(100deg, #331462 4%, #15063c 100%)
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        z-index: 3
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
    .wrapper
        height: calc(100vh - 120px)
        display: flex
        overflow-y: scroll
        scrollbar-width: none
        padding: 0
        .side
            display: inline-grid
            margin: 0 auto
            width: 70%
            @media(max-width:800px)
                width: 100%
            .filter
                height: 60px
                margin: 20px 20px 10px 20px
                position: relative
                .view
                    position: absolute
                    top: 0
                    right: 20px
                    li
                        cursor: pointer
                        opacity: 1
                        img
                            &:nth-child(1)
                                display: none
                            &:nth-child(2)
                                display: inline-block
                        &.compact
                            img
                                &:nth-child(1)
                                    display: inline-block
                                &:nth-child(2)
                                    display: none
                ul
                    display: flex
                    list-style: none
                    padding-left: 20px
                    line-height: 30px
                    li
                        margin-left: 20px
                        cursor: pointer
                        font-size: 17px
                        opacity: .4
                        &.active
                            opacity: 1
                        &:first-child
                            margin: 0
                        img
                            width: 13px
            .main-content
                height: 100vh
                margin: 0px 20px 10px 20px
                &.create-new-proposal
                    height: auto
                    input
                        outline: none
                        width: 100%
                        box-sizing: border-box
                        height: 36px
                        line-height: 36px
                        border-radius: 0
                        padding: 0px 10px
                        font-size: 14px
                        margin: 5px 0
                        border: 0px
                        box-shadow: none
                        ~ .keyboard-panel
                            display: none
                .item
                    padding: 15px
                    display: flex
                    text-align: left
                    position: relative
                    transition: all .5s
                    &.compact
                        padding: 10px
                        .screen
                            display: none
                            a
                                display: none
                        .description
                            margin-left: 0px
                            .sub-header
                                margin-right: 60px
                        .rate
                            margin-right: 10px
                        .label
                            right: 10px
                    &:hover
                        background: var(--bg-primary-light)
                        transition: all .5s
                        cursor: pointer
                    .label
                        position: absolute
                        background: var(--bg-primary-light)
                        font-size: 8px
                        text-transform: uppercase
                        letter-spacing: 2px
                        top: 0
                        padding: 20px 10px 5px
                        border-bottom-right-radius: 3px
                        border-bottom-left-radius: 3px
                        right: 15px
                        box-shadow: 0px 9px 9px 0px rgba(0, 0, 0, 0.05)
                    .rate
                        margin-right: 15px
                        padding: 3px 0
                        width: 50px
                        ul
                            padding: 0
                            margin: 0
                            list-style: none
                            text-align: center
                            li
                                cursor: pointer
                                opacity: .4
                                padding: 5px
                                &:nth-child(2)
                                    opacity: 1
                                &:last-child
                                    transform: rotate(180deg)
                                &.active
                                    opacity: 1
                    .screen
                        img
                            width: 130px
                            height: 100px
                            border-radius: 7px
                            box-shadow: 0px 6px 10px 0px rgba(0, 0, 0, 0.15)
                            @media(max-width:800px)
                                display: none
                        a
                            position: relative
                            @media(max-width:800px)
                                display: none
                            &:after
                                bottom: 6px
                                background: $source
                                height: 15px
                                width: 15px
                                content: ""
                                display: inline-block
                                background-repeat: no-repeat
                                background-size: contain
                                vertical-align: middle
                                position: absolute
                                right: 0
                    .description
                        margin-left: 15px
                        .progress
                            width: 300px
                            @media(max-width:800px)
                                width: 200px
                            progress
                                width: 100%
                            span
                                font-size: 12px
                                float: left
                                &:last-child
                                    float: right
                        .header
                            font-weight: 500
                            color: #6f6fe2
                            font-size: 22px
                            line-height: 28px
                            margin-right: 60px
                            cursor: pointer
                            overflow: hidden
                            text-overflow: ellipsis
                            a
                                color: #fff
                                opacity: .8
                                line-height: 1.6
                                font-size: 13px
                                margin-left: 10px
                                &:after
                                    background: $source
                                    height: 10px
                                    width: 10px
                                    content: ""
                                    display: inline-block
                                    background-repeat: no-repeat
                                    background-size: contain
                                    vertical-align: middle
                                    margin-left: 4px
                        .sub-header
                            opacity: .8
                            line-height: 1.6
                            font-size: 13px
                            margin-right: 60px
            >.filter, >.main-content
                &:last-child
                    @media(max-width:800px)
                        margin-top: 0px
                @media(max-width:800px)
                    margin: 20px
item = (store, web3t)-> (vote)->
    lang = get-lang store
    info = get-primary-info store
    [description, url, progress, votesUpWeight, votesDownWeight] = vote
    vote = votesUpWeight `minus` votesDownWeight
    border=border-bottom: "1px solid #{info.app.border}"
    background=background: "#{info.app.primary}"
    add-class = ->
        store.current.rate = not store.current.rate
    raise =
        if store.current.rate then \ "" else \active
    lower =
        if store.current.rate then \active else \ ""
    view =
        if store.current.view then \compact else \ ""
    update-progress = ->
        newp = store.development.new-proposal
        newp.update-progress = progress
    .pug.item(style=border class="#{view}")
        span.pug.label(style=background) Sphere
        .pug.rate
            ul.pug
                li.pug(class="#{raise}" on-click=add-class)
                    img.pug(src="#{icons.rate}")
                li.pug #{vote}
                li.pug(class="#{lower}" on-click=add-class)
                    img.pug(src="#{icons.rate}")
        .pug.screen
            a.pug(href="#")
                img.pug(src="https://res.cloudinary.com/dfbhd7liw/image/upload/v1586441544/velas/Bitmap.png")
        .pug.description
            .pug.header #{description}
            .pug.sub-header #{url}
            .pug.progress
                progress.pug(value="#{progress}" max="100")
                span.pug Start
                span.pug End
urlR = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
content = (store, web3t)->
    lang = get-lang store
    info = get-primary-info store
    style =
        color: info.app.text
        border: "1px solid #{info.app.border}"
        background: info.app.header
    border-style =
        color: info.app.text
        border: "1px solid #{info.app.border}"
        padding: "15px"
        margin-top: "-11px"
    add-class = ->
        store.current.view = not store.current.view
    view =
        if store.current.view then \compact else \ ""
    newp = store.development.new-proposal
    create-new-vote = ->
        newp.opened = yes
    change-description = ->
        newp.description = it.target.value
    change-url = ->
        newp.url = it.target.value
    change-progress = ->
        newp.progress = it.target.value
    apply-new-vote = ->
        cb = alert
        return cb "description should be longer" if newp.description.length < 10
        return cb "url must be defined" if not newp.url.match(urlR)?
        return cb "progress must be defined" if not newp.progress.match(/[0-9]+/)?
        data = web3t.velas.Development.add-proposal.get-data newp.description, newp.url, newp.progress
        return cb err if err?
        to = web3t.velas.Development.address
        amount = 0
        err <- web3t.vlx2.send-transaction { to, data, amount, gas: 9600000, gas-price: 1000000 }
        #newp.description, newp.url
    cancel-new-vote = ->
        newp.description = ""
        newp.url = ""
        newp.progress = \0
        newp.opened = no
    .pug.side
        .pug.filter(style=style)
            ul.pug
                li.pug
                    img.pug(src="#{icons.best}")
                    | Best
                li.pug.active
                    img.pug(src="#{icons.hot}")
                    | Hot
                li.pug
                    img.pug(src="#{icons.new}")
                    | New
                li.pug
                    img.pug(src="#{icons.top}")
                    | Top
            ul.pug.view
                li.pug(class="#{view}" on-click=add-class)
                    img.pug(src="#{icons.compact}")
                    img.pug(src="#{icons.classic}")
                li.pug(on-click=create-new-vote)
                    img.pug(src="#{icons.create}")
                    img.pug(src="#{icons.create}")
        if newp.update-progress
            .pug.create-new-proposal.main-content(style=border-style) Please make upgrade process here
        if newp.opened is yes
            .pug.create-new-proposal.main-content(style=border-style)
                text-field { store, value: newp.description , on-change: change-description , placeholder: "description" }
                text-field { store, value: newp.url , on-change: change-url , placeholder: "url" }
                text-field { store, value: newp.progress , on-change: change-progress , placeholder: "progress" }
                button { store, on-click: apply-new-vote , type: \primary , icon : \apply , text: \btnApply }
                button { store, on-click: cancel-new-vote , icon : \close2 , text: \cancel }
        .pug.main-content(style=style)
            store.development.proposals |> map item store, web3t
vote = ({ store, web3t })->
    lang = get-lang store
    goto-search = ->
        navigate store, web3t, \search
    info = get-primary-info store
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.vote
        alert-demo store, web3t
        .pug.title(style=border-style)
            .pug.header(class="#{show-class}") Vote
            .pug.close(on-click=goto-search)
                img.icon-svg.pug(src="#{icons.arrow-left}")
            burger store, web3t
            epoch store, web3t
            switch-account store, web3t
        .pug.wrapper
            content store, web3t
module.exports = vote
build-proposal-view = ({ web3t, store }, index, cb)->
    err, proposal <- web3t.velas.Development.getProposalByIndex index
    return cb err if err?
    cb null, proposal
build-proposal-views = ({ web3t, store }, length, cb)->
    return cb null, [] if length is 0
    <- set-immediate
    next-length = length - 1
    err, proposal-view <- build-proposal-view { web3t, store }, next-length
    return cb err if err?
    err, rest <- build-proposal-views { web3t, store }, next-length
    return cb err if err?
    cb null
module.exports.init = ({ web3t, store }, cb)->
    err, length <- web3t.velas.Development.proposal-length!
    return cb err if err?
    err, proposals <- build-proposal-views { web3t, store }, +length
    return cb err if err?
    store.development.proposals = proposals
    cb null