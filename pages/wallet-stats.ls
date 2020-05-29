require! {
    \react-chartjs-2 : { Doughnut }
    \react
    \prelude-ls : { map, sort-by }
    \../../web3t/addresses.js : { ethToVlx }
    \../get-primary-info.ls
}
get-stake = (it)->
    | it.stakers is '..' => 0
    | _ => +it.stakers
get-color = (store, items)-> (it)->
    style = get-primary-info store 
    res  =
        | it.type is \IN => style.app.primary2
        | it.type is \OUT => style.app.primary1
        | _ => \black
get-from-or-to = ->
    | it.type is \IN => "FROM #{it.from}"
    | it.type is \OUT => "TO #{it.to}"
build-data = (store, items)-->
    #{ token, tx, amount, fee, time, url, type, pending, from, to, recipient-type, description } = tran
    datasets: [{
        data: items |> map (.amount)
        backgroundColor: items |> map get-color(store, items)
    }]
    labels: items |> map get-from-or-to
legend =
    display: no
module.exports = (store, web3t)->
    return null if store.transactions.applied.length is 0
    items =
        store.transactions.applied |> sort-by (.type)
    data = build-data store, items
    Doughnut.pug(data=data width="300px" height="300px" legend=legend)