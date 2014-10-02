#!/usr/bin/env ruby

class Pet
	def initialize(height, weight, name)
		@height = height
		@weight = weight
		@name = name
	end
    def noise(sound)
    	@sound = sound
    end

    def speak()
    	@sound
    end

    def attrs()
    	return @height, @weight, @name
    end
end

dog = Pet.new(20, 50, "rocky")
dog.noise("woof Woof")

cat = Pet.new(20, 30, "ribbon")
cat.noise("meow Meow")

puts dog.speak
puts cat.speak
puts dog.attrs

puts 5.send('*', 5)
puts "omg".send("upcase")
puts ['a','b','c'].send("at", 1)
puts ['a', 'b', 'c'].send("insert", 2, 'o', 'h', 'n', 'o')
foo = {}.send("size")
blah = {character: "Mario"}.has_key?(:character)
