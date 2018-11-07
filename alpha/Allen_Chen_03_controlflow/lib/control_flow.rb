# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
   str.delete("abcdefghijklmnopqrstuvwxyz")
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
  mid = str.length/2
  if str.length%2==0
    return str[mid-1..mid]
  else
    return str[mid]
  end
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
  str.count(VOWELS.to_s)
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
  fact = 1
  (1..num).each { |i| fact *= i }
  return fact
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
  str = ""
  arr.each_with_index { |el, i| str += el + separator}
  return str[0..separator.length*-1-1]
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
  new_str = ""
  str.chars.each_with_index do |c, i|
    if i%2==0  #reverse because odd characters have even indices
      new_str += c.downcase
    else
      new_str += c.upcase
    end
  end
  return new_str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
  new_str_arr = str.split.map do |word|
    if word.length >= 5
      word.reverse
    else
      word
    end
  end
  return new_str_arr.join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
  (1..n).map do |n|
    if n%3==0 && n%5==0
      "fizzbuzz"
    elsif n%3==0
      "fizz"
    elsif n%5==0
      "buzz"
    else
      n
    end
  end
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
  arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
  if num<2
    return false
  end
  (2..num/2).each do |n|
    if num%n==0
      return false
    end
  end
  return true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
  arr = []
  (1..num).each { |n| arr << n if num%n==0}
  return arr
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
    arr = []
    (1..num).each { |n| arr << n if num%n==0 && prime?(n)}
    return arr
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
  return prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
  # first_even = 1
  # first_odd = 2
  # arr.each do |n|
  #   # puts "checking #{n}"
  #   if n%2==0
  #     if first_even==1
  #       first_even = n
  #       # puts "set first_even to #{n}"
  #     else
  #       return first_odd
  #     end
  #   else
  #     if first_odd==2
  #       first_odd = n
  #       # puts "set first_odd to #{n}"
  #     else
  #       return first_even
  #     end
  #   end
  # end
  odds = []
  evens = []
  arr.each do |n|
    if n%2==0
      evens << n
    else
      odds << n
    end
  end
  if odds.length > 1
    return evens[0]
  else
    return odds[0]
  end
end
