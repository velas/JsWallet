require! {
    \prelude-ls : { map, split, filter, find, foldl, drop, take, sum, unique }
    \./math.ls : { div, times, plus, minus }
}
SIMULATION_COUNT = 14600
EPOCHS_PER_YEAR = 1460
VALIDATOR_COUNT = 19
as-callback = (p, cb)->
    p.catch (err) -> cb err
    p.then (data)->
        cb null, data
choose-random-pool = (pools) ->
    total-stake = 0
    for pool in pools
        total-stake += parse-float pool.stake
    point = Math.random! * total-stake
    return 0 if +total-stake is 0    
    i = 0
    counter = 0
    while counter < point
        counter += parse-float pools[i].stake
        i++
    return i - 1
simulate-choose-validators = (pools) ->
    pools-copy = [...pools]
    validators = []
    for i from 1 to VALIDATOR_COUNT
        return validators if pools-copy.length is 0    
        pool-index = choose-random-pool pools-copy
        validators.push pools-copy[pool-index]
        pools-copy.splice pool-index, 1
    return validators
simulate-validators-stats = (pools, count) ->
    pools-copy = pools.filter((item) -> item).map((item, index) -> {...item, index})
    for pool in pools-copy
        if pool.status isnt \active
            pool.stake = \0
            pool.node-stake = \0
    rewards-per-index = []
    for i from 1 to pools.length
        rewards-per-index.push {rewards: 0, validator-count: 0}
    for i from 1 to count
        validators = simulate-choose-validators pools-copy
        validators-stake = validators.reduce ((acc, curr) -> acc + parse-float curr.stake), 0
        validator-reward = 5/6147.368421052632/100 * validators-stake / VALIDATOR_COUNT
        for validator in validators
            rewards-per-index[validator.index].rewards += validator-reward
            rewards-per-index[validator.index].validator-count++
    return rewards-per-index
calc-pools-rewards = (all-pools) ->
    stat = simulate-validators-stats all-pools, SIMULATION_COUNT
    for i from 0 to all-pools.length - 1
        pool = all-pools[i]
        node-stake = parse-float pool.node-stake
        total-stake = parse-float pool.stake
        delegator-part = Math.min(0.6, (total-stake - node-stake) / total-stake)
        node-part = 1 - delegator-part
        all-pools[i].delegate-reward = delegator-part * stat[i].rewards / SIMULATION_COUNT * EPOCHS_PER_YEAR
        all-pools[i].node-reward = node-part * stat[i].rewards / SIMULATION_COUNT * EPOCHS_PER_YEAR
        all-pools[i].validator-probability = stat[i].validator-count / SIMULATION_COUNT
    return all-pools
fill-pools = ({ store, web3t, on-progress, on-finish }, [item, ...rest]) ->
    staking-address = store.staking.keystore.staking.address
    if not item? then
        store.staking.all-pools-loaded = yes
        store.staking.pools-are-loading = no
        return on-finish null, [] 
    if ([\choosestaker, \info].index-of(store.current.page)) is -1 then
        store.staking.all-pools-loaded = no
        store.staking.pools-are-loading = no
        return on-finish null, []      
    err, data <- web3t.velas.Staking.stakeAmountTotal item.address
    return on-finish err if err?
    item.stake = data
    err, delegators <- web3t.velas.Staking.poolDelegators(item.address)
    return on-finish err if err?
    item.stakers = delegators.length + 1
    err, mining-address <- web3t.velas.ValidatorSet.miningByStakingAddress(item.address)
    return on-finish err if err?
    item.mining-address = mining-address
    err, validator-reward-percent <- web3t.velas.BlockReward.validatorRewardPercent item.address
    return on-finish err if err?
    item.validator-reward-percent = validator-reward-percent `div` 10000
    err, is-validator-banned <- web3t.velas.ValidatorSet.isValidatorBanned(mining-address)
    return on-finish err if err?
    err, amount <- web3t.velas.Staking.stakeAmount item.address, staking-address
    return on-finish err if err?
    err, node-stake <- web3t.velas.Staking.stakeAmount item.address, item.address
    return on-finish err if err?
    err, withdraw-amount <- web3t.velas.Staking.orderedWithdrawAmount item.address, staking-address
    return on-finish err if err?
    item.withdraw-amount = withdraw-amount
    item.my-stake = amount
    item.status = \banned if is-validator-banned
    item.node-stake = node-stake
    on-progress [item, ...rest] if on-progress?
    on-finish-local = (err, pools) ->
        on-finish err, [item, ...pools]
    on-progress-local = (pools) ->
        on-progress [item, ...pools]
    fill-pools { store, web3t, on-progress: on-progress-local, on-finish: on-finish-local }, rest
