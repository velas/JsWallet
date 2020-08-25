require! {
    \../math.ls : { div, times, plus, minus }
    \moment
}
module.exports = (store, web3t, cb)->
    err, data <- web3t.velas.Staking.areStakeAndWithdrawAllowed!
    return cb err if err?
    return cb null if data is yes
    err, next-block <- web3t.velas.Staking.stakingEpochEndBlock
    block = next-block `plus` 1
    err, current-block <- web3t.velas.web3.getBlockNumber
    seconds = (current-block `minus` block) `times` 5
    return cb err if err?
    next = moment!.add(seconds, 'seconds').from-now!
    cb "Consensus changes are paused till #{block} block. Please repeat #{next}"