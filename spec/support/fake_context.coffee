class FakeContext
  constructor: () ->
  moveTo: (x,y) ->
    console.log("--- FakeContext#moveTo invoked with #{x},#{y}")
  lineTo: (x,y) ->
    console.log("--- FakeContext#lineTo invoked with #{x},#{y}")
  stroke: () ->
    console.log("--- FakeContext#stroke invoked")

module.exports = FakeContext # unless typeof module.exports is "undefined"