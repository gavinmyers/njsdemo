redis = require "redis"

net = require "./src/net"
user = require "./src/user"

net.app.get '/', (req, res) -> 
  res.write "UTrain v 2.0"
  res.end ""
