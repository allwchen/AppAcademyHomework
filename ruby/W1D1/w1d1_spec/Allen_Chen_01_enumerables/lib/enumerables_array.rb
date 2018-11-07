require "byebug"

class Array
  def my_each (&blk)
    self.length.times { |i| blk.call(self[i]) }
    return self
  end

  def my_select (&blk)
    new_arr = []
    self.length.times { |i| new_arr << self[i] if blk.call(self[i]) }
    return new_arr
  end

  def my_reject (&blk)
    new_arr = []
    self.length.times { |i| new_arr << self[i] unless blk.call(self[i]) }
    return new_arr
  end

  def my_any?(&blk)
    new_arr = []
    self.length.times do |i|
      if blk.call(self[i])
        return true
      end
    end
    return false
  end

  def my_all?(&blk)
    new_arr = []
    self.length.times do |i|
      if blk.call(self[i]) == false
        return false
      end
    end
    return true
  end

  def my_flatten
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr += el.my_flatten
      else
        new_arr << el
      end
    end
    return new_arr
  end

  def my_zip(*args)
    new_arr = []
    self.each_with_index do |el, idx|
      row = [el]
      args.each { |subarray| row << subarray[idx] }
      new_arr << row
    end
    return new_arr
  end

  def my_rotate(count=1)
    rotation_idx = count % self.length
    self.drop(rotation_idx) + self.take(rotation_idx)
    # new_arr = []
    # (0...length).each do |idx|
    #   new_idx = (idx - num_rotations)%length
    #   new_arr[new_idx] = self[idx]
    # end
    # return new_arr
  end

  def my_join(sep="")
    new_str = ""
    self.each_with_index do |el, idx|
      new_str += el
      if idx != self.length-1
        new_str += sep
      end
    end
    return new_str
  end

  def my_map(&blk)
    arr = []
    self.each { |el| arr << blk.call(el) }
    return arr
  end

  def my_inject(acc=omitted=true, &blk)
    if omitted == true
      start = 1
      acc = self[0]
    else
      start = 0
    end
    (start...self.length).each do |idx|
      acc = blk.call(acc, self[idx])
    end
    return acc
  end

  def my_reverse
    new_arr = []
    (self.length-1).downto(0) { |idx| new_arr << self[idx] }
    return new_arr
  end

  def bubble_sort!(&blk)
    no_more_changes = false

    # debugger
    while no_more_changes == false
      no_more_changes = true
      self.each_with_index do |el, idx|
        if idx+1 < self.length
          if block_given?
            if blk.call(el, self[idx+1]) > 0
              self[idx], self[idx+1] = self[idx+1], self[idx]
              no_more_changes = false
            end
          elsif el > self[idx+1]
            self[idx], self[idx+1] = self[idx+1], self[idx]
            no_more_changes = false
          end
        end
      end
    end

    return self
  end

  def bubble_sort(&blk)
    arr = self.dup
    arr.bubble_sort!(&blk)
    return arr
  end
end

def factors(num)
  arr = []
  (1..num).each { |divisor| arr << divisor if num%divisor==0 }
  return arr
end

def substrings(word)
  arr = []
  word.chars.each_with_index do |ch, idx|
    arr << ch
    (idx+1..word.length-1).each_with_index do |num, char_count|
      substring = word[idx..idx+char_count]
      arr << substring
    end
  end
  return arr.uniq
end

def subwords(str, dictionary)
  found = []
  dictionary.each { |dict_word| found << dict_word if str.include?(dict_word) }
  return found
end

def doubler(array)
  array.map { |num| num*2 }
end

def concatenate(array)
  str = array.inject("", :+)
  return str
end
