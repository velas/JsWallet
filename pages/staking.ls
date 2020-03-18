require! {
    \react
    \react-dom
    \superagent : { get }
    \../navigate.ls
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../history-funcs.ls
    \./icon.ls
    \prelude-ls : { map }
    \../math.ls : { div }
}
.staking
    @import scheme
    position: relative
    display: block
    width: auto
    margin-left: 60px
    top: 0
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 0px
    background: transparent
    @media(max-width:800px)
        width: 100%
        margin: 0
    .form-group
        margin-top: 4px
        text-align: left
        input
            outline: none
            width: 100%
            box-sizing: border-box
            height: 36px
            line-height: 36px
            border-radius: 0
            padding: 0px 10px
            font-size: 14px
            margin: 1px
            border: 0px
            box-shadow: none
    ul
        li 
            list-style: none
            margin-left: 0
    button
        background-color: $primary
        border: 1px solid $primary
        border-radius: $border
        color: white
        height: 36px
        width: 104px
        margin-top: 5px
        padding: 0 6px
        text-decoration: none
        text-transform: uppercase
        font-size: 10px
        font-weight: bold
        cursor: pointer
        outline: none
        display: inline-block
        text-overflow: ellipsis
        overflow: hidden
        white-space: nowrap
        &:hover
            background: transparent
            color: $primary
        &.link
            min-width: 190px
        margin-top: 12px
    >.title
        position: relative
        box-sizing: border-box
        top: 0
        width: 100%
        color: gray
        font-size: 22px
        padding: 10px
        height: 60px
        background: transparent
        >.header
            margin: 5px
            text-align: center
            @media(max-width:800px)
                text-align: center
        >.close
            position: absolute
            font-size: 20px
            left: 20px
            top: 13px
            cursor: pointer
            &:hover
                color: #CCC
show-validator = (store, web3t)-> (validator)->
    li.pug #{validator}
staking-content = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    input-style =
        background: style.app.wallet
        color: style.app.text
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    become-validator = ->
        return alert "address is required" if (store.staking.add.add-validator ? "").length is 0
        data = web3t.velas.Staking.add-pool.get-data store.staking.add.add-validator-stake, store.staking.add.add-validator
        to = web3t.velas.Staking.address
        amount = store.staking.add.add-validator-stake `div` (10^18)
        err <- web3t.eth.send-transaction { to, data, amount }
        #return cb err if err?
        return store.staking.add.result = "#{err}" if err?
        #store.staking.add.result = "success"
        <- staking.init { store, web3t }
    change-address = ->
        store.staking.add.add-validator = it.target.value
    change-stake = ->
        store.staking.add.add-validator-stake = it.target.value
    .pug.content
        .form-group.pug
            .pug
                h3.pug Become Validator
                .pug
                    .pug Your Mining Address
                    input.pug(type='text' value="#{store.staking.add.add-validator}" on-change=change-address style=input-style placeholder="mining address")
                    .pug Your Stake
                    input.pug(type='text' value="#{store.staking.add.add-validator-stake}" on-change=change-stake style=input-style placeholder="stake")
                    button.pug(style=button-primary2-style on-click=become-validator) Become Validator
            .pug
                .pug
                    h3.pug Pending Validators
                    ul.pug
                        store.staking.validators.pending |> map show-validator store, web3t
                .pug
                    h3.pug Active Validators
                    ul.pug
                        store.staking.validators.active |> map show-validator store, web3t
staking = ({ store, web3t })->
    lang = get-lang store
    { go-back } = history-funcs store, web3t
    info = get-primary-info store
    style=
        background: info.app.wallet
        color: info.app.text
    border-style =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
    border-style2 =
        color: info.app.text
        border-bottom: "1px solid #{info.app.border}"
        background: "#4b2888"
    border-right =
        color: info.app.text
        border-right: "1px solid #{info.app.border}"
    button-primary2-style=
        border: "1px solid #{info.app.primary2}"
        color: info.app.text
        background: info.app.primary2
    header-table-style=
        border-bottom: "1px solid #{info.app.border}"
        background: info.app.wallet-light
    lightText=
        color: info.app.addressText
    .pug.staking
        .pug.title(style=border-style)
            .pug.header Staking Page
            .pug.close(on-click=go-back)
                icon "ChevronLeft", 20
        staking-content store, web3t
staking.init = ({ store, web3t }, cb)->
    err, data <- web3t.velas.Staking.candidateMinStake
    return cb err if err?
    store.staking.add.add-validator-stake = data.to-fixed!
    err, data <- web3t.velas.ValidatorSet.getValidators
    return cb err if err?
    store.staking.validators.active = data
    err, data <- web3t.velas.ValidatorSet.getPendingValidators
    return cb err if err?
    store.staking.validators.pending = data
    cb null
module.exports = staking