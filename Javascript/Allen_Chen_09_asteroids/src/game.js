const Util = require('./util.js');
const Asteroid = require ('./asteroid.js');
const Ship = require ('./ship.js');
const Bullet = require ('./bullet.js');

function Game() {
  this.asteroids = [];
  this.addAsteroids();
  this.ship = new Ship({pos: this.randomPosition(), game:this});
  this.bullets = [];
}

Game.BG_COLOR = 'black';
Game.DIM_X = 1000;
Game.DIM_Y = 600;
Game.NUM_ASTEROIDS = 10;
Game.img = new Image();
Game.img.src = '../dist/space2.jpg';

Game.prototype.add = function(obj) {
  if (obj instanceof Asteroid) {
    this.asteroids.push(obj);
  } else if (obj instanceof Bullet) {
    this.bullets.push(obj);
  }
}

Game.prototype.allObjects = function() {
  return this.asteroids.concat(this.ship).concat(this.bullets);
}

Game.prototype.randomPosition = function() {
  const x = Game.DIM_X * Math.random();
  const y = Game.DIM_Y * Math.random();
  return [x,y];
};

Game.prototype.addAsteroids = function() {
  while (this.asteroids.length < Game.NUM_ASTEROIDS) {
    const newPos = this.randomPosition();
    const newOpt = { pos: newPos, game: this };
    const ast = new Asteroid(newOpt);
    this.asteroids.push(ast);
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);

  ctx.fillStyle = Game.BG_COLOR;
  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);
  ctx.drawImage(Game.img, 0, 0, Game.DIM_X, Game.DIM_Y);
  // const img = new Image();
  // img.onload = function () {
  //   ctx.drawImage(img, 0, 0, Game.DIM_X, Game.DIM_Y);
  // };
  // img.src = '../dist/space2.jpg';

  this.allObjects().forEach((obj) => obj.draw(ctx));
};

Game.prototype.moveObjects = function(timeDelta) {
  this.allObjects().forEach(obj => {
    obj.move(timeDelta);
  });
};

Game.prototype.isOutOfBounds = function(pos) {
  const x = pos[0];
  const y = pos[1];
  return x < 0 || y < 0 || x > Game.DIM_X || y > Game.DIM_Y;
}

Game.prototype.wrap = function(pos) {
  const x = pos[0];
  const y = pos[1];
  return [(x+Game.DIM_X)%Game.DIM_X, (y+Game.DIM_Y)%Game.DIM_Y];
};

Game.prototype.checkCollisions = function() {
  this.allObjects().forEach((obj1, index1) => {
    this.allObjects().forEach((obj2, index2) => {
      if (obj1 != obj2) {
        if (obj1.isCollidedWith(obj2)) {
          obj1.collideWith(obj2);
        }
      }
    });
  });
};

Game.prototype.step = function(timeDelta) {
  this.moveObjects(timeDelta);
  this.checkCollisions();
};

Game.prototype.remove = function(obj) {
  if (obj instanceof Asteroid) {
    let index = this.asteroids.indexOf(obj);
    this.asteroids.splice(this.asteroids.indexOf(obj), 1);
  } else if (obj instanceof Bullet) {
    let index = this.bullets.indexOf(obj);
    this.bullets.splice(this.bullets.indexOf(obj), 1);
  }
};

module.exports = Game;
