Viewport = require("../lib/viewport.coffee") if typeof require == 'function'

class Game extends Viewport
  play: () ->
    this.drawGrid(500,500,50)

module.exports = Game unless typeof module.exports is "undefined"