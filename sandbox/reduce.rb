def factors(num)
  factors = []
  (1..num).each do |i|
    if num % i == 0
      factors << i
    end
  end
  factors
end

def factors_reduce(num)
  (1..num).reduce([]) do |arr, i|
    if num%i==0 then
      arr << i
    else
      arr
    end
  end
end
