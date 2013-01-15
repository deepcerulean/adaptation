#
# gui primitives (canvas wrapper)
#
class Viewport

  # a viewport needs the 2-d context of a canvas element
  constructor: (context) ->
    @context = context

  # hello! (no-op for testing purposes)
  awesome: ->
    true

#  # draw a line on the active canvas context
  drawLine: (x0,y0,x1,y1) ->
    @context.moveTo(x0,y0)
    @context.lineTo(x1,y1)
    @context.stroke()

  # draw lines forming a grid
  drawGrid: (width, height, cell_size) ->
    console.log("Viewport#drawGrid called")
    console.log("--- drawing a #{width}x#{height} grid with cell size #{cell_size}")
    for x in [0..width] by cell_size
      for y in [0..height] by cell_size
        this.drawLine(x,0,x,height)
        this.drawLine(0,y,width,y)
#
#adaptation = module.exports ? this
module.exports = Viewport unless typeof module.exports is "undefined"