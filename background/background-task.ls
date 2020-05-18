require! {
    \prelude-ls : { obj-to-pairs } 
}
tasks = {}
export add-task = (id, task)->
    cb = console.log 
    return cb "id is required unique string" if typeof! id isnt \String
    return cb "task should be a function" if typeof! task isnt \Function
    return cb "already known task" if tasks[id]?
    tasks[id] = task
escalate-one-by-one = (store, [head, ...tail], cb)->
    return cb null if not head?
    [id, func] = head
    err <- func store
    delete tasks[id] if not err?
    <- set-immediate
    escalate-one-by-one store, tail, cb
escalate-tasks = (store, cb)->
    task-array =
        tasks |> obj-to-pairs
    escalate-one-by-one store, task-array, cb
export start-service = (store)->
    #console.log \start-service-of-background-tasks
    err <- escalate-tasks store
    <- set-timeout _, 10000
    start-service store