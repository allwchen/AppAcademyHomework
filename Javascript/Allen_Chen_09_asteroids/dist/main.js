/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Ship = __webpack_require__ (/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__ (/*! ./bullet.js */ \"./src/bullet.js\");\n\nconst DEFAULTS = {\n  COLOR: '#8B4513',\n  RADIUS: 25,\n  SPEED: 3,\n};\n\nfunction Asteroid(options) {\n  options = options || {};\n  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);\n  options.radius = options.radius || DEFAULTS.RADIUS;\n  options.color = options.color || DEFAULTS.COLOR;\n  MovingObject.call(this, options);\n}\nUtil.inherits(Asteroid, MovingObject);\n\nAsteroid.prototype.collideWith = function(otherObject) {\n  if (otherObject instanceof Ship) {\n    otherObject.relocate();\n  } else if (otherObject instanceof Bullet) {\n    this.game.remove(otherObject);\n    this.game.remove(this);\n  }\n};\n\nmodule.exports = Asteroid;\n\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/bullet.js":
/*!***********************!*\
  !*** ./src/bullet.js ***!
  \***********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\n// const Asteroid = require ('./asteroid.js');\n\nconst DEFAULTS = {\n  COLOR: 'white',\n  RADIUS: 2,\n  SPEED: 10,\n};\n\nfunction Bullet(options) {\n  options = options ||{};\n  options.vel = Util.scale(options.vel, DEFAULTS.SPEED);\n  options.radius = DEFAULTS.RADIUS;\n  options.color = options.color || DEFAULTS.COLOR;\n  MovingObject.call(this, options);\n}\nUtil.inherits(Bullet, MovingObject);\n\nBullet.prototype.isWrappable = false;\n\nBullet.prototype.collideWith = function(otherObject) {\n};\n\nmodule.exports = Bullet;\n\n\n//# sourceURL=webpack:///./src/bullet.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst Asteroid = __webpack_require__ (/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Ship = __webpack_require__ (/*! ./ship.js */ \"./src/ship.js\");\nconst Bullet = __webpack_require__ (/*! ./bullet.js */ \"./src/bullet.js\");\n\nfunction Game() {\n  this.asteroids = [];\n  this.addAsteroids();\n  this.ship = new Ship({pos: this.randomPosition(), game:this});\n  this.bullets = [];\n}\n\nGame.BG_COLOR = 'black';\nGame.DIM_X = 1000;\nGame.DIM_Y = 600;\nGame.NUM_ASTEROIDS = 10;\nGame.img = new Image();\nGame.img.src = '../dist/space2.jpg';\n\nGame.prototype.add = function(obj) {\n  if (obj instanceof Asteroid) {\n    this.asteroids.push(obj);\n  } else if (obj instanceof Bullet) {\n    this.bullets.push(obj);\n  }\n}\n\nGame.prototype.allObjects = function() {\n  return this.asteroids.concat(this.ship).concat(this.bullets);\n}\n\nGame.prototype.randomPosition = function() {\n  const x = Game.DIM_X * Math.random();\n  const y = Game.DIM_Y * Math.random();\n  return [x,y];\n};\n\nGame.prototype.addAsteroids = function() {\n  while (this.asteroids.length < Game.NUM_ASTEROIDS) {\n    const newPos = this.randomPosition();\n    const newOpt = { pos: newPos, game: this };\n    const ast = new Asteroid(newOpt);\n    this.asteroids.push(ast);\n  }\n};\n\nGame.prototype.draw = function(ctx) {\n  ctx.clearRect(0, 0, Game.DIM_X, Game.DIM_Y);\n\n  ctx.fillStyle = Game.BG_COLOR;\n  ctx.fillRect(0, 0, Game.DIM_X, Game.DIM_Y);\n  ctx.drawImage(Game.img, 0, 0, Game.DIM_X, Game.DIM_Y);\n  // const img = new Image();\n  // img.onload = function () {\n  //   ctx.drawImage(img, 0, 0, Game.DIM_X, Game.DIM_Y);\n  // };\n  // img.src = '../dist/space2.jpg';\n\n  this.allObjects().forEach((obj) => obj.draw(ctx));\n};\n\nGame.prototype.moveObjects = function(timeDelta) {\n  this.allObjects().forEach(obj => {\n    obj.move(timeDelta);\n  });\n};\n\nGame.prototype.isOutOfBounds = function(pos) {\n  const x = pos[0];\n  const y = pos[1];\n  return x < 0 || y < 0 || x > Game.DIM_X || y > Game.DIM_Y;\n}\n\nGame.prototype.wrap = function(pos) {\n  const x = pos[0];\n  const y = pos[1];\n  return [(x+Game.DIM_X)%Game.DIM_X, (y+Game.DIM_Y)%Game.DIM_Y];\n};\n\nGame.prototype.checkCollisions = function() {\n  this.allObjects().forEach((obj1, index1) => {\n    this.allObjects().forEach((obj2, index2) => {\n      if (obj1 != obj2) {\n        if (obj1.isCollidedWith(obj2)) {\n          obj1.collideWith(obj2);\n        }\n      }\n    });\n  });\n};\n\nGame.prototype.step = function(timeDelta) {\n  this.moveObjects(timeDelta);\n  this.checkCollisions();\n};\n\nGame.prototype.remove = function(obj) {\n  if (obj instanceof Asteroid) {\n    let index = this.asteroids.indexOf(obj);\n    this.asteroids.splice(this.asteroids.indexOf(obj), 1);\n  } else if (obj instanceof Bullet) {\n    let index = this.bullets.indexOf(obj);\n    this.bullets.splice(this.bullets.indexOf(obj), 1);\n  }\n};\n\nmodule.exports = Game;\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__ (/*! ./game.js */ \"./src/game.js\");\n\nfunction GameView(ctx) {\n  this.game = new Game();\n  this.ctx = ctx;\n}\n\nGameView.prototype.start = function() {\n  this.bindKeyHandlers();\n  // setInterval(() => {\n  //   this.game.step();\n  //   this.game.draw(this.ctx);\n  // }, 20);\n  this.lastTime = 0;\n  requestAnimationFrame(this.animate.bind(this));\n};\n\nGameView.MOVES = {\n  w: [0, -1],\n  a: [-1, 0],\n  s: [0, 1],\n  d: [1, 0],\n};\n\nGameView.prototype.bindKeyHandlers = function bindKeyHandlers() {\n  const ship = this.game.ship;\n\n  Object.keys(GameView.MOVES).forEach(function(k)  {\n    const move = GameView.MOVES[k];\n    key(k, function () { ship.power(move); });\n  });\n\n  key(\"space\", function () { ship.fireBullet(); });\n};\n\nGameView.prototype.animate = function(time) {\n  const timeDelta = time - this.lastTime;\n\n  this.game.step(timeDelta);\n  this.game.draw(this.ctx);\n  this.lastTime = time;\n\n  requestAnimationFrame(this.animate.bind(this));\n};\n\nmodule.exports = GameView;\n\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// console.log(\"webpack is working!\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\");\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\");\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\ndocument.addEventListener(\"DOMContentLoaded\", function(){\n  let canvas = document.getElementById('game-canvas');\n  canvas.height = 600;\n  canvas.width = 1000;\n  let ctx = canvas.getContext('2d');\n\n  let testing = 0;\n  if (testing == 1) {\n    test(ctx);\n  }\n  window.GameView = new GameView(ctx);\n  window.GameView.start();\n\n});\n\nfunction test(ctx) {\n  // rectangle\n  ctx.fillStyle = 'blue';\n  ctx.fillRect(360, 30, 200, 100);\n\n  // circle\n  ctx.beginPath();\n  ctx.arc(320, 80, 30, 0, 2 * Math.PI);\n  ctx.strokeStyle = 'purple';\n  ctx.lineWidth = 10;\n  ctx.stroke();\n  ctx.fillStyle = 'yellow';\n  ctx.fill();\n\n\n  let options = {\n    pos: [30, 30],\n    vel: [2,2],\n    radius: 10,\n    color: 'cyan',\n  };\n  window.MovingObject = new MovingObject(options);\n  console.log(`${window.MovingObject.pos}`);\n  console.log(`${window.MovingObject.vel}`);\n  console.log(`${window.MovingObject.radius}`);\n  console.log(`${window.MovingObject.color}`);\n\n  window.MovingObject.draw(ctx);\n  window.MovingObject.move();\n  window.MovingObject.color = 'black';\n  window.MovingObject.draw(ctx);\n\n  window.Asteroid = new Asteroid({pos: [100, 100]});\n  console.log(`${window.Asteroid.pos}`);\n  console.log(`${window.Asteroid.vel}`);\n  console.log(`${window.Asteroid.radius}`);\n  console.log(`${window.Asteroid.color}`);\n\n  window.Asteroid.draw(ctx);\n  for (let i=0; i<10; i++) {\n    window.Asteroid.move();\n  }\n  window.Asteroid.color = 'green';\n  window.Asteroid.draw(ctx);\n\n  window.Game = new Game();\n  console.log(`${window.Game.asteroids}`);\n  console.log(`${window.Game.asteroids[0]}`);\n  console.log(`${JSON.stringify(window.Game.asteroids[0])}`);\n  console.log(`${window.Game.asteroids[1].pos}`);\n  console.log(`${window.Game.asteroids[2].pos}`);\n  console.log(`${window.Game.asteroids[3].pos}`);\n  console.log(`${window.Game.asteroids[4].pos}`);\n  console.log(`${window.Game.asteroids[5].pos}`);\n  console.log(`${window.Game.asteroids[6].pos}`);\n  console.log(`${window.Game.asteroids[7].pos}`);\n  console.log(`${window.Game.asteroids[8].pos}`);\n  console.log(`${window.Game.asteroids[9].pos}`);\n\n  console.log(`${window.Game.asteroids[0].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[1].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[2].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[3].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[4].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[5].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[6].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[7].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[8].draw(ctx)}`);\n  console.log(`${window.Game.asteroids[9].draw(ctx)}`);\n  window.Game.draw(ctx);\n  window.Game.move();\n  window.Game.draw(ctx);\n\n  console.log(GameView);\n  window.GameView = new GameView(ctx);\n  window.GameView.start();\n\n  let options1 = {\n    pos: [30, 30],\n    vel: [2,2],\n    radius: 10,\n    color: 'cyan',\n  };\n  window.MovingObject1 = new MovingObject(options1);\n  let options2 = {\n    pos: [50, 50],\n    vel: [2,2],\n    radius: 10,\n    color: 'cyan',\n  };\n  window.MovingObject2 = new MovingObject(options2);\n  console.log(window.MovingObject1.isCollidedWith(window.MovingObject2));\n}\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\n\nfunction MovingObject(options) {\n  this.pos = options.pos;\n  this.vel = options.vel;\n  this.radius = options.radius;\n  this.color = options.color;\n  this.game = options.game;\n}\n\nMovingObject.prototype.isWrappable = true;\n\nMovingObject.prototype.draw = function (ctx) {\n  ctx.beginPath();\n  ctx.arc(...this.pos, this.radius, 0, 2 * Math.PI);\n  // ctx.strokeStyle = this.color;\n  // ctx.lineWidth = 10;\n  // ctx.stroke();\n  ctx.fillStyle = this.color;\n  ctx.fill();\n};\n\nMovingObject.prototype.move = function(timeDelta) {\n  this.pos[0] += this.vel[0] * timeDelta/20;\n  this.pos[1] += this.vel[1] * timeDelta/20;\n  if (this.game.isOutOfBounds(this.pos)) {\n    if (this.isWrappable) {\n      this.pos = this.game.wrap(this.pos);\n    } else {\n      this.game.remove(this);\n    }\n  }\n};\n\nMovingObject.prototype.isCollidedWith = function(otherObject) {\n  const distance = Util.distance(this.pos, otherObject.pos);\n  return distance < (this.radius + otherObject.radius);\n};\n\nMovingObject.prototype.collideWith = function(otherObject) {\n  // this.game.remove(otherObject);\n  // this.game.remove(this);\n};\n\nmodule.exports = MovingObject;\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/ship.js":
/*!*********************!*\
  !*** ./src/ship.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\");\nconst MovingObject = __webpack_require__ (/*! ./moving_object.js */ \"./src/moving_object.js\");\nconst Bullet = __webpack_require__ (/*! ./bullet.js */ \"./src/bullet.js\");\n\nconst DEFAULTS = {\n  COLOR: 'silver',\n  RADIUS: 15,\n  SPEED: 0,\n};\n\nfunction randomColor() {\n  const hexDigits = \"0123456789ABCDEF\";\n\n  let color = \"#\";\n  for (let i = 0; i < 3; i++) {\n    color += hexDigits[Math.floor((Math.random() * 16))];\n  }\n\n  return color;\n}\n\nfunction Ship(options) {\n  options = options ||{};\n  options.vel = options.vel || Util.randomVec(DEFAULTS.SPEED);\n  options.radius = options.radius || DEFAULTS.RADIUS;\n  options.color = options.color || DEFAULTS.COLOR; // randomColor();\n  MovingObject.call(this, options);\n}\nUtil.inherits(Ship, MovingObject);\n\nShip.prototype.relocate = function() {\n  this.pos = this.game.randomPosition();\n  this.vel = [0,0];\n  // this.color = randomColor();\n};\n\nShip.prototype.power = function(impulse) {\n  this.vel[0] += impulse[0];\n  this.vel[1] += impulse[1];\n};\n\nShip.prototype.fireBullet = function() {\n  if (this.vel[0] !== 0 || this.vel[1] !== 0) {\n    const b = new Bullet({\n      pos: this.pos.slice(),\n      vel: this.vel.slice(),\n      game: this.game,\n    });\n    this.game.bullets.push(b);\n  }\n};\n\nmodule.exports = Ship;\n\n\n//# sourceURL=webpack:///./src/ship.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("const Util = {\n  inherits(childClass, parentClass) {\n    childClass.prototype = Object.create(parentClass.prototype);\n    childClass.prototype.constructor = childClass;\n  },\n\n  // Return a randomly oriented vector with the given length.\n  randomVec(length) {\n    const deg = 2 * Math.PI * Math.random();\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n  },\n\n  // Scale the length of a vector by the given amount.\n  scale(vec, m) {\n    return [vec[0] * m, vec[1] * m];\n  },\n\n  distance(pos1, pos2) {\n    const x_1 = pos1[0];\n    const y_1 = pos1[1];\n    const x_2 = pos2[0];\n    const y_2 = pos2[1];\n    return Math.sqrt((x_1 - x_2) ** 2 + (y_1 - y_2) ** 2);\n  },\n}\n\nmodule.exports = Util;\n\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });