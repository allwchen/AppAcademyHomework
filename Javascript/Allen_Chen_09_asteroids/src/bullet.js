const Util = require('./util.js');
const MovingObject = require ('./moving_object.js');
// const Asteroid = require ('./asteroid.js');

const DEFAULTS = {
  COLOR: 'white',
  RADIUS: 2,
  SPEED: 10,
};

function Bullet(options) {
  options = options ||{};
  options.vel = Util.scale(options.vel, DEFAULTS.SPEED);
  options.radius = DEFAULTS.RADIUS;
  options.color = options.color || DEFAULTS.COLOR;
  MovingObject.call(this, options);
}
Util.inherits(Bullet, MovingObject);

Bullet.prototype.isWrappable = false;

Bullet.prototype.collideWith = function(otherObject) {
};

module.exports = Bullet;
