def add(n1, n2)
  return n1+n2
end

def subtract(n1, n2)
  return n1-n2
end

def sum(arr)
  count=0
  arr.each { |num| count += num }
  return count
end

def multiply(n1, n2)
  return n1*n2
end

def multiply_array(arr)
  product = 1
  arr.each{ |num| product *= num}
  return product
end

def power(n1, n2)
  return n1**n2
end

def factorial(num)
  if num<=1
    return 1
  end
  product = 1
  (1..num).each{ |i| product *=i }
  return product
end
