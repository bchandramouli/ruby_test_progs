#!/usr/bin/ruby

def add(*nums)
  nums.inject(0){ | sum, num | sum = sum + num}
end
def subtract(*nums)
  sum = nums.shift
  for num in nums do
    sum = sum - num
  end
  return sum
end
def calculate(*nums)
  options = nums[-1].is_a?(Hash) ? nums.pop : {} 
  if (options.empty? || options[:add])
    return add(*nums)
  end
  return subtract(*nums) if (options[:subtract])
end

puts "addtotal is: #{calculate(4, 5)}"
puts "subtotal is: #{calculate(4, 5, subtract:true)}"
