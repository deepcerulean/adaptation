handler = (request, response) ->
    request.addListener "end", ->
    fileServer.serve request, response # this will return the correct file

app = require("http").createServer(handler)
static_ = require("node-static")
fileServer = new static_.Server("./public")
app.listen 8080
