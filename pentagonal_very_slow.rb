#!/usr/bin/env ruby

num_array = (1..4000)
pent_array = (num_array).map { |n| n * (3 * n - 1) / 2 }
D_array = []
#puts pent_array
pent_array.each do |j|
	pent_array.each do |k|
		sum = j + k 
		diff = (j - k).abs
		#puts "sum = #{sum}, diff = #{diff}"
		if (pent_array.include?(sum) && pent_array.include?(diff))
			D_array << diff
			puts diff
		end
	end
end
puts "min value is: #{D_array.sort[0]}"