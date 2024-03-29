// Generated by CoffeeScript 1.5.0-pre
var Game, Viewport, module,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

module = {};

Viewport = (function() {

  function Viewport(context) {
    this.context = context;
  }

  Viewport.prototype.awesome = function() {
    return true;
  };

  Viewport.prototype.drawLine = function(x0, y0, x1, y1) {
    this.context.moveTo(x0, y0);
    this.context.lineTo(x1, y1);
    return this.context.stroke();
  };

  Viewport.prototype.drawGrid = function(width, height, cell_size) {
    var x, y, _i, _results;
    console.log("Viewport#drawGrid called");
    console.log("--- drawing a " + width + "x" + height + " grid with cell size " + cell_size);
    _results = [];
    for (x = _i = 0; 0 <= width ? _i <= width : _i >= width; x = _i += cell_size) {
      _results.push((function() {
        var _j, _results1;
        _results1 = [];
        for (y = _j = 0; 0 <= height ? _j <= height : _j >= height; y = _j += cell_size) {
          this.drawLine(x, 0, x, height);
          _results1.push(this.drawLine(0, y, width, y));
        }
        return _results1;
      }).call(this));
    }
    return _results;
  };

  return Viewport;

})();

if (typeof module.exports !== "undefined") {
  module.exports = Viewport;
}

if (typeof require === 'function') {
  Viewport = require("../lib/viewport.coffee");
}

Game = (function(_super) {

  __extends(Game, _super);

  function Game() {
    return Game.__super__.constructor.apply(this, arguments);
  }

  Game.prototype.play = function() {
    return this.drawGrid(500, 500, 50);
  };

  return Game;

})(Viewport);

if (typeof module.exports !== "undefined") {
  module.exports = Game;
}

$(function() {
  var canvas, context, game;
  canvas = $("#adaptation-viewport");
  context = canvas[0].getContext("2d");
  game = new Game(context);
  return game.play();
});
