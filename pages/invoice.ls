require! {
    \react
    \../invoice-funcs.ls
    \prelude-ls : { map }
    \./receive.ls
    \react-google-recaptcha : { default: ReCAPTCHA }
    \../get-primary-info.ls
    \../get-lang.ls
}
.content
    position: relative
    @import scheme
    $border-radius: 5px
    $label-padding: 3px
    $label-font: 13px
    .pending
        color: orange
    >*
        display: inline-block
        text-align: center
        width: 94%
        box-sizing: border-box
        border-radius: $border-radius
        left: 11px
    >.content-body
        top: 15px
        padding: 12px 12px 0px 12px
        height: 330px
        @import scheme
        color: gray
        a
            color: gray
        >form
            >table
                background: #e6f0ff
                border-radius: 10px
                width: 100%
                border-spacing: 0
                tr
                    &.gray
                        color: #CCC
                    &.orange
                        color: #cf952c
                    &.green
                        color: #23b723
                    td
                        padding: 3px 10px
                        font-size: 14px
                        &:last-child
                            text-align: right
            max-width: 400px
            text-align: left
            >.form-group
                .grecaptcha-badge
                    z-index: 1
                >.control-label
                    padding-top: 5px
                    padding-left: $label-padding
                    font-size: $label-font
                margin-top: 4px
                .address
                    padding: 0px 10px
                    overflow: hidden
                    text-overflow: ellipsis
                    border-radius: $border-radius
                    font-size: 14px
                    height: 36px
                    line-height: 36px
                    overflow: hidden
                    text-overflow: ellipsis
                    color: #677897
                input
                    outline: none
                    width: 100%
                    box-sizing: border-box
                    height: 36px
                    line-height: 36px
                    border-radius: $border-radius
                    padding: 0px 10px
                    font-size: 14px
                    margin: 1px
                    border: 1px solid #5E72E4
                    box-shadow: none
                .amount-field
                    >.input-wrapper
                        position: relative
                        width: 50%
                        display: inline-block
                        box-sizing: border-box
                        margin: 0
                        >.label
                            position: absolute
                            top: 8px
                            display: inline
                            &.lusd
                                left: 5px
                            &.crypto
                                right: 5px
                        input
                            width: 100%
                            &.amount
                                border-radius: $border-radius 0 0 $border-radius
                                border-right: 0
                            &.amount-usd
                                background: #f1eeee
                                padding-left: 20px
                                border-radius: 0 $border-radius $border-radius 0
        >.header
            margin: 0
            padding: 10px
            text-align: left
            padding: 0
            >.head
                width: 70%
                line-height: 70px
                font-size: 20px
                font-weight: 700
                vertical-align: middle
                line-height: 29px
                display: inline-block
                color: #677897
                &.right
                    text-align: right
                    width: 30%
            img
                width: 34px
        .usd
            font-size: 11px
            padding-left: 4px
            color: gray
        .topup
            display: inline-block
            margin-left: 5px
            color: orange
            vertical-align: top
            padding: 0 5px
            border-radius: 3px
            line-height: 12px
            font-size: 12px
        .balance
            color: #5E72E4
        .send-all
            background: #3a63e4
            outline: none
            border: 0
            color: white
            border-radius: 4px
            font-size: 10px
            text-align: center
            padding: 0 5px
            cursor: pointer
        .not-enough
            color: red
            min-height: 33px
            padding: 0 4px
            font-size: 12px
            max-height: 20px
            overflow: hidden
        .fast-cheap
            text-align: right
            height: 14px
            line-height: 14px
            padding: 3px
            flex-direction: row
            display: flex
            >*
                padding: 0 5px
                font-size: 10px
                border-radius: 4px
                cursor: pointer
                text-align: center
                &.chosen
                    cursor: default
                    background: #3a63e4
                    color: white
                &.space
                    flex: 1
        .escrow
            padding: 5px 11px
            min-height: 20px
            @media screen and (max-width: 290px)
                min-height: 0
            color: #cc625a
            font-size: 14px
        .bold
            font-weight: bold
        .button-container
            text-align: center
            .buttons
                margin-top: 10px
                text-align: center
                border-radius: 5px
                width: 100%
                display: inline-block
                overflow: hidden
                .btn
                    width: auto
                    padding: 0 6px
                    line-height: 36px
                    text-transform: uppercase
                    text-align: center
                    font-weight: 600
                    border: 0
                    margin: 5px
                    font-size: 12px
                    border-radius: 5px
                    display: inline-block
                    cursor: pointer
                    box-sizing: border-box
                    transaction: all .5s
                    &.btn-primary
                        background: #6CA7ED
                        color: white
                    &:hover
                        background: rgba(#6CA7ED, 0.2)
                        opacity: .9
form-group = (title, icon-style, content)->
    .pug.form-group
        label.pug.control-label(style=icon-style) #{title}
        content!
recaptchaRef = react.createRef!
cancel-button = (store, web3t)->
    return null if store.preference.disableInvoice isnt yes
    lang = get-lang store
    { invoice, token, wallet, primary-button-style, recipient-change, description-change, amount-change, amount-usd-change, cancel, send-anyway, get-address-link, get-address-title, default-button-style, round5edit } = invoice-funcs store, web3t
    .pug.button-container
        .pug.buttons
            a.pug.btn.btn-default(on-click=cancel style=default-button-style) #{lang.cancel}
send-by-email = (store, web3t)->
    return null if store.preference.disableInvoice is yes
    { invoice, token, wallet, primary-button-style, recipient-change, description-change, amount-change, amount-usd-change, cancel, send-anyway, get-address-link, get-address-title, default-button-style, round5edit } = invoice-funcs store, web3t
    change = (response)->
        send-anyway response
    send = ->
        recaptchaRef.current.execute!
    style = get-primary-info store
    input-style=
        background: style.app.wallet
        color: style.app.text
        border: "1px solid #{style.app.border}"
        text: style.app.text2
    icon-style =
        color: style.app.icon
    more-text=
        color: style.app.text
    address-input=
        color: style.app.addressText
        background: style.app.addressBg
    href-style=
        border: "1px solid #{style.app.border}"
    filter-icon=
        filter: style.app.nothingIcon
    lang = get-lang store
    .pug.content-body(style=more-text)
        .pug.header
            span.pug.head(style=more-text) #{lang.invoice-header ? 'SEND INVOICE BY EMAIL'}
            span.head.pug.right
                img.pug(style=filter-icon src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGcAAABnCAYAAAAdQVz5AAAAAXNSR0IArs4c6QAAAERlWElmTU0AKgAAAAgAAYdpAAQAAAABAAAAGgAAAAAAA6ABAAMAAAABAAEAAKACAAQAAAABAAAAZ6ADAAQAAAABAAAAZwAAAAA7gf8VAAAVTUlEQVR4Ae1dC3hU1bVe58zkDYQ8gRCSCAQCAiLvh1QQ6wNRqMCVa/upLd8tvVSKWBGtX61XqUKvlVt773erUir1UgEFiqIWhCIgIIRXIECAAIEk5E3IO/M65651ZvbMmcmZ15kzj0AW38nec85+nfXv9dhr7xk46OT0s7c+zjGKrX8TOWE0x3FRogAGjhN3pSULP1q1cGFDZ349rjMPfsHKNS8IAqwEEHUK72Hg9OIP1774080KzzrFrU4JzuIvv4xpPlG2C3h+sigIKDC21xBFAMpTioRPRB5gw19+9W9Pdgo0XAbZ6cD52ZsfTm4XDV+BCN1d3qXjRwYUx1/n43VT1i79yeWOhSL3Dk6szkPPvPX+f7UJhv0MGNEmIZQqXqjzpPuCJcPSbDy/YMV7z3aet0Ul0BkGu/jNtWkNQvu3qKQGEbOZGmN5SonoPrun9F5YSuSA3zspXXxg4cKFJqUykXQv4sFZ8Pqa+UYwr0O2R9NgCQY2aJa3QqPAVgKNqTZ6zPI83xAdLTy0Zvmi7xRqRcwtJS8nIgaHEsCV6PtsNYuWVxAYPQ1KkgpbyqSFpfTcFTy6JydUfliGpEuItVi4n4yc+mi3gm+2fy0vE0l5NglVjwmZ80OsvAivkXjFq24o8isai0tr/s/Syj2Xl5fWFIrhBgQOAvN7HOTzoRhoJPRxpbxGaG41XogWYsaFAiDV3hoCMwkZtjQSmBbCMfAmsznPyBvyi4pqvLvyAQ5MNTjY7wy8ApK8AMcetuoI0GCjznA02AAFAs7gsHEnAjo2mcyDTDrDsWACFAg4gdSNAPYGPgSjyZyLAB0PFkC3PYMDhQgBGogAnQwGQF3gBIoO1keA+pt0xgKtAeoCRwNwqAmjyXSHWW88pSVAXeD4BY5n59RgNOUgQKe1AqgLHD/AiY2J8loaAcpGgAq1AKgLHK/sdhRI7dkNdDrvLEOAshCgs4EC5L0nx9hu+1yUXgeDsntD94Q40PGeWYcAZVr0xnOBACRFe297rvvBgDhUbblZ6b7W6IsF78HrK18ryMt1SnBom6a4UoTCUhHKbohQjldDC0Abbp8ZzQCxaBq6xQL06clBv1QOxvTnIK+vZ2MuZ4rG+Ti17XUqcMpuAOwsEODgeQGa291usUGrAaSrukGEgqsA248BpPbg4J7BPHxvKA8ZSWrZFdp6nQKcOtw9+es+Cxy+KKjmTm2jCH/Pt8BnxwSYPZaHOeN5tBuqmwtJRdXgFJdWDB/Yr0/QB7n3rAhr91jAYOooKbFRHAzO4CA7jYM+SRzEx1hVGqm2lnaAhjYRLleJcOG6CPUt1vqCIMKWwxY4dlmAnz+oh6zU4L7CwZPnh6jtwW9F/NTL/53SbGjav+zp2UMmjMhT269P9TYcEKTZ7lr4zn48PDSSh5E5HET5uNF+pkxE9SbAiSsO6YtBcH89RwcDe/vNBtchuf38nx9uEQ+fOv/Hzat/tcRtITcPfHw1a+25z735eLu5/SDu5veePHIIZPYK3rTbli/Ap99ZnIbdGw388zP1MHcCD32TOb/UUjrZnDwepYxHOySCCZu2IE5HL4kwBe0QORHBoG+Pn+HKqmvHD5k4/cnhY+/fePbI7lZf+/FZ6/5g6W8/toD4KZ6jjMETEr62r6rcscsibDjomOHUyGRk7Kof6WFoZmCzfOwADlbM10PPBGs7jaj6/rrXeRKoGrSnSsQuUcT9H6H0B8+/Nc9TUfkzr+DMWbq6/+zn3ijHY6/zRdHCES54egWv4ADUZgRYsxungaz9+0foYPFDOohxsZBoPiR3evdpkjIBdqAnV1Ijfz20Pei5yS9qn7y1l2brIVY6bAWS91eOnmBwiA48Er9wsolijGg2b3z8uTc+8aUvl9d1rjJnyYpnzZbG1bgbLZWjuWY9XuRcTstPG1FimPGmdgf25mHBNOc5ROro76j2vj4lwE2boXeMwQJkkxY9oIMmdApeWo+LHxndfQcPy2fpICcNYB6qx4/QCyQigJ+617kfWTX1WfkcpgmHZ7PwIOrcWb94vUKMj5ry2cqXi901rjia0e+9FzVryet7TILwLlbU0yyWLoKG8vgvGNSA2nh3oUOdRes5WPSgTjoLyPqraQR4daMFPjlkUQDGWupMqQCvbjLDdwqut9z4k1ORnmhVb/vOCZIdYv1olRK/yEOki+UpxQ+9uVZT0WO/eMOto9ABnJlLV4zLPF1ZI1qEqXROXyTdIYGBjdvyUhoEfL46gQwyOxp+YpLzgpHU02+3mOFSlQNAYiIdw81AV5rcaUZ1TbiuOdLRluTKPDNa50zChSkRLWqPX3H0zdoJNKWJjMcYpYvlKZX+iYIORMvqWYv/Yx8JhGtfTuDMWvzaSs5kOoQ4J0qASGPFP5TK844bru0F9JlmL6Pkbhw8fLfT8GD1dgtU3pQGworBiGwe3v2xHt55Wg+r8XptnsPY2wvJMgNk4NDtUXc4AC2ucG5bVk19FpuUtA1pHJv0SKkjzwmiMCWjsKJ21vMr6LiZnaS3n7d8eeKji35zWhCE5ch33t6YzfAzg2YVTcEqovYmtMlQrOxGs4M504fzwDv4BgfOUyzNAR71Oro/Dy/P1kFaD8cYKIb2zFTlFQJJVgIuVOXUy6bW6B7F6bQnBEUCyNoy5e3EPlAqCD1Eo2n/Y4tfe5s9189c/Oqj7U3cJsQXQ4VIVNDGFAKJndynR9ZzxtbzxvRZSzp9TT5qgLEDHFJDQ9p40FlFkSu8ZIazPWLjmZDLSa6yq7MgtzesbA88QMyjWhSwk2Z0ILQmm32RmiVVJvHQqoZseUFKqQBKEM5H7pczF/16hijGT+b75M18CRGIxQcodigVtpTyRCylPD2zp8QxDelqraO97nGcU1iFFo0UxJTT/ShZ0R58TWbo5XWUwGlDO0bAEJktzn3I6waSZ5qIJr4dLFne/hw7oXx0QsqQAROfnqlPzLirsnvaICg5sg4MzdVOkiINyDZwypNAUWWZtpGKaPGnvM7BGLmaora/LXJWZ3Rv6p0OyaLPruS6JqLncmeAla9G749Rt1jt34zeSlrjYGrVQigp9FUU6T5pJitPrTcAknPGQ69B3wceuBbpDXl9LPSftBBS7piMAudgEpMaSumiGWZPpda0+9PY5mirZ7wzk4owcCknsh2pXk4qN7Q614lCt5wCpK50pdpRLqmb61MNPssmN9p0qUFKrXlysekeGnp9NOSMfUoChvXqpBjSc++D7umD4NrR9WAxG6wiSFVtHdCrBUtyaOXOqGcCy5GLC0DhfjlRJNoT0SK18qZziRwERmmLgPaGGA3u47ldVs6vlCa0DCClfHxiJvQb+zR+/9hZGzh/wl7jsGDutGWQkJRlVV/YMA1ZDozUgaxDvwbrpjAxlFEPmeTQwtSVyM32RBfR8zPK1ktUVsne1OPuKUWrGVFkQWuytk5/GUjW1AoSB70GPwDZ43/cARgah+JoCMHscc9AryEPI+pWg2k1miiGEiiOF9LqZWgvhpEJ92MYtRk79uXqDrOyLD2GkWZXUgKHQje0PCAamslD756utQL/TCC4rGskSdJFx8PAKYsgJWeC206c1JprqZTscdAjPRcuHVoDZkMzdoIlcNLanDbX4gF97o6OfJPN7lCkmFGcLTjJPlPa7hwukz/CyQOwX8GBcAWHogFylea64HVqNMAPdlVmtf6Q2Hso9Bv1hNdWFSVHXisqLgny7lsGPXrdKd2WQjfyAhrl+6Y4VNXVGgc4ZPh18tUo9nfBw0p+x8mOwdAE9MJ6YcyDER0MefdLx7ppeBaP6ypH/6ycJilJju0fKarMkfN8Aob69goOG2DWqH+RGuV4DAdRh3hpSdl4SoYRHeRg3hsdsnSd9QUlHbcGqC5tSbvuA9F9uWf3z0IRVm2zoPRZx0/bBgvuU44oUF1NCLuKjkuBIdNfgMSMYT436TM41CKJY970ZbRI8rkDXwuOyHaAQ3Zgjyw6raRy3txqhiPFZPjxrAA6DRQ0ff1T5bMGtFez6ZAAr2ywwPu7zPbgql6HO6uP6IJia+zvjZM4JXs8DJ62BMjO+EMebY5SQ3rsYPDUJdAO15Ueq76Xi24shWRYyGUX7q88hqdkCDIKx4zBcM7RSw6XrhHXMe9sN3dcNCuMgFb+dKhDTqQqF35fh4FTx6SQP9ciT2uYhOxpkJGRrqo5vyRH3sPOaxl4YKIW9+EdDJM/9zdPLJo+zDGcGlzb5KNkMHoWd0Lz+jqes/ty9Ur7PzNHe1dR/dC+rZivgyl5wQOmpr4J/rTfABUmdcDQ+/ktOXamYGbvte5Q0miAeSOM0CtFZnFZIT/TB3Hz63M8IcPWKO/vsuCqXi8ZczqA8crjOtiWz0nb0U0yj46kgE7iPHmPDg9+gBTdlntiNAwqMzyLg8m4fzNxEAd47NlOVfirbGabYJFDFeihw8NFVbC9uKdHr9LeuYcM98JWw2a07o97KOP1EcWxHhlQDxOH9vZa1luBrUcEpwh0Bp6yWfGEXjqTxuqSL1JaR7ZGBHIY6CSO69qHFpgV9RgWQWYn4aI1GUMzSseoaDKs3+9QeffiSZx/xy1uNdTaboCtx1vgZJUsxKGmIayDCn2OasmR92lAo7zlfBIU37gBc8YkQHysbEUpL+hD/rExvLS9zNzp67jH8vbnFvjlozo7ADS7rYcB3aulJORPku2EjbtuP8ZzcdvwFCij+BgO5k9WB8yF0mrYci4R6loCB4aNp6MSZ09UpKdqEuAPe3EdcrVKRW1rFYp/vThLL51tZo2cLRNg+XoznChx2CD2TE16CV3u32yyOAFDezqLH9YhoP61SDZ3e34F/PkYAeNfXW+lNVFrrp2QKpnStwZmjM5QjBm5llf6THZg1TYzkOTIaQCexpmENmNkDh0slD/xnDdgVOE8RrdpK5x2VeWOBNmjn96vg3uHupdEpdar6hpg40keShujlR4HdI/UWlDAYaPK6tEO8+8GSEtW5ywQQz/AM2xK+znUB31zgA4ZJqP66o5ftEjEgCl99YPCO+Qw0EKW1kAkKbQ1wOJobHyUkvv+czzhQ86CP3SgsBT+cSUd2mVxQH/qeysbdHBoAHFosGfkVMGEYVnexuP2+VmMHNO3DEpkey9uC/v4gBag03DD7l8n807OhrfqrW3t8Mnheiis90NsvTWq8Dwk4LB+RyTVwtyJqRAXo95ZIJDo+zlke5S+dcD68pSSpNBxqEdG8ZDi5+Za0ZXrsLkoGW62+ydlnsbj7plm3pq7DuT3T9WnQvk/LTD3zkoYmKXO5SYVNjRTJ61JKPh5rlyU3OWKepBOiZLX2I6bduTN0bqIruTueJ4NtwLI3R6Gqqt/uv+MlYz+4atwoDIDQ5ihI01caV+HW9eugw+OJ8GU8mJ4ZMIA+166r/VZOVpAWoHyn9GsDV/Tytp62HBUgPK2DF+raFYupODQqGm/ZW9lP7i8swKeHJcAqUnqnAXNOOChoX0nLsHOskwgiQwHabrO8ecFSltT4I8HY+Hw6Uv+VAtJ2ZbWNljz9RX4vCR8wNCLhlxy5NxtRfvwaXEmFFVdhPnfy4aYaO3XC/L+fMmfKS6FzbjSbzKHXo25ji9skiMfSGFTFvx+RyNculYhvx3SPBn9T745C+tOpyMw6j1KLQcdEeDQC9Wbu8MHJ5Jh+7eFTqt3LV/WXVsV1XXwzhfX4Uj9gJB6Y+7Gw+5HDDg0IDoetbcmF/6w/TLcuNnIxhjUdE/+OfifQ/FQbU4Laj9qGo8ocNgLlJszYfU+gPzCi+yW5mkzGv3/3X4WvizrDwYhItng+wEPzbnjpcF2SwxsupgFH/6jgH5ozktp/x6fvlACb+9shsumAf5VDHHpyJwyMiacacuD331+Ha6UBe4smC0W+HjHCfjoTB9oEWVf6pH1F0nZiAeHmHW1vg+8uiUZPttToJp35VW18MpaXLucHwZtskPzqhsMQcWIBoeiCbXVHDQ1cWBCu/C3gqHwxroCuNnY7Bdrdhw4BS9vioOrLdm4bQBQU81DS0j+NwK/htmhcMSCgxoIaio5nOXO8bMz9UPhxXWtcNQHZ6GppRVWfnQU/pI/BIwW5wXujRs83Kx3brsDd8J8IyLBMRk5qKrkwYipEjVakuDtXTnwwZbDeEBQOfBVUHQJXviwDk7W3aXUhHSvqZGDuhr6L1vcFgnrg7CGb5TenCTFV4btvjYKTv6pBGbf3Qx3Dc6CbgnxUFJWCV98VwHH68b4tKBsbeXAjBKami7g73cqjSh89yIKnGa0A/WkavyYyXXmbPhzPjKQLon64l+6fCcjxviqUVJT00WIivKjc9+7UFUyYtQa6f96tAP+AKPqjd1UIu1YhRLUHkGeXNjBIX0veWSo/8NN9L0jyZNrDv9YiBdhVWvkkREw7gx/uMC6UYd2CCUpsWd4VVzYwDGZOKitQiYgQJFIjQ04NowaJadav44ejjGGRa2RXq9G/R6pwDAgyJOrruKBJDwcFHJwaGVOel2jb44EnWdG/IUP8uRI0kNNIQWHPDJamXc2IvtDkt6Ov4kQSgoJp8gjo4Ulrcg7K5Gk11JMLoSeXNAdAskjq8FQDKqHzk40yULpyQUVHMkjQ1fZTfir02IleXKo6pJTguvJBQ0c8shqazGoiOrgVqTWFpp0HKSlCYDf/g8KBcXmkF4mj+xWBYYhQaqaoufmIHlymoPTcBM9Mlxh3y5kj8kFwZPTDBzmkZE+vt3I7smhqtOSNLE55JHVoUdmuAU8MrXMlTw5tLEU8tEqJhcwOLeqR6YWJC09uYDAoRUzLS47SyhGLcP9rWf35HB31eXHB/1qSrXNIY+MVsxdwCjzW/LkKjAmh+62WlIFDvPISM92kXsOSDG5Cg4MKj05v8C5nT0y9xB4fkKapRo1DKk6f8lnmyOgR1Zzi8TI/GVSwOUp8IueHB359seT8wmcLo8sYHikBpgnl4IxOemH5Lw06xUc0pe1XR6ZFzb6/pjUm8WC5+QoJufFqHh83IINdaZdS99ZFN6SNOHpGJa3aL1bcCSPjKLKXR5ZUJCkYGkVutqeoioYOganoL7kkSEot2OMLCgoeGiUPLkaPECi6Mnh2l6PP0VymUkHfSeTFpa3wq6lB55E1CMmDKTieiQ61BR+4+Uy/jK+uI9GSyvZahSzLmDCgx2ZkTraarHiU53bN/ocv2pW7Bet7fz+alzJejNQ4Rn27dNrq22TUrDwyxaO4UySQ2BuinoiOpr7Rq/Hn4vmOIds3T58Cfubcjwn6qO5Bk7HvTNBjFpPA/p/kkwoI2GB08cAAAAASUVORK5CYII=")
        form.pug
            form-group lang.funding-address, icon-style, ->
                .address.pug(style=href-style)
                    a.pug(href="#{get-address-link wallet}") #{get-address-title wallet}
            form-group lang.recipient-email, icon-style, ->
                .pug
                    .pug.amount-field
                        .input-wrapper.pug
                            .label.crypto.pug @
                            input.pug.amount(type='text' style=input-style on-change=recipient-change value="#{invoice.to}" placeholder="email@address.com")
                        .input-wrapper.pug
                            .label.lusd.pug 
                            input.pug.amount-usd(type='text' style=input-style on-change=description-change value="#{invoice.data}" placeholder="Description")
                    ReCAPTCHA.pug(ref=recaptchaRef size="invisible" sitekey="6LeZ66AUAAAAAPqgD720Met5Prsq5B3AXl05G0vJ" on-change=change)
            form-group lang.amount, icon-style, ->
                .pug
                    .pug.amount-field
                        .input-wrapper.pug
                            .label.crypto.pug #{token}
                            input.pug.amount(type='text' style=input-style on-change=amount-change placeholder="0" title="#{invoice.amount-send}" value="#{round5edit invoice.amount-send}")
                        .input-wrapper.pug
                            .label.lusd.pug $
                            input.pug.amount-usd(type='text' style=input-style on-change=amount-usd-change placeholder="0" title="#{invoice.amount-send-usd}" value="#{round5edit invoice.amount-send-usd}")
        .pug.escrow
        .pug.button-container
            .pug.buttons
                a.pug.btn.btn-primary(on-click=send style=primary-button-style)
                    span.pug #{lang.send ? 'Send Email'}
                    if send.sending
                        span.pug ...
                a.pug.btn.btn-default(on-click=cancel style=default-button-style) #{lang.cancel}
send = ({ store, web3t })->
    { wallet } = invoice-funcs store, web3t
    .pug.content
        receive store, wallet
        send-by-email store, web3t
        cancel-button store, web3t
module.exports = send