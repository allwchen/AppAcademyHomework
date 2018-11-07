class Board
  attr_reader :size

  def self.print_grid(board)
    board.each { |row| puts row.join(" ") }
  end

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    # n.times { @grid << Array.new(n, :N) }
    @size = n*n
  end

  def [](ind_arr)
    row, col = ind_arr
    @grid[row][col]
  end

  def []=(ind_arr, value)
    row, col = ind_arr
    @grid[row][col] = value
  end

  def num_ships
    # count = 0
    # @grid.each { |arr| count += arr.count(:S) }
    @grid.flatten.count{ |el| el==:S}
    # return count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "You sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    total_ships = @size/4
    n = @grid.length
    while self.num_ships < total_ships do
      i=rand(0...n)
      j=rand(0...n)
      self[[i,j]] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map { |el| (el==:S ? :N : el) }
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end

end
