net = require "./net"

net.app.get '/user', exports.get = (req,res) ->
  exports.get req,res

exports.get = (req,res) ->
  user = new User 1,'abc-def-ghi'
  res.write JSON.stringify user
  res.end ""

exports.class = class User
  constructor: (@id, @token) ->
