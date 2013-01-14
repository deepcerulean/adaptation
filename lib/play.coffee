$ ->
  canvas  = $("#adaptation-viewport")
  context = canvas[0].getContext("2d")
  game    = new Game(context)

  game.play()