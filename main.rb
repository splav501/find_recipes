require 'json'
require './fridge'
require './ingridient'
require './db'
require './recipe'

FRIDGE = Fridge.new
FRIDGE.create({})

def add_ingredient
  puts 'Enter a name of ingredient'
  name_input = gets.chomp
  puts 'Enter a quantity of ingredient'
  quantity_input = gets.chomp.to_f

  FRIDGE.appendIngredient(name_input, quantity_input)
end


def add_recipe
  puts 'Enter name of recipe '
  @name_input = gets.chomp
  create_recipe
end
def create_recipe
  while ((@ingr_input != 'exit') || (@quantity_input != 'exit') || (@quantity_input != 'exit'))
    puts 'Enter a name of ingredient'
    @ingr_input = gets.chomp
    puts 'Enter a quantity of ingredient'
    @quantity_input = gets.chomp.to_f
    puts "you can finish adding engradiegtyv with the command \"exit.\""
  end
  cre
end
def cre
  puts 'Уnter a description of the recipe '
  @description_input = gets.chomp
end

def main
  while true

    puts '1. Add ingredient into a fridge'
    puts '2. Show ingredients into FRIDGE'
    puts '3. Create recipe'
    puts '0. Exit'

    puts 'Enter a number '
    user_input = gets.chomp
    if (user_input == '0')
      FRIDGE.save
      break
    elsif (user_input == '1')
      add_ingredient
    elsif (user_input == '2')
      FRIDGE.show_ingredients
    elsif (user_input == '3')
      create_recipe
    end
  end
end


main
