#!/usr/bin/env ruby

$race_time = 5 # Race lasts 5 hours


class RaceTrack
	attr_reader :time
	attr_reader :cars
	attr_reader :name

	def initialize(name)
		@name = name
		@start = false
		@time = 0
		@cars = []
		@end = false
	end

	def start()
		@start = true
		@cars.each do |car| 
			car.speed = rand(60..80)
			puts "#{car.name} is at #{car.speed} mph"
		end
	end

	def add_cars(*race_cars)
		if (@start)
			puts "Error: The race has already started"
		else
		    race_cars.each do |rc|
		    	puts "Added car #{rc.name} to the race track #{@name}"
		    	@cars.push(rc)
		    end
		end
	end

	def advance()
		if !@start
			puts "Please start the race first"
		end
		@time += 1;
		@cars.each do |car|
			 car.upd_dist()
			 car.speed = car.speed + rand(0..20)
		end
		if (@time == 5)
			print_winner
			restart
		end
	end 

	def print_winner()
		winner = @cars[0]
		@cars.each { |car| winner = car if (car.dist > winner.dist) }
		stats()
		puts "\n And the winner is the #{winner.name} car"
	end

	def restart()
		@cars.each { |car| car.speed = 0 } # Resest speeds of all the cars
		@start = false
	end

	def stats
		@cars.each { |car| puts "Car #{car.name} driving at #{car.speed} mph has travelled #{car.dist} miles" }
	end
end

class RaceCar
	attr_reader :name
	attr_accessor :speed
	attr_reader :dist

	def initialize(name)
		@name = name
		@speed = 0
		@dist = 0
	end

	def upd_dist()
		@dist += @speed
	end
end