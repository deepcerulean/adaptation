# spec/viewport_spec.coffee

Viewport = require("../lib/viewport.coffee")

class FakeContext
  constructor: () ->
#    console.log('*** new FakeContext created')
  moveTo: (x,y) ->
    console.log("--- FakeContext#moveTo invoked with #{x},#{y}")
  lineTo: (x,y) ->
    console.log("--- FakeContext#lineTo invoked with #{x},#{y}")
  stroke: () ->
    console.log("--- FakeContext#stroke invoked")

describe 'Viewport', ->
  beforeEach ->
    @mock_context = new FakeContext()
    @viewport = new Viewport(@mock_context)
    spyOn(@mock_context, 'lineTo')
    spyOn(@mock_context, 'moveTo')
    spyOn(@mock_context, 'stroke')

  it 'is awesome', ->
    expect(@viewport.awesome()).toBe(true)

  describe 'drawing lines', ->
    beforeEach ->
#      console.log(@viewport.context)
      @viewport.drawLine(0,0,1,1)

    it 'moves to the line origin', ->
      expect(@mock_context.moveTo).toHaveBeenCalledWith 0,0

    it 'draws a line to the destination', ->
      expect(@mock_context.lineTo).toHaveBeenCalledWith 1,1

    it 'calls stroke on the context', ->
      expect(@mock_context.stroke).toHaveBeenCalled

#  it 'draws a grid', ->
#    expect(false).toBeTruthy()
