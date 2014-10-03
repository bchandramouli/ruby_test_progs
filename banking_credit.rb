#!/usr/bin/env ruby

$CC_DEF_LIMIT = 500 # Default credit card limit
$CC_INCREASE_LIMIT = 1000 # Limit increments

class Bank
	attr_accessor :name
	attr_reader :accounts
	attr_reader :cc_accounts

	def initialize(name)
		@name = name
		@accounts = {}
		@cc_accounts = {}
		puts "#{@name} bank was just created."
	end

	def open_account(person)
		if @accounts.keys.include?(person.name)
			puts "Error: account already exists" #barf
		end
		puts "#{person.name}, thanks for opening an account at #{@name}!"
		@accounts[person.name] = 0
	end

	def withdraw(person, amount)
		if (@accounts[person.name] < amount)
			puts "#{person.name} does not have enough amount in the account to withdraw $#{amount}."
			return
		end
		@accounts[person.name] -= amount
		person.cash += amount
		puts "#{person.name} withdrew $#{amount} from #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."
	end

	def deposit(person, amount)
		if (person.cash < amount)
			puts "#{person.name} does not have enough cash to deposit $#{amount}."
			return
		end
		@accounts[person.name] += amount
		person.cash -= amount
		puts "#{person.name} deposited $#{amount} to #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."

	end

	def transfer(person, bank, amount)
		@accounts[person.name] -= amount
		bank.accounts[person.name] += amount
		puts "#{person.name} transfered $#{amount} from the #{@name} account to the #{bank.name} account. The #{@name} account has $#{@accounts[person.name]} and the #{bank.name} has $#{bank.accounts[person.name]}."
	end

	def total_cash_in_bank()
		total = 0;
		@accounts.values.each { |val| total += val }
		return "#{@name} has $#{total} in the bank."
	end

	def open_cc(person)
		if @cc_accounts.keys.include?(person.name)
			puts "Error: A credit card account for #{person.name} already exists" #barf
		end
		puts "#{person.name}, thanks for starting an credit card at #{@name}!"
		@cc_accounts[person.name] = $CC_DEF_LIMIT
	end

	def charge_cc(person, amount)
		if @cc_accounts[person.name] < amount
			puts "Error: Void transaction as it exceeds #{person.name}'s available credit #{@cc_accounts[person.name]}"
			return
		end
		@cc_accounts[person.name] -= amount
		puts "Transaction successful: #{person.name} has $#{@cc_accounts[person.name]} available credit"
	end

	def pay_cc(person, *vars)
		# 
		# A CC can be paid by money from:
		#     Current bank account or Another bank account
		#
		if vars.length > 2
			puts "Error: invalid number of arguments [expecting: person, amount(, bank)]"
			return
		end

		if !vars[-1].is_a?(Bank)
			vars.push(self)
		end
		amount = vars[0]
		bank = vars[1]

		if (bank.accounts[person.name] < amount)
			puts "Error: Not sufficient money in the bank #{bank.name} to pay $#{amount}"
			return
		end
		bank.accounts[person.name] -= amount
		@cc_accounts[person.name] += amount
		puts "added $#{amount} to #{person.name} at #{@name} bank"
	end

	def increase_credit(person)
		@cc_accounts[person.name] += $CC_INCREASE_LIMIT
		puts "Increased credit limit of #{person.name} by $#{$CC_INCREASE_LIMIT}."
	end

	def total_outstanding_loans()
		total = 0;
		@cc_accounts.values.each { |val| total += val }
		return "Bank #{@name} has $#{total} outstanding loan."
	end
end

class Person
	attr_accessor :name
	attr_accessor :cash

	def initialize(name, start_cash)
		@name = name
		@cash = start_cash
		puts "Hi, #{@name}. You have $#{@cash}!"
	end
end

# Test code:
chase = Bank.new("JP Morgan Chase")
wells_fargo = Bank.new("Wells Fargo")
puts "\n"

me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
puts "\n"

chase.open_account(me)
chase.open_account(friend1)
puts "\n"

wells_fargo.open_account(me)
wells_fargo.open_account(friend1)
puts "\n"

# Withdrawing and depositing
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)
puts "\n"

# Transfers
chase.transfer(me, wells_fargo, 100)
puts "\n"

# Validations
chase.deposit(me, 5000)
chase.withdraw(me, 5000)
puts "\n"

# Count totals
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank
puts "\n"


# open a credit card
chase.open_cc(me) # default credit limit $500
chase.open_cc(friend1)
puts "\n"

# Charge Credit Card
chase.charge_cc(me, 300)
chase.charge_cc(friend1, 400)
chase.charge_cc(me, 1000) # Exceeding credit limit
puts "\n"

# Increase credit line
chase.increase_credit(me) #Another $1000
puts "\n"

# Pay credit cards
chase.pay_cc(me, 200) # Barfs as JP Morgan chase does not have enough money
chase.pay_cc(me, 100, wells_fargo) # Pay from an account in Wells Fargo
puts "\n"

chase.charge_cc(me, 1500) # Max out the credit card
puts "\n"

puts chase.total_outstanding_loans
puts wells_fargo.total_cash_in_bank
puts "\n"