require! {
    \react
    \nivo : { ResponsivePie, linearGradientDef }
    \prelude-ls : { map, sort-by, each }
    \../../web3t/addresses.js : { ethToVlx }
    \../get-primary-info.ls
}
.stats-holder
    @import scheme
    color: #1a0e41
get-stake = (it)->
    | it.stakers is '..' => 0
    | _ => +it.stakers
get-color = (store, items)-> (it)->
    style = get-primary-info store 
    res  =
        | it.type is \IN => style.app.primary2
        | it.type is \OUT => style.app.primary1
        | _ => style.app.wallet
get-from-or-to = ->
    | it.type is \IN => "FROM #{it.from}"
    | it.type is \OUT => "TO #{it.to}"
    | _ => "NOTHING"
build-data = (store, items)-->
    return [{"id": "1", "label": "0", "value": 1, type: "NONE"}] if items.length is 0
    in_ = 0
    out_ = 0
    items |> each (it)->
        amount = if it.from isnt it.to then +it.amount else -+it.fee
        in_ += amount if it.type is \IN
        out_ += amount if it.type is \OUT
    [
        {"id": "1", "label": "Received", "value": +in_, type: "IN"}
        {"id": "2", "label": "Sent", "value": +out_, type: "OUT"}
    ]
module.exports = (store, web3t)->
    items =
        | store.transactions.applied.length > 0 => store.transactions.applied |> sort-by (.type)
        | _ => []
    data = build-data store, items
    borderWidth = 0
    cornerRadius = 5
    padAngle = 3.5
    innerRadius = 0.9
    isInteractive = store.transactions.applied.length > 0
    defs =
        [
            (linearGradientDef 'gradientOUT', [{
                offset: 0
                color: '#F7618B'
            }, {
                offset: 100
                color: '#bf5fa0'
                opacity: 100
            }]),
            (linearGradientDef 'gradientIN', [{
                offset: 0
                color: '#8374b7'
            },
            {
                offset: 50
                color: '#399fe8'
            },
            {
                offset: 100
                color: '#8374b7'
                opacity: 0.7
            }]),
            linearGradientDef 'gradientNONE', [{
                offset: 0
                color: '#8374b7'
                opacity: 0.15
            },
            {
                offset: 100
                color: '#8374b7'
                opacity: 0.15
            }]
        ]
    fill = [
        {
            match: (d) -> d.type is 'IN'
            id: 'gradientIN'
        }
        {
            match: (d) -> d.type is 'OUT'
            id: 'gradientOUT'
        }
        {
            match: (d) -> d.type is 'NONE'
            id: 'gradientNONE'
        }
    ]
    .stats-holder.pug
        ResponsivePie.pug(data=data defs=defs fill=fill isInteractive=isInteractive   borderWidth=borderWidth fit=yes  enableSlicesLabels=no enableRadialLabels=no cornerRadius=cornerRadius padAngle=padAngle innerRadius=innerRadius)