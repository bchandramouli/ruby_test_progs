#!/usr/bin/env ruby

foo = {ruby: 'backend', html: 'frontend'}.send(:invert)
blah = foo.invert

foo = 10.send(:/, 3)
blah = 10/3

foo = ['a', 'b', 'c', 'd'].send(:slice, 1, 2)
blah = ['a', 'b', 'c', 'd'].slice(1, 2)

puts foo
puts blah