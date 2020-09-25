require! {
    \react
    \../../web3t/providers/superagent.ls : { get }
    \prelude-ls : { map, keys, head, filter, sort-by, reverse }
    \moment
    \./switch-account.ls
    \../icons.ls
    \./epoch.ls
    \../get-primary-info.ls
    \../navigate.ls
    \../components/burger.ls
}
.monitor
    @import scheme
    margin-left: $left-margin
    box-sizing: border-box
    .table-scroll
        height: calc(100vh - 105px)
        overflow-x: scroll
        margin: 30px
        background: linear-gradient(var(--color1) 30%, rgba(50,18,96, 0)), linear-gradient(rgba(50,18,96, 0), var(--color1) 70%) 0 100%, radial-gradient(farthest-side at 50% 0, var(--color2), rgba(0,0,0,0)), radial-gradient(farthest-side at 50% 100%, var(--color2), rgba(0,0,0,0)) 0 100%
        background-repeat: no-repeat
        background-attachment: local, local, scroll, scroll
        background-size: 100% 30px, 100% 30px, 100% 15px, 100% 15px
        animation: breathe 3s ease-in infinite
        -moz-transition: breathe 3s ease-in infinite
        -web-kit-transition: breathe 3s ease-in infinite
        @media(max-width: 800px)
            height: calc(100vh - 150px)
            margin: 140px 20px 20px
    table
        width: 100%
        margin: 0px auto
        font-size: 13px
        border-collapse: collapse
        tr
            td
                border: 1px solid rgba(240, 237, 237, 0.16)
                padding: 5px
                max-width: 100px
                overflow: hidden
                text-overflow: ellipsis
            &:nth-of-type(odd)
                background: rgba(128, 128, 128, 0.2)
        .check
            width: 13px
            height: 13px
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
        z-index: 2
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
        button
            outline: none
            cursor: pointer
            border: 1px solid
            padding: 0
            box-sizing: border-box
            border-radius: 0px
            font-size: 10px
            padding: 0 6px
            height: 36px
            color: #6CA7ED
            text-transform: uppercase
            font-weight: bold
            background: transparent
            transition: all .5s
            text-overflow: ellipsis
            overflow: hidden
            width: 100%
            margin: 0 auto
            opacity: 1
    label
        &.no, &.yes
            padding: 1px 5px
            border-radius: 4px
            font-size: 9px
            letter-spacing: .5px
        &.no
            border: 1px solid #fd959559
            color: #ff98989e
        &.yes
            border: 1px solid #6cffa07d
            color: #5ecc8a
hidden-fields = <[ expected_rpc_address local_address remote_address key ]>
#"key":"137d8e729f07865478d83ff2b25270cf113c99160aef0073077ab8567c3209903e6f38c9aa7baf0ae944f71b8c601ba6954b3f42558c8ed061ec301e80b8d696",
#"name":"Velas #21",
#"highest_block":525493,
#"rpc_allowed":false,
#"expected_rpc_address":"205.220.231.25:30575",
#"remote_address":"205.220.231.25:52334",
#"local_address":"192.168.1.8:30304",
#"p2p_allowed":false,
#"last_status":"closed",
#"last_status_at"
last_status_at = (store, web3t, peer, cell)-> 
    time = moment.utc(peer[cell]).from-now!
    td.pug #{time}  
rpc_allowed = (store, web3t, peer, cell)->
    if peer[cell] is yes
        td.pug
            label.yes.pug YES
    else
        td.pug
            label.no.pug NO
            br.pug
            | expected #{peer.expected_rpc_address}
p2p_allowed = (store, web3t, peer, cell)->
    if peer[cell] is yes
        td.pug
            label.yes.pug YES
    else
        td.pug
            label.no.pug NO
            br.pug
            | expected #{peer.remote_address}
name = (store, web3t, peer, cell)->
    td.pug(title="#{peer.key}") #{peer[cell]} 
cells = { rpc_allowed, p2p_allowed, last_status_at, name }
build-cell-default = (store, web3t, peer, cell)->
    td.pug #{peer[cell]}
build-cell = (store, web3t, peer)-> (cell)->
    template = cells[cell] ? build-cell-default
    template store, web3t, peer, cell
build-header-cell = (store, web3t, peer)-> (cell)->
    td.pug #{cell}
build-row = (store, web3t, headers)-> (peer)->
    tr.pug
        headers
            |> filter -> it not in hidden-fields
            |> map build-cell store, web3t, peer
build-header = (store, web3t)-> (peer)->
    style = get-primary-info store
    stats=
        background: style.app.stats
    tr.pug(style=stats)
        peer 
            |> keys 
            |> filter -> it not in hidden-fields 
            |> map build-header-cell store, web3t, peer
header = (store, web3t)->
    info = get-primary-info store
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.background
    go-back = ->
        navigate store, web3t, \wallets
    show-class =
        if store.current.open-menu then \hide else \ ""
    .pug.title(style=border-style)
        .pug.header(class="#{show-class}") Monitoring
        .pug.close(on-click=go-back)
            img.icon-svg.pug(src="#{icons.arrow-left}")
        burger store, web3t
        epoch store, web3t
        switch-account store, web3t
module.exports = ({ store, web3t })->
    headers = 
        store.peerinfo.peers 
            |> head
            |> keys
    .pug.monitor
        header store, web3t
        .table-scroll.pug
            table.pug 
                store.peerinfo.peers |> head |> build-header store, web3t
                store.peerinfo.peers |> sort-by (.highest_block) |> reverse |> map build-row store, web3t, headers
module.exports.init = ({ store, web3t}, cb)->
    err, data <- get "https://monitor.velas.com/peer/all/stats" .end
    return cb err if err?
    store.peerinfo.peers = data.body.peers
    cb null