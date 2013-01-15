# spec/viewport_spec.coffee
FakeContext = require("./support/fake_context.coffee")

Viewport = require("../lib/viewport.coffee")

describe 'a Viewport', ->
  beforeEach ->
    @mock_context = new FakeContext()
    @viewport = new Viewport(@mock_context)
    spyOn(@mock_context, 'lineTo')
    spyOn(@mock_context, 'moveTo')
    spyOn(@mock_context, 'stroke')

  it 'is awesome', ->
    expect(@viewport.awesome()).toBe(true)

  describe 'when drawing lines', ->
    beforeEach ->
      @viewport.drawLine(0,0,1,1)

    it 'first moves to the line origin', ->
      expect(@mock_context.moveTo).toHaveBeenCalledWith 0,0
    it 'and then draws a line to the destination', ->
      expect(@mock_context.lineTo).toHaveBeenCalledWith 1,1
    it 'and then calls stroke on the context', ->
      expect(@mock_context.stroke).toHaveBeenCalled

  describe 'when drawing grids', ->
    describe 'when drawing a 1x1 grid at the origin', ->
      it 'moves to origin', ->
        @viewport.drawGrid(1,1,1)
        expect(@mock_context.moveTo).toHaveBeenCalledWith(0,0)

      # technically, we could get away with four in this case
      # but we draw two lines per (x,y) coordinate, so 8
      it 'and draws 8 lines', ->
        spyOn(@viewport, 'drawLine')
        @viewport.drawGrid(1,1,1)
        expect(@viewport.drawLine.callCount).toBe(8)