require! {
    \prelude-ls : { foldl, split, join }
}
transform-func = (line)->
    line.replace /(\)=>)/, ',cb$)->'
leave-space = (text="")-> (what)->
    (what.match(/ +/)?0 ? "") + "return cb$ #{text}"
tranform-success = (line)->
    line.replace /^ +(next) /, leave-space('null,')
tranform-fail = (line)->
    line.replace /^ +(stop) /, leave-space!
leave-space-variable = (text)-> (what, what2, variable)->
    first = leave-space(text) what
    "#{first}#{variable} if #{variable}?"
tranform-fail-when = (line)->
    line.replace(/^ +(stop when) ([a-zA-Z\$_][a-zA-Z$_\-0-9]+)/, leave-space-variable!)
transform-line = (state, line)->
    current = line.match(/ /g)?length ? 0
    if state.monad.line >= current
       state.monad.enabled = no
    just-enabled = line.match(/(\)=>)/g)?length is 1
    state.monad.enabled = just-enabled if state.monad.enabled isnt yes
    relevant = state.monad.enabled and state.monad.line < current
    transformed =
        | just-enabled                              => transform-func line
        | relevant and line.match(/^ +next /)?      => tranform-success line
        | relevant and line.match(/^ +stop when /)? => tranform-fail-when line
        | relevant and line.match(/^ +stop /)?      => tranform-fail line
        | _ => line
    state.lines.push transformed
    state.monad.line = current if just-enabled
    state

transform = (content)->
    state =
        lines: []
        monad: 
            enabled: no
            line: 0
    result =
        content 
           |> split \\n 
           |> foldl transform-line, state
    result.lines |> join \\n

module.exports = transform

#require! {
#    fs : { read-file-sync }
#}
#content = read-file-sync \./livescript2.ls , \utf8
#transformed = transform content
#console.log transformed
#console.log livescript.compile transformed
