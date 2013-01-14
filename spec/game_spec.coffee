# spec/adaptation_spec.coffee

Game = require("../lib/game.coffee")

class FakeContext
  constructor: () ->
  moveTo: (x,y) ->
    console.log("--- FakeContext#moveTo invoked with #{x},#{y}")
  lineTo: (x,y) ->
    console.log("--- FakeContext#lineTo invoked with #{x},#{y}")
  stroke: () ->
    console.log("--- FakeContext#stroke invoked")

describe 'Adaptation', ->
  beforeEach ->
    @context = new FakeContext()
#    spyOn(@mock_context, 'lineTo')
#    spyOn(@mock_context, 'moveTo')

    @game = new Game(@context)

  it 'is awesome', ->
    expect(@game.awesome()).toBe(true)

#  it 'draws a line', ->
#    @adaptation.drawLine(0,0,1,1)
#    expect(@mock_context.moveTo).toHaveBeenCalledWith(0,0);
#    expect(@mock_context.lineTo).toHaveBeenCalledWith(1,1);

#  it 'draws a grid', ->
#    expect(false).toBeTruthy()
