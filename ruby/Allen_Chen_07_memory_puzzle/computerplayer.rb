require "byebug"

class ComputerPlayer
  attr_reader :name
  attr_accessor :previous_guess
  def initialize(game_size)
    @name = "Computer"
    @game_size = game_size
    @known_cards = {}
    @matched_cards = {}
    @previous_guess = nil
  end

  def get_input(message="")
    puts message if !message.empty?
    prompt
    if @previous_guess.nil? #first guess
      guess = first_guess
    else
      guess = second_guess
    end
    print guess
    puts
    guess
  end

  def first_guess
    unmatched_pos || random_guess
  end

  def second_guess
    match_previous || random_guess
  end

  def unmatched_pos
    (pos, _) = @known_cards.find do |pos, val|
      @known_cards.any? do |pos2, val2|
        (pos != pos2 && val == val2) && #different positions
        !(@matched_cards[pos] || @matched_cards[pos2]) # not already matched
      end
    end
    pos
  end

  def match_previous
    (pos, _) = @known_cards.find do |pos, val|
      pos != @previous_guess && val == @known_cards[@previous_guess] && !@matched_cards[pos]
    end
    pos
  end

  def random_guess
    guess = nil
    until guess && !@known_cards[guess]
      guess = [rand(@game_size), rand(@game_size)]
    end
    guess
  end

  def prompt
    print "#{@name.capitalize}: Computer player guessing:"
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards[pos1] = true
    @matched_cards[pos2] = true
  end
end
