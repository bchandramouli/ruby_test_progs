#!/usr/bin/env ruby

def random_select(array, n)
  out_arr = []
  max = array.length
  i = n
  while (i > 0) do
    foo = rand(max)
    #puts foo
    puts array[foo]
    out_arr.push(array[foo])
    i = i - 1
  end
  return out_arr
end

random_select([1,2,3,4,5], 2)
