require "byebug"
# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
  hash = Hash.new(0)
  str.split.each { |word| hash[word] = word.length }
  return hash
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
  hash.sort_by{|k,v| v}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
  newer.each { |k,v| older[k] = v }
  return older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
  counts = Hash.new(0)
  word.each_char { |ch| counts[ch] += 1 }
  return counts
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
  counts = Hash.new(0)
  #uniq_arr = []
  arr.each { |el| counts[el] += 1 }
  #counts.each { |k, v| uniq_arr << k }
  return counts.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
  hash = Hash.new(0)
  numbers.each do |num|
    if num.even?
      hash[:even] += 1
    else
      hash[:odd] +=1
    end
  end
  return hash
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are
# lower case.
def most_common_vowel(string)
  hash = Hash.new(0)
  vowels = "aeiou"
  string.downcase.each_char { |ch| hash[ch] += 1 if vowels.include?(ch) }
  hash.sort_by { |k, v| v }[-1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
  arr = []
  students.each { |k,v| arr << k if v >= 7 }
  combo_arr = []
  arr.each_with_index do |st, idx|
    (idx+1..arr.length-1).each do |num|
      combo_arr << [st, arr[num]]
    end
  end
  return combo_arr
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
  # counts = Hash.new(0)
  # specimens.each { |species| counts[species] += 1}
  # sorted_counts = counts.sort_by{ |k,v| v}
  # smallest_population_size = sorted_counts[0][1]
  # largest_population_size = sorted_counts[-1][1]
  # number_of_species = counts.length
  unique_specimens = specimens.uniq
  number_of_species = unique_specimens.length
  counts = {}
  unique_specimens.each { |species| counts[species] = specimens.count(species) }
  smallest_population_size = counts.values.min
  largest_population_size = counts.values.max
  return number_of_species**2 * smallest_population_size / largest_population_size
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
  normal_hash = character_count(normal_sign)
  vandalized_hash = character_count(vandalized_sign)
  vandalized_hash.each do |k, v|
    return false if normal_hash[k] < v
  end
  return true
end

def character_count(str)
  hash = Hash.new(0)
  str.downcase.each_char { |ch| hash[ch] += 1 if ch != " " }
  return hash
end
