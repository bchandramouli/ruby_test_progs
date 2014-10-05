#!/usr/bin/env ruby

today = "Saturday"

month_arr = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
day_arr = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]

year = 2000
month = 22
day = 7

epoch_year = 1970
epoch_month = 1
epoch_day = 1

year_diff = (year - epoch_year)

leap_years = year_diff / 4

if year % 4 && month > 2
    # current year is a leap year
	# now check if the month is feb or
	leap_years += 1
end

num_days_from_epoch = (year - epoch_year)*365 + leap_years

month_diff = month - epoch_month - 1

i = 0
month_arr.each do |days|
	if (i > month_diff)
		break
	end
	num_days_from_epoch += days
	i += 1
end

num_days_from_epoch += day - epoch_day

puts "days is: #{num_days_from_epoch}"

rem = num_days_from_epoch % 7

puts "day is #{today}"

puts "rem is #{rem}"

new_index = rem - day_arr.index(today)

puts "new_index is #{new_index}"

puts "day is #{day_arr[new_index]}"