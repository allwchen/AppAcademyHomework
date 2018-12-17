class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    $el.append(this.setupBoard());
    this.bindEvents();
  }

  bindEvents() {
    $("li").on("click", (event) => {
      this.makeMove($(event.currentTarget));
    });
  }

  makeMove($square) {
    const pos_str = $square.attr('data-pos');
    const pos = pos_str.split(",").map(el => parseInt(el));
    const currentPlayer = this.game.currentPlayer;
    try {
      this.game.playMove(pos);
    } catch (error) {
      alert("Invalid move! Please try again.");
      return;
    }
    try {
      this.markSquare(pos, currentPlayer);
    } catch (error) {
      console.log(error);
    }
    if (this.game.isOver()) {
      const winner = this.game.winner();
      this.declareWinner(winner);
      this.markWinner(winner);
    }
  }

  declareWinner(winner) {
    let caption;
    if (winner) {
      caption = $("<p>You win, " + winner+ "!</p>");
    } else {
      caption = $("<p>It's a draw.</p>");
    }
    $("ul").append(caption);
  }

  otherSymbol(symbol) {
    return symbol === "x" ? "o" : "x";
  }

  markWinner(symbol) {
    $("li").removeAttr("style");
    $("li").not(`.${symbol}`).addClass("done");
    $(`.${symbol}`).addClass("winner");
    $("li").off();
  }

  markSquare(pos, symbol) {
    const $square = $(`[data-pos='${pos.toString()}']`);
    $square.text(symbol);
    $square.addClass(symbol);
  }

  setupBoard() {
    const $ul = $("<ul></ul");
    $ul.attr('display', 'flex');

    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $li=$("<li></li>");
        $li.attr('data-pos', `${row},${col}`);

        $li.on("mouseover", (event) => {
          $(event.currentTarget).css('background-color', 'yellow');
        });
        $li.on("mouseout", (event) => {
          $(event.currentTarget).css('background-color', 'gray');
        });
        $ul.append($li);
      }
    }

    return $ul;
  }
}

module.exports = View;
