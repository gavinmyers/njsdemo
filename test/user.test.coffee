userModule = require "../src/user"
User = userModule.class
request = require "request"
console.log '\u001B[2J\u001B[0;0f'


frank = new User -99,'jjj-hhh-lll'

if !frank? || !frank.id? || !frank.token?
  throw new Error "user not created"

if frank.id != -99 || frank.token != 'jjj-hhh-lll'
  thow new Error "user constructor failing"

if !userModule.get?
  throw new Error "user get/controller not defined"

request.get "http://127.0.0.1:8008/user", (err,res,body) ->
  obj = JSON.parse body
  if !res? then throw new Error "no res"
  if 200 != res.statusCode  then throw new Error "no user"
  if !obj? || !obj.id? then throw new Error "invalid user"
  process.exit()

userModule.get = (req,res) ->
  u = new User -256,'ooo-eee-ooo'
  res.write JSON.stringify u
  res.end ""

  
request.get "http://127.0.0.1:8008/user", (err,res,body) ->
  obj = JSON.parse body
  if obj.id != -256 then throw new Error "user get override failed"
  process.exit()


console.log ":)"
