require! {
    \react
}
.description
    @keyframes fadeIn
        0%
            opacity: 0
            right: -100vw
        20%
            opacity: 1
            right: 0
        100%
            color: black
            opacity: 1
            right: 0
    animation: fadeIn 1s 3s ease-in-out forwards
    color: white
    right: -100vw
    position: absolute
    top: 0
    width: 600px
    height: 100vh
    background: rgba(white, 0.94)
    @media screen and (max-width: 600px)
        width: 100%
        z-index: 10
        padding: 20px;
        box-sizing: border-box
    .line
        .white
            background: white
        .mark
            font-weight: bold
            color: #248295
        margin-bottom: 10px
        a
            display: inline-block
            cursor: pointer
            &.got-it
                padding: 10px 20px
                color: #CCC
            &.big
                background: #248295
                color: white
                text-decoration: none
                padding: 10px 20px
                border-radius: 25px
                margin-top: 10px
                text-transform: uppercase
                &:hover
                    background: #248295 - 20
    .who
        color: #CCC
        font-size: 12px
        padding-right: 11px
        text-align: right
        a  
            color: gray
    .for-free
        border: 1px solid #80a4ad
        padding: 3px
        border-radius: 5px
        color: #80a4ad
        transform: rotate(-9deg)
        display: inline-block
    pre
        background: #0c1230
        color: white
        padding: 10px
        font-size: 12px
        border-radius: 5px 0 0 5px
        @media screen and (max-width: 600px)
            border-radius: 0
        .part
            display: inline-block
            vertical-align: top
            padding: 0
            margin: 0
            white-space: nowrap
        .mark
            color: orange
module.exports = (store)->
    return null if store.current.demo is no
    return null
    close-demo = ->
        store.current.demo = no
    .pug.description(key="description")
        h1.pug Ethnamed Smart-Wallet
        .line.pug
            span.pug This is a demo of the wallet connected to the 
            a.pug(href="https://github.com/ethnamed/protocol") Ethnamed protocol
        .line.pug Try to use this seed to see the testnet balance
        pre.pug xmr bch btg ltc eth eos xem ada dash btc zec bcn
        pre.pug PIN: 1234
        .line.pug 
            span.pug You can try to register 
            span.pug.mark nickname@gmail.com
            span.pug or
            span.pug.mark nickname.ethnamed.io
            span.pug  You can try to send eth to another address. If address not found your still can send ETH to Ethnamed Smart-Contract. When user confirms his address he will get funds automatically.
        .line.pug
            span.pug It is still under construction - will be used as chrome plug-in (line Metamask) and mobile app. 
            span.pug Also it extends web3 protocol for btc, ltc, zec, dash networks available on the website
        .line.pug
            span.pug Example of the api (devtools):
        .line.pug
            pre.pug
                span.pug.part web3t.use(`
                span.pug.part.mark mainnet
                span.pug.part `); 
                span.pug or 
                span.pug.part web3t.use(`
                span.pug.part.mark testnet
                span.pug.part `);
        for item in <[ eth btc xem ]>
            pre.pug(key="#{item}")
                span.pug.part web3t.
                span.pug.part.mark #{item}
                span.pug.part .sendTransaction({ to, amount }, cb)
        .line.pug This is a new business oppurtunity for crypto entrepreneurs (no ICO, but tokenization of available functionality)
        .line.pug 
            span.pug More information you can read in our 
            a.pug(href="https://docs.google.com/document/d/16W9E3lLrlkhbjklWLAEmPjF8Ovl8gBUmT8MsOZM0WjA/edit?usp=sharing") Whitepaper
        .line.pug
            span.pug All community member will get names 
            span.pug.for-free FOR FREE
        .line.pug.white
            a.big.pug(href="https://t.me/ethnamed") Join our community
            a.got-it.pug(on-click=close-demo) Close this
        .line.pug.who 
            span.pug Made with love. 
            a.pug(href="ethnamed.io") Ethnamed 
            span.pug team