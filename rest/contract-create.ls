require! {
    \react
    \./input.ls
    \./date.ls
    \./cap.ls
    \./textarea.ls
    \./number.ls
    \./label.ls
    \./button.ls
    \./select.ls
    \./Container.ls
}
module.exports = (cb)->
    percent = "15%"
    c = {}
    create-contract = ->
        cb null, c
    cancel = ->
        cb "Cancelled"
    Container.pug
        form.pug.form-horizontal
            h1.pug New Token Contract
            select   { value: c.platform          , label: "Platform"         , hint: "Please choose blockchain platform where create tokens", options: [\ETHEREUM, \WAVES] }
            input    { value: c.token             , label: "Token Symbol"     , hint: "Please imagine and put token symbol for your coin. For instance ETHEREUM has ETHER symbol" }
            date     { value: c.start-ico-date    , label: "Start ICO Date"   , hint: "When are you going to start crowdsaling" }
            date     { value: c.end-ico-date      , label: "End ICO Date"     , hint: "When are you going to end crowdsaling"}
            cap      { value: c.min-cap           , label: "Min CAP"          , hint: "Minimum amount to consider crowdsaling as successfull" }
            cap      { value: c.max-cap           , label: "Max CAP"          , hint: "Maximum amount to close crowdsaling earlier than End ICO Date" }
            label    { value: percent             , label: "Blockstarter Fee" , hint: "Blockstarter's interest" }
            number   { value: c.max-total-supply  , label: "Max Total Supply" , hint: "How many tokens are you going to create?" }
            textarea { value: c.welcome-text      , label: "Welcome Text"     , hint: "People will see this headline on ETHEREUM page" }
            br.pug
            button   { click: create-contract     , label: "Create Contract" , type: 'btn-primary' }
            button   { click: cancel              , label: "Cancel"          , type: '' }