// console.log("webpack is working!");
const MovingObject = require ('./moving_object.js');
const Asteroid = require('./asteroid.js');
const Game = require('./game.js');
const GameView = require('./game_view.js');
const Util = require('./util.js');

document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('game-canvas');
  canvas.height = 600;
  canvas.width = 1000;
  let ctx = canvas.getContext('2d');

  let testing = 0;
  if (testing == 1) {
    test(ctx);
  }
  window.GameView = new GameView(ctx);
  window.GameView.start();

});

function test(ctx) {
  // rectangle
  ctx.fillStyle = 'blue';
  ctx.fillRect(360, 30, 200, 100);

  // circle
  ctx.beginPath();
  ctx.arc(320, 80, 30, 0, 2 * Math.PI);
  ctx.strokeStyle = 'purple';
  ctx.lineWidth = 10;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();


  let options = {
    pos: [30, 30],
    vel: [2,2],
    radius: 10,
    color: 'cyan',
  };
  window.MovingObject = new MovingObject(options);
  console.log(`${window.MovingObject.pos}`);
  console.log(`${window.MovingObject.vel}`);
  console.log(`${window.MovingObject.radius}`);
  console.log(`${window.MovingObject.color}`);

  window.MovingObject.draw(ctx);
  window.MovingObject.move();
  window.MovingObject.color = 'black';
  window.MovingObject.draw(ctx);

  window.Asteroid = new Asteroid({pos: [100, 100]});
  console.log(`${window.Asteroid.pos}`);
  console.log(`${window.Asteroid.vel}`);
  console.log(`${window.Asteroid.radius}`);
  console.log(`${window.Asteroid.color}`);

  window.Asteroid.draw(ctx);
  for (let i=0; i<10; i++) {
    window.Asteroid.move();
  }
  window.Asteroid.color = 'green';
  window.Asteroid.draw(ctx);

  window.Game = new Game();
  console.log(`${window.Game.asteroids}`);
  console.log(`${window.Game.asteroids[0]}`);
  console.log(`${JSON.stringify(window.Game.asteroids[0])}`);
  console.log(`${window.Game.asteroids[1].pos}`);
  console.log(`${window.Game.asteroids[2].pos}`);
  console.log(`${window.Game.asteroids[3].pos}`);
  console.log(`${window.Game.asteroids[4].pos}`);
  console.log(`${window.Game.asteroids[5].pos}`);
  console.log(`${window.Game.asteroids[6].pos}`);
  console.log(`${window.Game.asteroids[7].pos}`);
  console.log(`${window.Game.asteroids[8].pos}`);
  console.log(`${window.Game.asteroids[9].pos}`);

  console.log(`${window.Game.asteroids[0].draw(ctx)}`);
  console.log(`${window.Game.asteroids[1].draw(ctx)}`);
  console.log(`${window.Game.asteroids[2].draw(ctx)}`);
  console.log(`${window.Game.asteroids[3].draw(ctx)}`);
  console.log(`${window.Game.asteroids[4].draw(ctx)}`);
  console.log(`${window.Game.asteroids[5].draw(ctx)}`);
  console.log(`${window.Game.asteroids[6].draw(ctx)}`);
  console.log(`${window.Game.asteroids[7].draw(ctx)}`);
  console.log(`${window.Game.asteroids[8].draw(ctx)}`);
  console.log(`${window.Game.asteroids[9].draw(ctx)}`);
  window.Game.draw(ctx);
  window.Game.move();
  window.Game.draw(ctx);

  console.log(GameView);
  window.GameView = new GameView(ctx);
  window.GameView.start();

  let options1 = {
    pos: [30, 30],
    vel: [2,2],
    radius: 10,
    color: 'cyan',
  };
  window.MovingObject1 = new MovingObject(options1);
  let options2 = {
    pos: [50, 50],
    vel: [2,2],
    radius: 10,
    color: 'cyan',
  };
  window.MovingObject2 = new MovingObject(options2);
  console.log(window.MovingObject1.isCollidedWith(window.MovingObject2));
}
