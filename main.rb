require 'json'
require './file'

class Recipe
  attr_accessor :id, :name, :description, :is_favorite, :ingredients

  def initialize ( name, description, is_favorite, ingredients)
    @file_name = 'recipe.json'

    @name = name
    @description = description
    @is_favorite = is_favorite
    @ingredients = ingredients
  end


    def show_recipe
      puts @id
    end



    def append(name, ingredients, quantity)
      if @ingredients.has_key?(name)
        @ingredients[name] += quantity
      elsif @ingredients[name] = quantity
      end
    end

    def show_favorite

    end

    def load
      begin
        @ingredients = CSV.parse(MyFile::File_.read(@file_name2))
        @ingredients = JSON.parse(MyFile::File_.read(@file_name))
      rescue
        @ingredients = {}
      end
    end

end


class Fridge
  attr_accessor :ingredients
  def initialize
    @file_name = 'fridge.json'
  end

  def show_ingredients
    puts @ingredients
  end

  def append(name, quantity)
    if @ingredients.has_key?(name)
      @ingredients[name] += quantity
    elsif
      @ingredients[name] = quantity
    end
  end

  def to_json
    @ingredients.to_json
  end

  def to_csv

  end

  def from_csv

  end

  def save
    text = to_json
    MyFile::File_.write(@file_name, text)
  end

  def load
    begin
      @ingredients = JSON.parse(MyFile::File_.read(@file_name))
    rescue
      @ingredients = {}
    end
  end
end


FRIDGE = Fridge.new
FRIDGE.load


def add_ingredient
  puts 'Enter a name of ingredient'
  name_input = gets.chomp
  puts 'Enter a quantity of ingredient'
  quantity_input = gets.chomp.to_f

  FRIDGE.append(name_input, quantity_input)
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
    puts ''
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
