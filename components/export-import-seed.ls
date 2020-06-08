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
    spinbkp = localStorage.get-item \spinbkp
    sseedbkp = localStorage.get-item \sseedbkp
    .pug.export-import-seed
        .pug.section
            .pug.header Export Seed Backup
            .pug
                input.pug(value="#{spinbkp}")
                input.pug(value="#{sseedbkp}")