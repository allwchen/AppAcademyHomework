require_relative "card"
require_relative "board"
require_relative "humanplayer"
require_relative "computerplayer"

class Game
  def initialize (size=4)
    @board = Board.new(size)
    @previous_guess = nil
    @player = ComputerPlayer.new(@board.size)
  end

  def get_player_input
    pos = nil
    until pos && @board.valid_pos?(pos)
      pos = @player.get_input()
    end
    pos
  end

  def play
    while !@board.won?
      @board.render()
      pos = get_player_input
      make_guess(pos)
    end
    puts "Congratulations, you are done!"
  end

  def make_guess(pos)
    value = @board.reveal(pos)
    @player.receive_revealed_card(pos, value)
    @board.render

    compare_guess(pos)
    sleep(1)
    @board.render
  end

  def match?(pos1, pos2)
    pos1 != pos2 && @board[pos1] == @board[pos2]
  end

  def compare_guess(pos)
    if @previous_guess.nil?
      @previous_guess = pos
      @player.previous_guess = pos
    else
      if match?(@previous_guess, pos)
        @player.receive_match(@previous_guess, pos)
        puts "good guess!"
        sleep(2)
      else
        sleep(3)
        puts "try again"
        # system("clear")

        @board.hide(@previous_guess)
        @board.hide(pos)
      end
      @previous_guess = nil
      @player.previous_guess = nil
    end
  end

end
