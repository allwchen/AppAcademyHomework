require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
  # if arr.length ==0
  #   return 0
  # end
  arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
  # long_strings.each do |word|
  #   if !substring?(word, substring)
  #       return false
  #     end
  # end
  # return true
  long_strings.all?{ |word| word.include?(substring)}
end

def substring?(word, substring)
  word.index(substring) != nil
end

# puts "asdf".index("p") == nil
# puts substring?("asdf", "a")
# puts substring?("asdf", "s")
# puts substring?("asdf", "asdf")
# puts substring?("asdf", "sdf")
# puts substring?("asdf", "p")
# puts substring?("asdf", "af")

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
  sorted_letters = string.split("").reject{|char| char==" "}.sort
  sorted_letters.select{|char| sorted_letters.count(char) > 1}.uniq

  # another method
  characters = string.chars.uniq
  characters.delete(" ")
  characters.select{ |char| string.count(char) > 1 }
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
  string.delete!(",.:;!?")
  string.split.sort_by{|word| word.length}[-2..-1]
  # longest = sorted_words[-1]
  # next_longest = sorted_words[-2]
  # if string.index(longest) > string.index(next_longest)
  #   return [next_longest, longest]
  # else
  #   return [longest, next_longest]
  # end
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
  # lower_letters = "abcdefghijklmnopqrstuvwxyz".split("")
  lower_letters = ("a".."z")
  lower_letters.reject{|char| string.include?(char)}
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
  (first_yr..last_yr).select{|year| not_repeat_year?(year)}
end

def not_repeat_year?(year)
  year_arr = year.to_s.chars
  # year_arr.each do |digit|
  #   if year_arr.count(digit) > 1
  #     return false
  #   end
  # end
  # return true
  return year_arr == year_arr.uniq
end

# puts not_repeat_year?(1980)
# puts not_repeat_year?(1111)

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
  uniq_songs = songs.uniq
  # print songs
  # puts
  # print uniq_songs
  # puts
  uniq_songs.select{|song| no_repeats?(song, songs)}
end

def no_repeats?(song_name, songs)
  # prev_index = -2
  # songs.each_with_index do |song, idx|
  #   if song == song_name
  #     if prev_index == idx-1
  #       return false
  #     else
  #       prev_index = idx
  #     end
  #   end
  # end
  # return true
  songs.each_with_index do |song, idx|
    if song == song_name
      return false if song == songs[idx+1]
    end
  end
  return true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
  # if string.split("").index("c") == nil
  #   return ""
  # end
  alpha_string = string.gsub(/[^a-z0-9\s]/i, '')
  cs_words = alpha_string.split.select{|word| word.downcase.include?("c")}
  return "" if cs_words.empty?
  sorted_string = cs_words.sort_by{|word| c_distance(word)}
  return sorted_string[0]
end

def c_distance(word)
  # count = 0
  # word.split("").reverse.each do |char|
  #   break if char == "c"
  #   count += 1
  # end
  # return count
  word.reverse.index("c")
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
  ranges = []
  start_idx = nil
  # prev_num = -1
  # repeating = false
  # arr.each_with_index do |num, idx|
  #   if num != prev_num
  #     if repeating == true
  #       repeating = false
  #       ranges << [start_idx, idx-1]
  #     end
  #     start_idx = idx
  #   else
  #     if repeating == false
  #       repeating = true
  #       start_idx = idx - 1
  #     end
  #   end
  #   prev_num = num
  # end
  # if repeating
  #   ranges << [start_idx, arr.length-1]
  # end

  arr.each_with_index do |num, idx|
    if num == arr[idx+1]
      if start_idx == nil
        start_idx = idx
      end
    else
      if start_idx != nil
        ranges << [start_idx, idx]
        start_idx = nil
      end
    end
  end
  return ranges
end
