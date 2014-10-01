#!/usr/bin/ruby

def exec_time(proc)
  # your code here
  start = Time.now
  proc.call()
  Time.now - start
end

div1 = lambda { 88276 / 2**4 }
div2 = lambda { (88276 - (88276 % 2**4)) >> 4 }
div3 = lambda { 88276 >> 4 }
rem = lambda { 88276 % 2**4 }

puts "time for rem", exec_time(rem)
puts "time for div1", exec_time(div1)
puts "time for div2", exec_time(div2)
puts "time for div3", exec_time(div3)