query-pools-web3t = (store, web3t, on-progress, on-finish) ->
    err, pools-inactive <- web3t.velas.Staking.getPoolsInactive
    return cb err if err?
    err, pools <- web3t.velas.Staking.getPools
    return cb err if err?
    all-pools = pools ++ pools-inactive
    all-pools =
        all-pools
            |> unique
            |> map -> {
                address: it,
                status: | (pools.index-of it) isnt -1 => \active
                    | otherwise => \inactive
            }
    store.staking.pools-are-loading = yes
    fill-pools { store, web3t, on-progress, on-finish }, all-pools
query-pools = (store, web3t, on-progress, on-finish) ->
    #p = fetch ""
    #err, text <- as-callback p
    err, pools <- query-pools-web3t store, web3t, on-progress
    return on-finish err if err?
    #err = null
    #text = """
    #    {"epoch":1175,"pools":[{"address":"0xbFFe028201B9606d17aF410870Ea9e6E6890BbD4","stake":"1000000000000000000000000","status":"","delegators":56},{"address":"0x8ffb33cc8981a7dfF5f13957C4E7BC655F80F59f","stake":"13396152727633147678464000","status":"","delegators":37},{"address":"0xeb057d96E2532257E47dBD8D3090c8BE5030Db77","stake":"1000000000000000000000000","status":"","delegators":28},{"address":"0xe9D7A01Ae044Ae19C1478F9A07729012c8FF8c98","stake":"16194736552392729320935172","status":"","delegators":22},{"address":"0xE7a2fA71D86B5088199a18d3bB90089031f1F708","stake":"14204771836618447678464000","status":"","delegators":9},{"address":"0x7BCEc192F4147867C100ff7e5CD16c6079D6Febc","stake":"26608651020988624756617216","status":"","delegators":19},{"address":"0x5113980d79E81624A316F28b9C19830716b8fced","stake":"1027073199560000000000000","status":"","delegators":3},{"address":"0x49B7474DE2fBD9ef1A979C8f8F7388B392A9C4E2","stake":"2004214926941769175633452","status":"","delegators":3},{"address":"0x8cC8AbD75893de4AdE49048Db58FE35Dca08b6B1","stake":"8200008943999647678464000","status":"","delegators":5},{"address":"0x5Ff4cAFE27F03f6b6FabB2a4b098B808E985cFC5","stake":"11694434187091547678464000","status":"","delegators":6},{"address":"0xD8f8E97B38Ea50d2506BD0f53159b44b224f4c0E","stake":"20739323609999647678464000","status":"","delegators":13},{"address":"0x3E04c4067e2857d0F3da8BE6F753b85AeA07e869","stake":"1001188103226689867335770","status":"","delegators":8},{"address":"0x794e270e9dB767CEB456aC6d2A16CC395C3fa9e8","stake":"10000011935999647678464000","status":"","delegators":5},{"address":"0x1dfF8248ADCac86F65d024355Df54233E6b57c16","stake":"22260191269607842788557233","status":"","delegators":6},{"address":"0x5C0BeAE57f2F35E26EecC1A96C22EF1161adcBa5","stake":"1876934928616045936021275","status":"","delegators":26},{"address":"0xC2C7C37601e23cD71E9dc498dF493Aa2FA137dFa","stake":"8000009042999647678464000","status":"","delegators":4},{"address":"0x896278e5F9C405AA79987e7430122cA54Dd672d9","stake":"3534148920000000000000000","status":"","delegators":5},{"address":"0x3f86A664EC5CD3656170E8fD1a1da4C69D1dBe1D","stake":"10205391820328747678464000","status":"","delegators":8},{"address":"0xAd424016A762aC912799409354b92d2c4BF9b951","stake":"10918419869110947678464000","status":"","delegators":4},{"address":"0x2De705146C709F3D7FcaF6561328f5620e4B6203","stake":"5017000000000000000000000","status":"","delegators":5},{"address":"0x5f8a88185928Ca774374bdB44d53cF133066D07a","stake":"12828895946368247678464000","status":"","delegators":4},{"address":"0x604EB91f209bc281CD90f0483086b84CEC555DaB","stake":"10407678935128626892759621","status":"","delegators":3},{"address":"0xfb1493Fea00CBDB5A49b3f013200b93c8A65D3f9","stake":"18365261766138847678464000","status":"","delegators":3},{"address":"0x33B5160D9e5242D52FB3D7360822933688E09187","stake":"15308191929724398158815704","status":"","delegators":1},{"address":"0x6eea9F00951a28F17f1fA31B8E939f20Dd72e372","stake":"7000008897999647678464000","status":"","delegators":10},{"address":"0x63054e727A48B6E0aEf19ce11eED8993EBD8d1f9","stake":"21026897273596147678464000","status":"","delegators":6},{"address":"0x082671eC20E6EC951bF85780082D2902bf3b13D9","stake":"14965353556358647678464000","status":"","delegators":1},{"address":"0x90161d93791EcDA22AF1f6a1d9604904B78D5D84","stake":"4500000000000000000000000","status":"","delegators":1},{"address":"0xFF115f47a4AAe58a7545b912E20dF439E12a49b2","stake":"8500009455999647678464000","status":"","delegators":1},{"address":"0x865bbd16A0D19f6D3a6099Ff337E8427dcFc28FE","stake":"10414918635115847678464000","status":"","delegators":3},{"address":"0x9202b0988C3abDe45faC10E9064F5CBc66B18fE8","stake":"16417909544525825786557882","status":"","delegators":2},{"address":"0x067850E722c6304a826C2d125bbA684E4E95d5Bf","stake":"4000000000000000000000000","status":"","delegators":2},{"address":"0x3Fa89C279975e8b895E4A1f81Fed518950285412","stake":"9000008954999647678464000","status":"","delegators":1},{"address":"0xe4462dFC463e6fc55cFbeA5030d653BB3b9b7e53","stake":"2057474687007272386713609","status":"","delegators":2},{"address":"0xcC2e344Cc9c15105BB7D2aD770Ba1E98cF9Dd2d0","stake":"8000008946999647678464000","status":"","delegators":1},{"address":"0x91322d7F48dd4dBAbfE1a3D47E1769DEea2fc257","stake":"6499000000000000000000000","status":"","delegators":5},{"address":"0x55c40927471870B9A23C81a8E7b218d2b0EB9700","stake":"7500008990999647678464000","status":"","delegators":1},{"address":"0x6f50049A4a812E7df1e57C7D6cE91b05Aca0320f","stake":"9000009003999647678464000","status":"","delegators":5},{"address":"0x44f015be4610db63cF9aEfe89743aeec9A8E227F","stake":"10402698017964847678464000","status":"","delegators":5},{"address":"0xD1A787091817Dc0BC9cA415FF63690C9B1c521e9","stake":"10000009083999647678464000","status":"","delegators":3},{"address":"0x239bd098B3D582584A494B6366d657e7012Ae804","stake":"5033000000000000000000000","status":"","delegators":2},{"address":"0x47a8eAFb2b7C7De35527de065eF3edb09fC62461","stake":"10363721903846717456754294","status":"","delegators":11},{"address":"0x969feE84a819f1E68c8991Df83c2E87701384aDF","stake":"18564691314522447678464000","status":"","delegators":3},{"address":"0xdFC4ed96f529ae8eC7687C338fa2caFD1f7e86ce","stake":"23185500350169547678464000","status":"","delegators":6},{"address":"0x0b6a35faFB76E0786Db539633652A8553Ac28D67","stake":"2077201113142937281378837","status":"","delegators":2},{"address":"0xbDEC24D3bc3D1Fe26dD542633ce9b3076C7d60dC","stake":"5000010000000000000000000","status":"","delegators":1},{"address":"0x03b56Ead8B0BC9eea72d075AddACf9015C554B6d","stake":"15427412881921963226030047","status":"","delegators":10},{"address":"0x7f7697E82be5d7F41De6b283Ca562e4D79a4F74a","stake":"50276834152658820843819038","status":"","delegators":16}]}"""
    #pools = (JSON.parse text).pools
    calc-pools-rewards pools
    on-finish err, pools
#calc-pool-delegate-roi = (store, web3t, pools, pool, stake, cb) ->
#    pool-index = pools.index-of pool
#    cb "Pool not found in list of pools" if pool-index is -1
#    pools-copy = pools.map (pool) -> {...pool}
#    calc-pools-rewards pools-copy, pool, stake
#    cb pools-copy[pool-index].delegate-roi
module.exports = { query-pools }