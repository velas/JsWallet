require! {
    \react
    \localStorage
}
.export-import-seed
    border: 1px solid white
    .header
        font-size: 15px
module.exports = (store)->
    return null if not store.url-params.backupseed?
    spinbkp = (localStorage.get-item \spinbkp) || ""
    sseedbkp = (localStorage.get-item \sseedbkp) || ""
    restore-spin = ->
        new-spin = prompt 'Please enter previously saved value from first (left) field. This will override your current data. Try this on your secondary browser or in private/guest mode first! DO IT ON YOUR OWN RISK!!!', ''
        localStorage.set-item \spin, new-spin
    restore-seed = ->
        new-seed = prompt 'Please enter previously saved value from second (right) field. This will override your current data. Try this on your secondary browser or in private/guest mode first! DO IT ON YOUR OWN RISK!!!', ''
        localStorage.set-item \sseed, new-seed
    .pug.export-import-seed
        .pug.section
            .pug.header Export Seed Backup
            .pug
                input.pug(value="#{spinbkp}")
                input.pug(value="#{sseedbkp}")
        .pug.section
            .pug.header Restore Seed Backup
            .pug
                button.pug(on-click=restore-spin) Restore spin
                button.pug(on-click=restore-seed) Restore seed