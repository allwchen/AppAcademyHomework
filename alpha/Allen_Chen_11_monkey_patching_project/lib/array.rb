require "byebug"
# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    return self.max - self.min
  end

  def average
    return nil if self.empty?
    return self.sum * 1.0 / self.length
  end

  def median
    return nil if self.empty?
    sorted_arr = self.sort
    mid = self.length/2;
    if self.length.odd?
      return sorted_arr[mid]
    else
      return (sorted_arr[mid-1] + sorted_arr[mid]) / 2.0
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |el| hash[el] += 1 }
    return hash
  end

  def my_count(value)
    self.select{|el| el==value}.count
  end

  def my_index(value)
    self.each_with_index{|el, idx| return idx if el==value}
    return nil
  end

  def my_uniq
    hash = Hash.new()
    self.each{|el| hash[el] = true}
    hash.keys
  end

  def my_transpose
    new_arr = []
    self.each_with_index do |arr, idx1|
      new_row = []
      arr.each_with_index do |el, idx2|
        new_row << self[idx2][idx1]
      end
      new_arr << new_row
    end
    return new_arr
  end
end
