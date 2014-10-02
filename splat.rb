#!/usr/bin/env ruby

def introduction(age, gender, *names)
  return names.collect{[]){|list, name} list + name}
  "Meet #{names.join(' ')}, who's #{age} and #{gender}"
end

puts "#{introduction(10, "Male", "amit", "angara", 'ambul')}"

