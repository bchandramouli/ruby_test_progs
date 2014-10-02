#!/usr/bin/env ruby

class Bank
	attr_accessor :name
	attr_reader :accounts

	def initialize(name)
		@name = name
		@accounts = {}
		puts "#{@name} bank was just created."
	end

	def open_account(person)
		if @accounts.keys.include?(person.name)
			puts "Error: account already exists" #barf
		end
		puts "#{person.name}, thanks for opening an account at #{@name}!"
		@accounts[person.name] = 0
	end

	def withdraw(person, money)
		if (@accounts[person.name] < money)
			puts "#{person.name} does not have enough money in the account to withdraw $#{money}."
			return
		end
		@accounts[person.name] -= money
		person.cash += money
		puts "#{person.name} withdrew $#{money} from #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."
	end

	def deposit(person, money)
		if (person.cash < money)
			puts "#{person.name} does not have enough cash to deposit $#{money}."
			return
		end
		@accounts[person.name] += money
		person.cash -= money
		puts "#{person.name} deposited $#{money} to #{@name}. #{person.name} has $#{person.cash}. #{person.name}'s account has $#{@accounts[person.name]}."

	end

	def transfer(person, bank, money)
		@accounts[person.name] -= money
		bank.accounts[person.name] += money
		puts "#{person.name} transfered $#{money} from the #{@name} account to the #{bank.name} account. The #{@name} account has $#{@accounts[person.name]} and the #{bank.name} has $#{bank.accounts[person.name]}."
	end

	def total_cash_in_bank()
		total = 0;
		@accounts.values.each { |val| total += val }
		return "#{@name} has $#{total} in the bank."
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
me = Person.new("Shehzan", 500)
friend1 = Person.new("John", 1000)
chase.open_account(me)
chase.open_account(friend1)
wells_fargo.open_account(me)
wells_fargo.open_account(friend1)

# Withdrawing and depositing
chase.deposit(me, 200)
chase.deposit(friend1, 300)
chase.withdraw(me, 50)

# Transfers
chase.transfer(me, wells_fargo, 100)

# Validations
chase.deposit(me, 5000)
chase.withdraw(me, 5000)

# Count totals
puts chase.total_cash_in_bank
puts wells_fargo.total_cash_in_bank

