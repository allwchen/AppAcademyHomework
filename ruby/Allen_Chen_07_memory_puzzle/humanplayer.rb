class HumanPlayer
  attr_reader :name
  attr_accessor :previous_guess
  def initialize(name="")
    @name = name
    @previous_guess
  end

  def get_input(message="")
    puts message if !message.empty?
    prompt
    pos = gets.chomp.split.map(&:to_i)
    return pos
  end

  def prompt
    print "#{@name.capitalize}: guess a row & column (e.g. 3 4):"
  end

  def receive_revealed_card(pos, value)
  end

  def receive_match(pos1, pos2)
  end
end
