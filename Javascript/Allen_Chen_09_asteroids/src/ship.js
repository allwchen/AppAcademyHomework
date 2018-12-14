const Util = require('./util.js');
const MovingObject = require ('./moving_object.js');
const Bullet = require ('./bullet.js');

const DEFAULTS = {
  COLOR: 'silver',
  RADIUS: 15,
  SPEED: 0,
};

function randomColor() {
  const hexDigits = "0123456789ABCDEF";

  let color = "#";
  for (let i = 0; i < 3; i++) {
    color += hexDigits[Math.floor((Math.random() * 16))];
  }

  return color;
}

function Ship(options) {
  options = options ||{};
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
  options.radius = options.radius || DEFAULTS.RADIUS;
  options.color = options.color || DEFAULTS.COLOR; // randomColor();
  MovingObject.call(this, options);
}
Util.inherits(Ship, MovingObject);

Ship.prototype.relocate = function() {
  this.pos = this.game.randomPosition();
  this.vel = [0,0];
  // this.color = randomColor();
};

Ship.prototype.power = function(impulse) {
  this.vel[0] += impulse[0];
  this.vel[1] += impulse[1];
};

Ship.prototype.fireBullet = function() {
  if (this.vel[0] !== 0 || this.vel[1] !== 0) {
    const b = new Bullet({
      pos: this.pos.slice(),
      vel: this.vel.slice(),
      game: this.game,
    });
    this.game.bullets.push(b);
  }
};

module.exports = Ship;
