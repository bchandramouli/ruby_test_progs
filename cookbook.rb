#!/usr/bin/ruby

class Cookbook
	attr_accessor :title
	attr_reader :recipes

	def initialize(title)
		@title = title
		@recipes = []
	end

	def add_recipes(recipe)
		@recipes << recipe
		p "Added a recipe #{recipe.title} to the collection #{@title}"
	end

	def recipe_titles()
		@recipes.each { |r| p r.title }
	end

	def recipe_ingredients()
		@recipes.each { |r| p r.ingredients }
	end

	def print_cookbook()
		@recipes.each {|r| r.print_recipe }
	end
end

class Recipe

	attr_accessor :title, :ingredients, :steps

	def initialize(title, ingredients, steps)
		@title = title
		@ingredients = ingredients
		@steps = steps
	end

	def add_ingredients(ingr)
		@ingredients.push(ingr)
	end

	def add_steps(num, step)
		@steps.insert(num, step)
	end

	def print_recipe
		puts "Recipe: #{@title}"
		puts "Ingredients: #{@ingredients.join(' ')}"
		s_str = ""
		i = 1
		@steps.each do |s|
			s_str << i.to_s + ". " + s + "\n"
			i += 1
		end
		puts "Steps: \n#{s_str}"
		puts "\n"
	end
end



