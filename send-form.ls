state= {}
activate-form = (store)->
export wait-form-result = (id, cb)->
    activate-form!
    state[id] = cb
export notify-form-result = (id, err, data)->
    return if typeof! state[id] isnt \Function
    state[id] err, data
    delete state[id]