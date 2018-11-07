require "set"
require_relative "player"
require_relative "aiplayer"
require "byebug"

class GhostGame
  ALPHABET = Set.new("a".."z")
  MAX_LOSS_COUNT = 5
  GHOST = "GHOST"

  def initialize(*args)
    @players = args
    @fragment = ""
    @dictionary = Hash.new(0)
    File.open("dictionary.txt").each_line { |line| @dictionary[line.chomp] += 1 }
    @losses = Hash.new{ |losses, player| losses[player] = 0 }
  end

  def run
    welcome
    game_is_over = false
    until game_is_over == true
      puts "Let's play another round!"
      game_is_over = play_round
      puts "====================================="
      display_standings
      puts "====================================="
    end
    puts "#{winner} is the winner!!"
  end

  private
  attr_reader :fragment, :dictionary, :losses, :players

  def game_over?
    remaining_players.length == 1
  end

  def play_round
    round_is_over = false
    until round_is_over == true
      puts "--------------------------------------------------"
      round_is_over = take_turn
      break if round_is_over
      next_player!
    end
    puts "Sorry, #{current_player}. #{@fragment.capitalize} is a word."
    update_standings
    @fragment = ""
    return game_over?
  end

  # helper methods
  def add_letter(letter)
    fragment << letter
  end

  def valid_play?(letter)
    if ALPHABET.include?(letter) == false
      return false
    end
    # can lead to a word
    if dictionary.keys.any? { |word| word.start_with?(@fragment + letter)}
      return true
    end
    return false
  end

  def is_word?(fragment)
    dictionary[fragment] == 1
  end

  def round_over?
    is_word?(@fragment)
  end

  def current_player
    @players.first
  end

  def previous_player
    @players.last
  end

  def next_player!
    @players.push(@players.shift)
  end

  def remaining_players
    @players.map { |player| player.name }
  end

  def winner
    @players.first
  end

  def record(player)
    num_losses = @losses[player]
    if num_losses == 0
      return "<nothing>"
    else
      return GHOST[0...num_losses]
    end
  end

  # UI methods (display game status and prompts to players)
  def welcome
    puts "Welcome to GHOST, #{remaining_players}!"
  end

  def take_turn
    puts "It is #{current_player}'s move"
    letter = current_player.guess(@fragment).downcase
    while !valid_play?(letter)
      current_player.alert_invalid_move(letter)
      letter = current_player.guess(@fragment).downcase
    end
    add_letter(letter)
    return round_over?
  end

  def display_standings
    puts "CURRENT STANDINGS"
    puts "Remaining players: " + remaining_players.join(", ")
    puts
    @players.each do |player|
      puts "#{player.name}: #{record(player)}"
    end
  end

  def update_standings
    @losses[current_player] += 1
    if @losses[current_player] == GHOST.length
      loser = @players.shift
      puts "Sorry, #{loser.name} is out"
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  game = GhostGame.new(Player.new("Gizmo"), Player.new("Breakfast"), Player.new("Dinner"))
  game.run
end
