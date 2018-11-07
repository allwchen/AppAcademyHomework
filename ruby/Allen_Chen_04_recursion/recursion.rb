require "byebug"

def range(start, end_num)
  return [] if end_num <= start
  return [start] + range(start+1, end_num)
end

def sum(num_array)
  return 0 if num_array.empty?
  return num_array[0] + sum(num_array[1..-1])
end

def sum_iter(num_array)
  sum = 0
  num_array.each { |i| sum += i }
  return sum
end

def exp(b, n)
  p "exp #{b}, #{n}"
  return 1 if n<=0
  return b*exp(b, n-1)
end

# [51] pry(main)> exp(0,0)
# "exp 0, 0"
# => 1
# [52] pry(main)> exp(0,1)
# "exp 0, 1"
# "exp 0, 0"
# => 0
# [53] pry(main)> exp(1,0)
# "exp 1, 0"
# => 1
# [54] pry(main)> exp(1,1)
# "exp 1, 1"
# "exp 1, 0"
# => 1
# [55] pry(main)> exp(1,2)
# "exp 1, 2"
# "exp 1, 1"
# "exp 1, 0"
# => 1
# [56] pry(main)> exp(2,0)
# "exp 2, 0"
# => 1
# [57] pry(main)> exp(2,1)
# "exp 2, 1"
# "exp 2, 0"
# => 2
# [58] pry(main)> exp(2,2)
# "exp 2, 2"
# "exp 2, 1"
# "exp 2, 0"
# => 4
# [59] pry(main)> exp(2,3)
# "exp 2, 3"
# "exp 2, 2"
# "exp 2, 1"
# "exp 2, 0"
# => 8
# [60] pry(main)> exp(3,0)
# "exp 3, 0"
# => 1
# [61] pry(main)> exp(3,1)
# "exp 3, 1"
# "exp 3, 0"
# => 3
# [62] pry(main)> exp(3,2)
# "exp 3, 2"
# "exp 3, 1"
# "exp 3, 0"
# => 9
# [63] pry(main)> exp(3,3)
# "exp 3, 3"
# "exp 3, 2"
# "exp 3, 1"
# "exp 3, 0"
# => 27

def exp2(b, n)
  p "exp2 #{b}, #{n}"
  return 1 if n<=0
  return b if n==1
  if n.even?
    half_exp = exp2(b, n/2)
    return half_exp * half_exp
  else
    half_exp = exp2(b, (n-1)/2)
    return b*half_exp * half_exp
  end
end

# [64] pry(main)> exp2(0,0)
# "exp2 0, 0"
# => 1
# [65] pry(main)> exp2(0,1)
# "exp2 0, 1"
# => 0
# [66] pry(main)> exp2(1,0)
# "exp2 1, 0"
# => 1
# [67] pry(main)> exp2(1,1)
# "exp2 1, 1"
# => 1
# [68] pry(main)> exp2(2,0)
# "exp2 2, 0"
# => 1
# [69] pry(main)> exp2(2,1)
# "exp2 2, 1"
# => 2
# [70] pry(main)> exp2(2,2)
# "exp2 2, 2"
# "exp2 2, 1"
# => 4
# [71] pry(main)> exp2(2,3)
# "exp2 2, 3"
# "exp2 2, 1"
# => 8
# [72] pry(main)> exp2(3,0)
# "exp2 3, 0"
# => 1
# [73] pry(main)> exp2(3,1)
# "exp2 3, 1"
# => 3
# [74] pry(main)> exp2(3,2)
# "exp2 3, 2"
# "exp2 3, 1"
# => 9
# [75] pry(main)> exp2(3,3)
# "exp2 3, 3"
# "exp2 3, 1"
# => 27
# [76] pry(main)> exp2(3,4)
# "exp2 3, 4"
# "exp2 3, 2"
# "exp2 3, 1"
# => 81
# [77] pry(main)> exp2(3,5)
# "exp2 3, 5"
# "exp2 3, 2"
# "exp2 3, 1"
# => 243
# [78] pry(main)> exp2(3,6)
# "exp2 3, 6"
# "exp2 3, 3"
# "exp2 3, 1"
# => 729
class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << deep_dup(el)
      else
        new_arr << el
      end
    end
    return new_arr
  end

  # [80] pry(main)> robot_parts = [
  # [80] pry(main)*   ["nuts", "bolts", "washers"],
  # [80] pry(main)*   ["capacitors", "resistors", "inductors"]
  # [80] pry(main)* ]
  # => [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]
  # [81] pry(main)> robot_parts
  # => [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]
  # [82] pry(main)> robot_parts_copy = deep_dup(robot_parts)
  # => [["nuts", "bolts", "washers"], ["capacitors", "resistors", "inductors"]]
  # [83] pry(main)> robot_parts_copy[1] << "LEDs"
  # => ["capacitors", "resistors", "inductors", "LEDs"]
  # [84] pry(main)> robot_parts[1]
  # => ["capacitors", "resistors", "inductors"]
  # [85] pry(main)> mixed = [1, [2], [3, [4]]]
  # => [1, [2], [3, [4]]]
  # [86] pry(main)> mixed
  # => [1, [2], [3, [4]]]
  # [87] pry(main)> mixed_copy = deep_dup(mixed)
  # => [1, [2], [3, [4]]]
  # [88] pry(main)> mixed
  # => [1, [2], [3, [4]]]
  # [89] pry(main)> mixed_copy
  # => [1, [2], [3, [4]]]
  # [90] pry(main)> mixed_copy[2][1] = 5
  # => 5
  # [91] pry(main)> mixed_copy
  # => [1, [2], [3, 5]]
  # [92] pry(main)> mixed
  # => [1, [2], [3, [4]]]

  def merge_sort
    if self.length <= 1
      return self
    else
      mid = self.length/2
      return merge(self[0...mid].merge_sort, self[mid..-1].merge_sort)
    end
  end
  # [51] pry(main)> [0,1].merge_sort
  # => [0, 1]
  # [52] pry(main)> [1, 0].merge_sort
  # => [0, 1]
  # [53] pry(main)> [1, 0, 2].merge_sort
  # => [0, 1, 2]
  # [54] pry(main)> [1, 0, 2, 4].merge_sort
  # => [0, 1, 2, 4]
  # [55] pry(main)> [6, 5, 3, 1, 8, 7, 2, 4].merge_sort
  # => [1, 2, 3, 4, 5, 6, 7, 8]
  # [56] pry(main)> [6, 5, 3, 1, 8, 7, 2, 4, 0].merge_sort
  # => [0, 1, 2, 3, 4, 5, 6, 7, 8]
  # [57] pry(main)> [38, 27, 43, 3, 9, 82, 10].merge_sort
  # => [3, 9, 10, 27, 38, 43, 82]

  def merge(arr1, arr2)
    new_arr = []
    i1=0
    i2=0
    while i1 < arr1.length
      if i2 == arr2.length
        new_arr.concat(arr1[i1..-1])
        break
      elsif (arr1[i1] < arr2[i2])
        new_arr << arr1[i1]
        i1 += 1
      else
        new_arr << arr2[i2]
        i2 += 1
      end
    end
    if i2 != arr2.length
      (i2...arr2.length).each { |idx2| new_arr << arr2[idx2] }
    end
    return new_arr
  end
