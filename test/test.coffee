typeshave = require('../index.coffee')
typeshave.verbose = 1
typesafe = typeshave.typesafe 

mydata =
  type:"object"
  properties:
    foo: {type:"string",regex:/abc/}
    bar: {type:"integer",minimum:0,maximum:100}
    records:
      type:"array"
      items:[{
      name:{type:"string",minLength:2}
      age:{type:"integer"}
      }]
  required:["foo","records"]
                                                      
foo = typesafe mydata, ( data ) ->                    
  console.log "valid data passed!"                    
  # do something with data                            

try
  foo { }
catch TYPESAFE_FAIL
  console.log "ok"

foo = typesafe
  foo: { type: "string"  }
  bar: { type: "integer" }
, ( foo, bar ) ->
  console.log "arguments are valid"

bar = typesafe
  one: { type:"integer" }
  two: { type:"integer" }
, ( one, two ) ->
  console.log one+" "+two

try 
  foo 123, 123
catch TYPESAFE_FAIL
  console.log "recover"
finally
  console.log "finish"

bar "foo", 123
