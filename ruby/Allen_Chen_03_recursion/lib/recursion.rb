require "byebug"

def sum_to(n)
  return nil if n<0
  return 0 if n==0
  return n+sum_to(n-1)
end

def add_numbers(nums_array)
  return nil if nums_array.length == 0
  return nums_array.first if nums_array.length == 1
  return nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n<=0
  return factorial(n-1)
end

def factorial(n)
  return 1 if n<=0
  return n*factorial(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite
  return ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(str)
  return str if (str == "" || str.length == 1)
  return reverse(str[1..-1]) + str[0]
end
