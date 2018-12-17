const View = require ('./ttt-view.js');// require appropriate file
const Game = require ('../TicTacToe_Node_solution/game.js'); // require appropriate file

  $(() => {
    // Your code here
    const game = new Game();
    const $ttt = $(".ttt");
    new View(game, $ttt);
  });
