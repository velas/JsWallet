require! {
    \react
    \../menu-funcs.ls 
    \./naming.ls
    \../get-primary-info.ls
    \../get-lang.ls
    \./icon.ls
    \../navigate.ls
    \../../web3t/providers/superagent.ls : { get }
    \prelude-ls : { find }
    \react-copy-to-clipboard : { CopyToClipboard }
    \../copied-inform.ls
    \../copy.ls
    \../math.ls : { minus }
    \../send-funcs.ls
    \../icons.ls
}
.manage-account
    @import scheme
    @keyframes bounceIn
        from
            opacity: 0
            transform: scale3d(0.8, 0.8, 0.8)
        to
            opacity: 1
            transform: scale3d(1, 1, 1)
    position: fixed
    width: 100%
    top: 0
    z-index: 999
    height: 100%
    min-height: 100vh
    padding-top: 5%
    box-sizing: border-box
    padding: 10px
    background: rgba(black, 0.8)
    >.account-body
        max-width: 600px
        display: inline-block
        overflow: hidden
        animation-duration: 0.5s
        animation-name: bounceIn
        background: white
        width: 100%
        margin-top: 5vh
        margin-bottom: 25vh
        padding-bottom: 50px
        border-radius: $border
        position: relative
        max-height: 70vh
        box-sizing: border-box
        >.title
            position: absolute
            z-index: 999
            box-sizing: border-box
            top: 0
            width: 100%
            color: gray
            font-size: 22px
            padding: 10px
            height: 60px
            background: black
            >.header
                margin: 5px
            >.close
                position: absolute
                font-size: 20px
                right: 20px
                top: 13px
                cursor: pointer
                &:hover
                    color: #CCC
        >.settings
            padding-top: 60px
            overflow-y: auto
            height: calc(65vh - 30px)
            .title
                color: $primary
                text-transform: uppercase
                font-size: 14px
                a
                    color: #ee8791
            .box
                input
                    width: 104px
            input
                border-radius: $border
                line-height: 36px
                text-align: center
                font-size: 13px
            textarea
                border-radius: $border
                height: 200px
                width: 400px
            input, textarea
                outline: none
                margin-bottom: 3px
                border: 0px
                padding: 3px 10px
                box-sizing: border-box
                position: relative
            button
                background-color: $primary
                border: 1px solid $primary
                border-radius: $border
                color: white
                height: 36px
                width: 104px
                margin-top: 20px
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
            textarea
                width: 250px
                height: 72px
                resize: none
                font-size: 15px
            .switch-account
                color: #8e8e93
                font-size: 12px
                margin-top: 5px
                .bold
                    font-weight: bold
                .button
                    background: #8e8e93
                    width: 12px
                    height: 16px
                    display: inline-block
                    color: white
                    padding: 9px
                    border-radius: $border
                    cursor: pointer
                    vertical-align: top
                    &:hover
                        background: gray
                    &.left
                        border-radius: $border 0 0 $border
                    &.right
                        border-radius: 0 $border $border 0
                .mb-12
                    margin-bottom: 12px
        .bold
            color: #f0c16b
        .section
            border-bottom: 1px solid rgba(240, 237, 237, 0.16)
            padding: 20px 5% !important
            @media(max-width: 400px)
                padding: 10px 3% !important
            &.last
                border-bottom: 0
            &:first-child
                background: $logo-opacity
                background-repeat: no-repeat
                background-position: left 10px
            padding: 50px 10%
            .address
                text-overflow: ellipsis
                overflow: hidden
                display: block
                position: relative
                img
                    top: 3px
                    right: 0px
                    width: 15px
                    position: absolute
                    @media(max-width: 400px)
                        right: 0
            .title
                padding: 2px
            .description
                font-size: 16px
                color: #b0aeae
                .step
                    color: #fff
                    font-weight: 600
                    border: 1px solid orange
                    border-radius: 50px
                    padding: 3px 10px
                    margin-right: 10px
                    box-shadow: 0 0 0 rgba(204,169,44, 0.4)
                    animation: pulse 2s infinite
                    @media(max-width: 600px)
                        margin: 10px auto
                        width: 10px
            .migrate-img
                margin-bottom: 5px
                img
                    margin: 1px auto 0
                    width: 40px
            .cap
                text-transform: capitalize
            .low
                text-transform: lowercase
            .link
                color: #6f6fe2
                text-decoration: underline
                cursor: pointer
                font-size: 16px
                @media(max-width: 600px)
                    text-overflow: ellipsis
                    white-space: nowrap
                    overflow: hidden
                    max-width: 250px
                    width: 100%
                    display: block
                    margin: 0 auto
            .pb-0
                padding-bottom: 0
            .terms-migrate
                button
                    img
                    &.icon-svg
                        position: relative
                        height: 12px
                        top: 2px
                        padding: 0px 5px 0 0px
                .terms-body
                    >.header
                        font-size: 19px
                        padding: 10px
                    display: inline-block
                    min-width: 250px
                    textarea
                        padding: 10px
                        overflow: auto
                        width: 100%
                        box-sizing: border-box
                        height: 220px
                        width: 350px
                        border: 0
                        border-radius: $border
                        outline: none
                        @media(min-width: 560px)
                            width: 480px
                        @media(max-width: 400px)
                            width: 100%
                    form
                        text-align: left
                        display: flex
                        span
                            padding-left: 10px
                            font-size: 13px
                            &.orange
                                color: orange
                        ol
                            margin: 0
                            padding: 0
                            li
                                margin-left: 15px
                        @media(min-width: 560px)
                            width: 480px
                        @media(max-width: 400px)
                            width: 100%
                &.hide
                    display: none
                input[type=checkbox]
                    + label
                        display: block
                        cursor: pointer
                        text-align: left
                        padding-left: 25px
                        position: relative
                        span
                            font-size: 13px
                            &.orange
                                color: orange
                        &:before
                            content: "\2714"
                            border: 0.1em solid #ecf1fa
                            border-radius: 0
                            display: inline-block
                            width: 10px
                            font-size: 10px
                            height: 10px
                            padding-left: 0.2em
                            padding-bottom: 0.3em
                            margin-right: 0.2em
                            margin-top: 4px
                            vertical-align: bottom
                            color: transparent
                            transition: .2s
                            position: absolute
                            left: 0
                        &:active:before
                            transform: scale(0)
                    &:checked + label:before
                        background-color: #3cd5af
                        border-color: #3cd5af
                        color: #fff
            .content-migrate
                display: none
                img
                    width: 180px
                    margin: 20px auto
                    &.icon
                        height: 12px
                        width: auto
                        padding: 0px 5px 0 0px
                        margin: 0
                        vertical-align: bottom
                    .content
                .support
                    margin-top: 80px
                    a
                        color: #6f6fe2
                span
                    @media(max-width: 600px)
                        display: block
                        width: 100%
                &.visible
                    margin-top: 30px
                    margin-bottom: 60px
                    display: block
                    @media(max-width: 600px)
                        margin-top: 20px
        .change-index
            width: 80px
            padding: 1px
            border-radius: 0 !important
            text-align: center
    .iron
        -webkit-mask-image: linear-gradient(75deg, rgba(0, 0, 0, 0.6) 30%, #000 50%, rgba(0, 0, 0, 0.6) 70%)
        -webkit-mask-size: 50%
        animation: shine 2s infinite
    @keyframes shine
        0%
            -webkit-mask-position: right
        100%
            -webkit-mask-position: left
    @-webkit-keyframes pulse
        0%
            -webkit-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
        70%
            -webkit-box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
        100%
            -webkit-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
    @keyframes pulse
        0%
            -moz-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
            box-shadow: 0 0 0 0 rgba(204, 169, 44, 0.4)
        70%
            -moz-box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
            box-shadow: 0 0 0 10px rgba(204, 169, 44, 0)
        100%
            -moz-box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
            box-shadow: 0 0 0 0 rgba(204, 169, 44, 0)
token-migration = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    btn-icon =
        filter: style.app.btn-icon
    input-style =
        background: style.app.wallet
        color: style.app.text
    color =
        color: style.app.text
    style-textarea=
        background: style.app.wallet
        color: style.app.text
    logo-style =
        filter: style.app.filterLogo
    button-primary2-style=
        border: "1px solid #{style.app.primary2}"
        color: style.app.text
        background: style.app.primary2
    button-primary3-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text2
        background: style.app.primary3
    button-primary4-style=
        border: "1px solid #{style.app.border}"
        color: style.app.text
        background: 'rgb(195, 92, 95)'
    filter-icon=
        filter: style.app.filterIcon
    goto-terms = ->
        navigate store, web3t, \terms2
    visible-migrate = ->
        #err <- load-terms
        store.current.content-migrate = not store.current.content-migrate
    visible-migrate-accept = ->
        #err <- load-terms
        store.current.accept-migrate = not store.current.accept-migrate
    visible-class =
        if store.current.content-migrate then \visible else \hide
    hide-class =
        if store.current.content-migrate then \hide else \ ""
    hide =
        if store.current.accept-migrate then \hide else \ ""
    visible =
        if store.current.accept-migrate then \visible else \ ""
    try-migrate = (trials, amount, cb)->
        return cb "You coins can't be transferred by automatic script please contact support in https://t.me/velasmigration for additional verification." if trials <= 0
        address = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx2) 
                |> (.address)
        err <- get "https://mainnet-v2.velas.com/migration/try-migrate/#{address}" .end
        <- set-timeout _, 5000
        <- web3t.refresh
        amount2 = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx2) 
                |> (.balance)
        return cb null if amount isnt amount2
        trials-next = trials - 1
        return try-migrate trials-next, amount, cb if err?
        cb null
    swap = ->
        #return if store.current.token-migration is 'Loading...'
        amount = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx) 
                |> (.balance)
        amount2 = 
            | store.url-params.internal? => 1 
            | _ => amount `minus` 0.01
        #amount2 = 1
        to = store.current.token-migration
        store.current.token-migration = null
        err <- web3t.vlx.send-transaction { to, amount: amount2 }
        return alert "#{err}" if err?
        amount2 = 
            store.current.account.wallets 
                |> find (-> it.coin.token is \vlx2) 
                |> (.balance)
        #err <- try-migrate 10, amount2
        return alert "#{err}" if err?
        cb null
    { close-migration } = menu-funcs store, web3t
    .pug
        .pug.section.last
            .pug.description(style=color)
                .pug.terms-migrate(class="#{hide-class}")
                    .pug.migrate-img
                        img.iron.pug(src="#{style.branding.logo}" style=logo-style)
                    .pug.terms-body
                        .pug.header Terms of Swap
                        textarea.pug(value="#{store.terms2}" style=style-textarea)
                        form.pug
                            input.pug(type='checkbox')
                            span.pug I accept and agree to the Terms & Conditions relating to the Velas Token Swap.
                    .pug.content
                        button.pug(on-click=visible-migrate style=button-primary3-style)
                            span.pug
                                img.icon-svg.pug(src="#{icons.accept}" style=btn-icon)
                                | Accept
                        button.pug(on-click=close-migration style=button-primary4-style)
                            span.pug
                                img.icon-svg.pug(src="#{icons.deny}")
                                | Deny
                .pug.terms-migrate(class="#{visible-class + ' ' + hide}")
                    .pug.migrate-img
                        img.iron.pug(src="#{style.branding.logo}" style=logo-style)
                    .pug.terms-body
                        .pug.header Confirm to continue
                        form.pug
                            input.pug(type='checkbox')
                            span.pug
                                span.pug.orange I am not:
                                ol.pug(type='I')
                                    li.pug a citizen or resident of, or domiciled in;
                                    li.pug participating in the token swap from a location in;
                                    li.pug representing or acting on behalf of a person residing or located in,
                                    li.pug representing or acting on behalf of an entity (including, but not limited to, any company or partnership) incorporated, established or registered in or under the laws of: the United States of America (USA) and its territories (American Samoa, Guam, the Northern Mariana Islands, Puerto Rico, and the U.S. Virgin Islands), Peoples Republic of China (except for Hong Kong and Macao), Cuba, Democratic Republic of Congo, Iran, Iraq, Malaysia, North Korea, Sudan, Syria, Zimbabwe.
                    .pug.content
                        button.pug(on-click=visible-migrate-accept style=button-primary3-style)
                            span.pug
                                img.icon-svg.pug(src="#{icons.accept}" style=btn-icon)
                                | Accept
                        button.pug(on-click=close-migration style=button-primary4-style)
                            span.pug
                                img.icon-svg.pug(src="#{icons.deny}")
                                | Deny
                .pug.content-migrate(class="#{visible}")
                    img.pug(src="#{icons.migrate-img}")
                    .pug Swap all your coins automatically.
                    .pug.content
                        button.pug(on-click=swap style=button-primary2-style)
                            span.pug
                                img.icon.pug(src="#{icons.swap}")
                                | Swap Coins
                    .pug.support
                        | Support: 
                        a.pug(href="https://t.me/velasmigration" target="_blank") t.me/velasmigration
module.exports = ({ store, web3t } )->
    return null if not store.current.token-migration?
    { close-migration } = menu-funcs store, web3t
    style = get-primary-info store
    account-body-style = 
        background: style.app.background
        color: style.app.text
    border-style =
        background: style.app.header
        color: style.app.text
    lang = get-lang store
    .pug.manage-account
        .account-body.pug(style=account-body-style)
            .pug.title(style=border-style)
                .pug.header Token Migration
                .pug.close(on-click=close-migration)
                    icon \X, 20
            .pug.settings
                token-migration store, web3t