require! {
    \react
}
module.exports = ({ label, type } , click)->
    button.pug.btn(type="submit" on-click=click class="#{type}") #{label}