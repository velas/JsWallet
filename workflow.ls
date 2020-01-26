require! {
    \prelude-ls : { each, pairs-to-obj, obj-to-pairs, take, drop }
}
#promise creates by workflow.context(function(success) {}) -> promise (check example below)
promise = ->
    secret = 
        done: no
        callbacks: []
        result: null
        notify: ->
            if secret.done
                secret.callbacks |> each (-> it secret.result)
    success: (result) ->
        secret.done = yes
        secret.result = result
        secret.notify!
    then: ->
        secret.callbacks.push it
        secret.notify!
#create parallel object. the user doesn't use it directly. scripts creates Parallel object automatically when you pass {task1: func(), task2: func() }
class Parallel
    (tasks)->
        @tasks = tasks
        @results = []
        @callbacks = []
        @done = no
        @notify = ->
            if @done
                res = @results |> pairs-to-obj
                @callbacks |> each ((c)-> c res)
        me = @
        @success= (name, res) -->
            me.results.push [name,res]
            if me.tasks.length is me.results.length
                me.done = yes
                me.notify!
    then : (func)->
        @callbacks.push func
        @notify!
    run : (val) ->
        for pair in @tasks
            const composition = 
                switch typeof! pair[1]
                    case \Function
                        [  pair[1] ]
                    case \Array
                        pair[1]
            const array = composition ++ [ @success pair[0] ]
            go array, val
max = 50
#create the parallel process from the object 
make-parallel = (o, val, success)->
    tasks = 
        o |> obj-to-pairs
    if tasks.length is 0
        #console.log \success, success
        return success {}
    if tasks.length <= max
        parallel = new Parallel tasks
        parallel.then success
        parallel.run val
    else 
        head = tasks |> take max |> pairs-to-obj
        tail = tasks |> drop max |> pairs-to-obj
        make-parallel head, val, (collector)->
            make-parallel tail, val, (injecter)->
                for prop of injecter
                    collector[prop] = injecter[prop]
                success collector
#run chain of tasks. the result of current task is input of next task
go = (fns, val) -->
    const o = fns.shift!
    if !o? then return
    const process-val = (nval)->
        const next = go fns
        if typeof! nval is \Object and typeof! nval.then is \Function
            nval.then next
        else 
            next nval
    switch (typeof! o)
        case \Function
            val |> o |> process-val
        case \Array
            go (o ++ fns), val
        case \Object
            make-parallel o, val, process-val
#it exports the function with additional field .context. 
#So if you need to run the chain. pass the array into this function. if you need to build the chain function wrap it with .context (check example above)
export run = ->
    p = promise!
    arr = Array.prototype.slice.call(arguments)
    if typeof! arr.0 is \Array
        go.call do 
            * go
            * arr.0 ++ [p.success]
            * arr.1
    else
        go.call do
            * go
            * arr ++ [p~success]
            * []
    p
export context = (func)->
    p = promise! 
    func p.success
    p
export task = (func)->
    ->
        p = promise! 
        func p.success
        p