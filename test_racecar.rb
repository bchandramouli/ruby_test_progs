#!/usr/bin/env ruby

require_relative 'racecar.rb'

track = RaceTrack.new("Derby")
blue_car = RaceCar.new("Blue")
red_car = RaceCar.new("Red")
green_car = RaceCar.new("Green")
yellow_car = RaceCar.new("Yellow")

track.add_cars(blue_car)
#track.add_cars(red_car)
track.add_cars(red_car, green_car, yellow_car)
#track.add_cars(yellow_car)

track.start

track.add_cars(green_car, yellow_car)

5.times do 
	track.advance
end
