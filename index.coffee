handler = (request, response) ->
    request.addListener "end", ->
    fileServer.serve request, response # this will return the correct file

app = require("http").createServer(handler)
static_ = require("node-static")
fileServer = new static_.Server("./public")

port = process.env.PORT || 8080
app.listen port
