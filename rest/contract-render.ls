require! {
    \react
    \./label.ls
}
module.exports = (c, a)->
    percent = "15%"
    Container.pug
        form.pug.form-horizontal
            h1.pug Your contract is created
            label { value: c.info.project      , label: "Project" }
            label { value: c.platform          , label: "Platform" }
            label { value: c.info.address      , label: "Contract Address" }
            label { value: c.info.wallet       , label: "Contribution Address" }
            label { value: c.token             , label: "Token Symbol" }
            label { value: c.start-ico-date    , label: "Start ICO Date" }
            label { value: c.end-ico-date      , label: "End ICO Date" }
            label { value: c.min-cap           , label: "Min CAP" }
            label { value: c.max-cap           , label: "Max CAP" }
            label { value: percent             , label: "Blockstarter Fee" }
            label { value: c.max-total-supply  , label: "Max Total Supply" }
            label { value: c.welcome-text      , label: "Welcome Text" }
