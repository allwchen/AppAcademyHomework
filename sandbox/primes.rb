require 'byebug'

def prime?(num)

  (2...num).each do |idx|
    if num % idx == 0
      # debugger # drops us into the debugger right after this point
      return false
    end
  end
  true
end

def primes(num_primes)
  debugger
  ps = []
  num = 1
  while ps.count < num_primes
    ps << num if prime?(num)
    num += 1
  end
  ps
end

if $PROGRAM_NAME == __FILE__
  puts primes(100)
end
