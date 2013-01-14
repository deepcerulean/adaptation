# spec/adaptation_spec.coffee
FakeContext = require("./support/fake_context.coffee")

Game = require("../lib/game.coffee")


describe 'Adaptation', ->
  beforeEach ->
    @context = new FakeContext()
    @game = new Game(@context)

  it 'is awesome', ->
    expect(@game.awesome()).toBe(true)
