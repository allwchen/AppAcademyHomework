require "byebug"

require 'time'

def measure(pass = 0)
  start_time = Time.now
  if pass == 0
    yield
  else
    pass.times {|current| result = yield(current)}
  end
  (Time.now - start_time) / (pass == 0 ? 1 : pass)
end
