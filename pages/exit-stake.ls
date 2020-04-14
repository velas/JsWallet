require! {
    \react
    \react-dom
    \../get-primary-info.ls
    \../web3.ls
    \../get-lang.ls
    \../icons.ls
}
.steps
    @media(max-width:800px)
        text-align: center
    .step
        display: inline-block
        vertical-align: text-top
        text-align: center
        padding: 0 20px 0 0
        margin-right: 20px
        margin-bottom: 20px
        width: 140px
        opacity: .6
        position: relative
        cursor: pointer
        transition: all .5s
        @media(max-width:800px)
            padding: 0 10px
            width: auto
            margin: 0 auto 30px
            display: block
        &:last-child
            &:after
                content: none !important
        &:after    
            display: block
            left: 150px
            top: 18px
            position: absolute
            border-top: 2px solid grey
            width: 20%
            content: ""
            @media(max-width:800px)
                content: none
        .step-content
            font-size: 13px
        button
            width: auto
            display: block
            margin: 15px auto 0
        .step-count
            display: inline-block
            background: grey
            padding: 10px 15px
            border-radius: 50px
            margin-bottom: 20px
        &.active
            opacity: 1
            .step-count
                background: #39dcb4
                animation: pulse_step 1s linear
                transform-origin: 50% 50%
            &:after    
                display: block
                left: 150px
                top: 18px
                position: absolute
                border-top: 2px solid #3cd5af
                width: 20%
                content: ""
                @media(max-width:800px)
                    content: none
    @keyframes pulse_step
        0%
            transform: scale(0.8)
        25%
            transform: scale(0.9)
        50%
            transform: scale(1.1)
        100%
            transform: scale(1)
module.exports = (store, web3t)->
    style = get-primary-info store
    lang = get-lang store
    button-primary4-style=
        border: "1px solid #{style.app.primary4}"
        color: style.app.text
        background: style.app.primary4
    activate = (step)-> ->
        store.current.step = step 
    activate-first = activate \first
    activate-second = activate \second
    activate-third = activate \third
    active-class = (step)->
        if store.current.step is step then 'active' else ''
    active-first = active-class \first
    active-second = active-class \second
    active-third = active-class \third
    .pug.section
        .title.pug
            h3.pug Waiting process
        .description.pug
            .pug.left
                .steps.pug
                    .pug.step(on-click=activate-first class="#{active-first}")
                        .pug.step-count 1
                        if active-first is \active
                            .pug.step-content 
                                | Please click the "Request exit" button
                                button.pug(style=button-primary4-style)
                                    span.pug
                                        img.icon-svg.pug(src="#{icons.exit}")
                                        | Request exit
                    .pug.step(on-click=activate-second class="#{active-second}")
                        .pug.step-count 2
                        if active-second is \active
                            .pug.step-content Come back in 1.5 hours for a reward
                    .pug.step(on-click=activate-third class="#{active-third}")
                        .pug.step-count 3
                        if active-third is \active
                            .pug.step-content Take away the reward and Request exit