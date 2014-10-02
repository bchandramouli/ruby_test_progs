#!/usr/bin/env ruby

p_arr = [1, 2, 5, 10, 20, 50, 100, 200]
r_arr = p_arr.reverse
div_arr = []

max = r_arr.shift;

ways = 8
max = r_arr[0]; # =>200
total = 0;
r_arr.each do |r|
	total = r
    r_arr.each do |q|
    	#for (i in (1..200)) do
    		#total += q*i
    	    if (total == max)
		        ways += 1
		        break
		    end
		    if (total > max)
			    break
		    end
	    #end
	end
end

puts "Number of ways is: #{ways}"



