require "byebug"

def reverser (&blk)
  return blk.call.split.map{|el| el.reverse}.join(" ")
end

def adder (init=1, &blk)
  return init + blk.call
end

def repeater (n=1, &blk)
  return n.times {blk.call}
end
