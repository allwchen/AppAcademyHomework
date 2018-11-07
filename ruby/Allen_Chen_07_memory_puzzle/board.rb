require_relative "card"
require "byebug"

class Board
  attr_reader :size
  def initialize(size=4)
    @board = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def populate
    num_cards = @board.size * @board.size
    card_arr = []
    (0...num_cards).each { |num| card_arr << Card.new(num/2) }
    card_arr.shuffle!
    @board.each_with_index do |rowArr, row|
      rowArr.each_with_index do |colCard, col|
        @board[row][col] = card_arr[row * @board.size + col]
      end
    end
    return self
  end

  def render(from_str=0)
    puts "========================"
    @board.each do |rowArr|
      rowArr.each do |card|
        card.display
        print " "
      end
      puts
    end
    puts "========================"
  end

  def won?
    @board.each do |rowArr|
      rowArr.each do |card|
        if card.face_down
          return false
        end
      end
    end
    return true
  end

  def valid_pos?(pos)
    row, col = pos
    size = @board.length
    return false if row.nil? || col.nil?
    return false if row > size-1 || col > size-1 || row < 0 || col < 0
    return @board[row][col].face_down
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @board[row][col] = value
  end

  def hide(pos)
    self[pos].hide
  end

  def reveal(pos)
    # if revealed?(pos)
    #   puts "Already revealed."
    # else
      @board[pos].reveal
    # end
    self[pos].value
  end

  def revealed?(pos)
    self[pos].revealed?
  end

  def reveal(guessed_pos)
    row, col = guessed_pos
    card = @board[row][col]
    value = ""
    if card.face_down
      card.reveal
      value = card.value
    end
    value
  end

end
