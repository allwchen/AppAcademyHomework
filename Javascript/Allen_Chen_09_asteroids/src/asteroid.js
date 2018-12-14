const Util = require('./util.js');
const MovingObject = require ('./moving_object.js');
const Ship = require ('./ship.js');
const Bullet = require ('./bullet.js');

const DEFAULTS = {
  COLOR: '#8B4513',
  RADIUS: 25,
  SPEED: 3,
};

function Asteroid(options) {
  options = options || {};
  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);
  options.radius = options.radius || DEFAULTS.RADIUS;
  options.color = options.color || DEFAULTS.COLOR;
  MovingObject.call(this, options);
}
Util.inherits(Asteroid, MovingObject);

Asteroid.prototype.collideWith = function(otherObject) {
  if (otherObject instanceof Ship) {
    otherObject.relocate();
  } else if (otherObject instanceof Bullet) {
    this.game.remove(otherObject);
    this.game.remove(this);
  }
};

module.exports = Asteroid;
