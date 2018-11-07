require "byebug"
class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map { |peg| peg.upcase }
    else
      raise "Could not create code; invalid pegs"
    end
  end

  def self.random(length)
    random_pegs = []
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code.new(string.chars)
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(code)
    matches = 0
    (0...code.length).each { |index| matches += 1 if pegs[index] == code[index] }
    return matches
  end

  def num_near_matches(code)
    count_color_matches = 0
    my_colors = get_colors(self.pegs)
    other_colors = get_colors(code.pegs)
    # debugger
    other_colors.each do |color, count|
      if count != 0 && my_colors[color] != 0
        if count < my_colors[color]
           count_color_matches += count
         else
           count_color_matches += my_colors[color]
         end
      end
    end
    return count_color_matches - num_exact_matches(code)
  end

  def get_colors(arr)
    hash = Hash.new(0)
    arr.each {|ch| hash[ch] += 1}
    return hash
  end

  def ==(code)
    pegs == code.pegs
  end

end
