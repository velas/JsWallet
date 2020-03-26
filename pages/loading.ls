require! {
    \react
    \../get-lang.ls
}
.loading-page
    @import scheme
    $gradient: $primary - 20
    text-align: center
    overflow: hidden
    height: 100%
    $base-line-height: 34px
    $white: rgb(157, 65, 235)
    $off-white: rgba($white, 0.2)
    $spin-duration: 1s
    $pulse-duration: 750ms
    @keyframes spin 
        0% 
            transform: rotate(0deg)
        100% 
            transform: rotate(360deg)
    @keyframes pulse 
        50%  
            background: $white;
    .loading-flex
        display: flex
        justify-content: center
        align-items: center
    .loading-pulse
        position: absolute
        top: calc(50% - 32px)
        width: ($base-line-height / 4)
        height: $base-line-height
        background: $off-white
        animation: pulse $pulse-duration infinite
        animation-delay: ($pulse-duration / 3)
        &:before, &:after 
            content: ''
            position: absolute
            display: block
            height: ($base-line-height / 1.5)
            width: ($base-line-height / 4)
            background: $off-white
            top: 50%
            transform: translateY(-50%)
            animation: pulse $pulse-duration infinite
        &:before
            left: -($base-line-height / 2)
        &:after
            left: ($base-line-height / 2)
            animation-delay: ($pulse-duration / 1.5)
module.exports = (add-class)->
    .loading-page.pug(key="loading")
        .loading-flex.pug
            .loading-pulse.pug