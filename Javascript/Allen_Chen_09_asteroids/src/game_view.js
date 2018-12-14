const Game = require ('./game.js');

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  this.bindKeyHandlers();
  // setInterval(() => {
  //   this.game.step();
  //   this.game.draw(this.ctx);
  // }, 20);
  this.lastTime = 0;
  requestAnimationFrame(this.animate.bind(this));
};

GameView.MOVES = {
  w: [0, -1],
  a: [-1, 0],
  s: [0, 1],
  d: [1, 0],
};

GameView.prototype.bindKeyHandlers = function bindKeyHandlers() {
  const ship = this.game.ship;

  Object.keys(GameView.MOVES).forEach(function(k)  {
    const move = GameView.MOVES[k];
    key(k, function () { ship.power(move); });
  });

  key("space", function () { ship.fireBullet(); });
};

GameView.prototype.animate = function(time) {
  const timeDelta = time - this.lastTime;

  this.game.step(timeDelta);
  this.game.draw(this.ctx);
  this.lastTime = time;

  requestAnimationFrame(this.animate.bind(this));
};

module.exports = GameView;
