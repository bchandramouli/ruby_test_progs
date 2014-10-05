#!/usr/bin/env ruby


def compute(oper1, oper2, op)
	case op
	when "+"
		out = oper1 + oper2
	when "-"
		out = oper1 - oper2
	when "*"
		out = oper1 * oper2
	when "/"
		out = oper1 / oper2
	end

	return out
end

def calculate(mstr)
	marr = mstr.split(' ')

	puts "marr init = #{marr}"

    op_index = 0

    while (marr.size >= 3) do
    	op_index = marr.size/2 + 1
    	op = marr[op_index]
    	oper1 = marr[op_index - 2].to_i
    	oper2 = marr[op_index - 1].to_i
    	puts "op_index = #{op_index}, op = #{op}, oper1 = #{oper1}, oper2 = #{oper2}"
    	marr[op_index - 2] = compute(oper1, oper2, op).to_s
    	marr.delete_at(op_index)
    	marr.delete_at(op_index - 1)
    	puts "marr = #{marr}"
    end
    marr[0]
end

puts calculate("2 3 +") # => 5
puts calculate("48 4 6 * /") # => 2