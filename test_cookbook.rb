#!/usr/bin/ruby

require_relative 'cookbook.rb'

mex_cuisine = Cookbook.new("Mexican Cooking")
burrito = Recipe.new("Bean Burrito", ["tortilla", "bean"], ["heat beans", "place beans in tortilla", "roll up"])
quesadilla = Recipe.new("Veggie Quesadilla", ["tortilla", "cheesse", "onion"], ["heat tortilla", "place cheese in tortilla", "spread and flatten", "cut into triangles"])


p mex_cuisine.title # Mexican Cooking
p burrito.title # Bean Burrito
burrito.add_ingredients("cheese")
burrito.add_steps(2, "sprinkle cheese on top")
p burrito.ingredients # ["tortilla", "bean", "cheese"]
p burrito.steps # ["heat beans", "heat tortilla", "place beans in tortilla", "sprinkle cheese on top", "roll up"]

mex_cuisine.title = "Mexican Recipes"
puts mex_cuisine.title # Mexican Recipes

burrito.title = "Veggie Burrito"
burrito.ingredients = ["tortilla", "tomatoes"]
burrito.steps = ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

p burrito.title # "Veggie Burrito"
p burrito.ingredients # ["tortilla", "tomatoes"]
p burrito.steps # ["heat tomatoes", "place tomatoes in tortilla", "roll up"]

mex_cuisine.recipes #[]
mex_cuisine.add_recipes(burrito)
mex_cuisine.add_recipes(quesadilla)
p mex_cuisine.recipes

mex_cuisine.recipe_titles
mex_cuisine.recipe_ingredients

burrito.print_recipe

mex_cuisine.print_cookbook