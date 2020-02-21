require! {
    \prelude-ls : { map, pairs-to-obj }
    \./seed.ls : { saved }
    \./browser/location.ls
    \./langs/en.ls
    \./langs/ru.ls
    \./langs/ua.ls
    \./langs/kr.ls
    \./langs/cn.ls
    \./get-device.ls
}
saved-seed = saved!
create-send =->
    id: ""
    to: ""
    propose-escrow: no
    address: ''
    value: \0
    fee-type: \auto
    tx-type: \regular
    amount-send: \0
    amount-charged: \0
    amount-charged-usd: \0
    amount-send-usd: \0
    amount-send-eur: \0
    amount-send-fee: \0
    amount-send-fee-usd: \0
    amount-obtain: \0
    data: ""
    decoded-data: ""
    show-data-mode: \encoded
    error: ''
store =
    root: null
    theme: \velas
    lang: \en
    langs: { en, ru, ua, kr, cn }
    registry: []
    terms: "Loading..."
    preference:
        settings-visible: yes
        invoice-visible: yes
        username-visible: no
        refresh-visible: yes
        lock-visible: yes
    receive: 
        wallet: null
    menu:
        active: 's2'
    ask: 
        text: ''
        enabled: no
        callback: null
        image: ""
        type: ''
    contract-address: ''
    transactions: 
        all: []
        applied: []
    current:
        verify-seed: ""
        verify-seed-error: no
        device: get-device!
        list: 0
        prompt-answer: ""
        prompt: no
        send-menu-open: no
        langs-open: no
        langs-open-start: no
        add-coin: no
        wallet-index: 0
        account-index: 1
        manage-account: no
        filter-plugins: ""
        confirmation: null
        alert: null
        demo: location.href.index-of('web3.space/wallet') > -1 
        network: \mainnet
        pin: ""
        last-tx-url: ""
        try-edit-seed: no
        pin-trial: 0
        refreshing: no
        copied: ""
        page: \locked
        send-to-mask: ""
        status: \main
        nickname: ""
        nicknamefull: \nickname@domain.com
        message: ""
        custom-domain: no
        can-buy: no
        checking-name: no
        seed: ""
        seed-temp: ""
        saved-seed: saved-seed
        balance-usd: \...
        filter: <[ IN OUT ]>
        loading: no
        send : create-send!
        invoice : create-send!
    history:
        filter-open: no
    rates: {}
    coins: []
    version: "v0.2"
module.exports = store