end
# [30] pry(main)> merge([0], [1])
# => [0, 1]
# [31] pry(main)> merge([1], [0])
# => [0, 1]
# [32] pry(main)> merge([1], [0, 2])
# => [0, 1, 2]
# [33] pry(main)> merge([1, 3], [0, 2])
# => [0, 1, 2, 3]
# [34] pry(main)> merge([1, 3], [0])
# => [0, 1, 3]
# [35] pry(main)> merge([1, 3], [])
# => [1, 3]
# [36] pry(main)> merge([], [1, 2])
# => [1, 2]
# [37] pry(main)> merge([5], [1, 2, 4, 6])
# => [1, 2, 4, 5, 6]
# [38] pry(main)> merge([1, 2, 4, 6], [5])
# => [1, 2, 4, 5, 6]

def fibonacci(n)
  if n<=2
    [0,1].take(n)
  else
    arr = fibonacci(n-1)
    arr << arr[-2]+arr[-1]
  end
end

def fibonacci_iter(n)
  return [] if n==0
  return [0] if n==1
  arr = [0, 1]
  while arr.count < n
      arr << arr[-1] + arr[-2]
  end
  return arr
end

def bsearch(array, target)
  return nil if array.length == 0
  mid = array.length/2
  if target == array[mid]
    return mid
  elsif array[mid] < target
    ans = bsearch(array[mid+1..-1], target)
    ans.nil? ? nil : mid + 1 + ans
    # mid + 1 + bsearch(array[mid+1..-1], target)
  else
    bsearch(array[0...mid], target)
  end
end

class Array
  def subsets
    return [[]] if empty?
    debugger
    subs = take(count - 1).subsets
    subs.concat(subs.map { |sub| sub + [last] })
  end
end

def subsets(array)
  return [[]] if array.empty?
  last_el = array.last
  array_rest = array.take(array.count-1)
  array_subsets = subsets(array_rest)
  array_subsets.concat(array_subsets.map { |sub| sub + [last_el]  })
end
# [19] pry(main)> subsets([])
# => []
# [20] pry(main)> subsets([1])
# => [[], [1]]
# [21] pry(main)> subsets([1, 2])
# => [[], [1], [2], [1, 2]]
# [22] pry(main)> subsets([1, 2, 3])
# => [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]

def permutations(array)
  return [[]] if array.empty?
  return [array] if array.length == 1
  new_arr = []

  first_el = array.shift
  array_perms = permutations(array)
  array_perms.each do |perm|
    (0..perm.length).each do |idx|
      new_arr << perm[0...idx] + [first_el] + perm[idx..-1]
    end
  end
  return new_arr
end

def greedy_make_change(amount, coins=[25,10,5,1])
  return [] if amount == 0
  return nil if coins.none? { |coin| coin <= amount }
  coins.sort!.reverse!
  change = []
  num_coins = amount/coins[0]
  num_coins.times { change << coins[0] }
  change + greedy_make_change(amount%coins[0], coins.drop(1))
end

def make_better_change(amount, coins=[25,10,5,1])
  return [] if amount == 0
  return nil if coins.none? { |coin| coin <= amount }
  coins.sort!.reverse!
  best_change = nil

  coins.each do |coin|
    next if amount < coin
    remainder = amount - coin
    best_remainder = make_better_change(remainder, coins.select { |c| c <= coin})
    next if best_remainder.nil?
    this_change = [coin] + best_remainder
    if best_change.nil? || this_change.count < best_change.count
      best_change = this_change
    end
  end

  return best_change
end

# [53] pry(main)> greedy_make_change(39, [25, 10, 5, 1])
# => [25, 10, 1, 1, 1, 1]
# [54] pry(main)> make_better_change(39)
# => [25, 10, 1, 1, 1, 1]
# [55] pry(main)> make_better_change(41)
# => [25, 10, 5, 1]
# [56] pry(main)> make_better_change(24)
# => [10, 10, 1, 1, 1, 1]
# [57] pry(main)> make_better_change(14)
# => [10, 1, 1, 1, 1]
# [58] pry(main)> make_better_change(24, [10,7,1])
# => [10, 7, 7]
# [59] pry(main)> make_better_change(14, [10,7,1])
# => [7, 7]
