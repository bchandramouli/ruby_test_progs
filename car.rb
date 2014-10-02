#!/usr/bin/env ruby

$ppg = 3.5 # price_per_gallon is $3.5
$mpg = 20 # 20 is the fuel economy

class Car
	def initialize(dist, fuel)
		@dist = dist
		@fuel = fuel
	end
	def setup()
		@dist = 0
		@fuel = 10
	end
	def get_info
		"I'm a car. I've driven #{@dist} miles and have #{@fuel} gallons of gas left"
	end
	def drive(miles)
		if (@fuel - miles/20 <= 0)
			puts "You are running on fumes, can't update the intrinsic variables. :(("
		end
		@dist = @dist - miles
		@fuel = @fuel - miles/$mpg
	end
	def fill_up()
		to_fill = 10 - @fuel
		@fuel = 10 # Top up fuel
		price = to_fill * $ppg 
		puts "Cost for filling up #{to_fill} was #{price}"
	end
end

a = Car.new(5, 10)
b = Car.new(500,10)
b.drive(200)
puts b.get_info
b.fill_up
