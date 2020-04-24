require! {
    \react-chartjs-2 : { Bar }
    \react
    \prelude-ls : { map }
    \../../web3t/addresses.js : { ethToVlx }
}
get-color = (items)-> (item)->
    index = items.index-of item
    3872625 + index * 2
build-dataset = (items)->
    data: items |> map (-> +it.reward)
    backgroundColor: items |> map get-color items
build-data = (items)->
    datasets: items |> map build-dataset 
    labels: items |> map (.epoch)
legend =
    display: false
module.exports = (store, web3t)->
    return null if store.staking.reward-info.length is 0
    data = build-data store.staking.reward-info
    Bar.pug(data=data width=100 height=100 legend=legend)