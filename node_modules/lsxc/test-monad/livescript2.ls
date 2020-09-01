

#func = (test)=>
#   stop "ok"
#   next "test"
   
   
test-func = ->
  func = (test)=>
     err <- run 1
     stop when err
     set-timeout ->
         next "test" 
     