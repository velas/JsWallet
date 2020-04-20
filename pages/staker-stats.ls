require! {
    \react-chartjs-2 : { Polar }
    \react
    \prelude-ls : { map }
    \../../web3t/addresses.js : { ethToVlx }
}
get-stake = (it)->
    | it.stake is '..' => 0
    | _ => +it.stake
get-color = (items)-> (it)->
    index = items.index-of(it)
    base = 
        | it.status is \active => 3986863 + ( index * 2 )
        | it.status is \inactive => 3872625
        | it.status is \banned => 16730920
        | _ => 3872625
    h = base.to-string 16
    '#' + h
build-data = (items)->
    datasets: [{
        data: items |> map get-stake
        backgroundColor: items |> map get-color(items)
    }]
    labels: items |> map (.address) |> map ethToVlx
legend =
    display: false
module.exports = (store, web3t)->
    return null if store.staking.pools.length is 0
    data = build-data store.staking.pools
    Polar.pug(data=data width=100 height=100 legend=legend)