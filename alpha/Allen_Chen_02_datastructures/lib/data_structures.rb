# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  # your code goes here
  # min_num = 100000
  # max_num = -100000
  # arr.each do |num|
  #   if num<min_num
  #     min_num = num
  #   end
  #   if num>max_num
  #     max_num = num
  #   end
  # end
  # # p "max is " + max_num.to_s
  # # p "min is " + min_num.to_s
  # return max_num - min_num
  return arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  # your code goes here
  sorted_arr = arr.sort
  # arr.each_with_index do |ele, i|
  #   if ele != sorted_arr[i]
  #     return false
  #   end
  # end
  # return true
  sorted_arr == arr
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  # your code goes here
  count=0
  vowels = "aeiouAEIOU"
  str.each_char do |char|
    if vowels.include?(char)
      count += 1
    end
  end
  return count
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
  # your code goes here
  str_arr = str.split.map { |word| devowel_word(word) }
  str_arr.join(" ")
end
def devowel_word(word)
  vowels = "aeiouAEIOU"
  str_arr = word.split("").map do |char|
    if vowels.include?(char)
      char=""
    else
      char
    end
  end
  str_arr.join("")
end
# puts "devowel_word I: " + devowel_word("I")
# puts "devowel_word have: " + devowel_word("have")
# puts "devowel_word vowels: " + devowel_word("vowels")


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  # your code goes here
  # puts "int is " + int.to_s
  int.to_s.split("").sort.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
  # your code goes here
  hash = Hash.new(0)
  str.split("").map { |char| hash[char.downcase] += 1 }
  hash.each_value do |v|
    if v >= 2
      return true
    end
  end
  return false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  # your code goes here
  phone_arr = []
  arr.each_with_index do |n, i|
    if i==0
      phone_arr << "("
      phone_arr << n
    elsif i==2
      phone_arr << n
      phone_arr << ") "
    elsif i==5
      phone_arr << n
      phone_arr << "-"
    else
      phone_arr << n
    end
  end
  phone_arr.join("")
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  # your code goes here
  # print str.split(",").map{ |n| n.to_i}
  range(str.split(",").map{ |n| n.to_i})
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  arr.drop(offset%arr.length) + arr.take(offset%arr.length)
end
