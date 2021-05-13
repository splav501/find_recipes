class RecipeTest
  attr_accessor :id, :name, :ingredients

  def initialize (id, name, ingredients)
    @id = id
    @name = name
    @ingredients = ingredients
  end

  def description
    puts "#{@id}, #{@name}, #{@ingredients}"
  end
end

class RecipeAct
  def with_recipe(recipe_id)
    recipe_id = recipe_id.to_i
    DATA.all_recipes[recipe_id - 1].description
    while true
      puts '1. Add to favorites'
      puts '2. Edit recipe'
      puts '3. Delete recipe'
      puts ''
      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '1'
        #Має бути метод Recipe який додає до улюблених
        puts('Added to favorites')
      when '2'
        #Має бути метод Recipe який редагує
        puts('Edited recipe')
      when '3'
        DATA.delete_from_data
        puts('Delete Recipe')
      end
    end
  end
end

class RecipeStore
  def add_to_data
    #Додає рецепт в файлик
  end

  def delete_from_data
    #Видаляє рецепт з файлика
  end

  def edit_recipe
    #Редагування
  end

  def all_recipes
    test_i = %w[apple milk egg]
    test_recipe_1 = RecipeTest.new(1, 'XXXA', test_i)
    test_recipe_2 = RecipeTest.new(2, 'XXX', test_i)
    test_recipe_3 = RecipeTest.new(3, 'XXX', %w[2 3 4])
    test_recipe_4 = RecipeTest.new(4, 'XXX', ['1', '2', '3'])
    test_recipe_5 = RecipeTest.new(5, 'XXX', ['1', '3', '4'])
    test_recipe_6 = RecipeTest.new(6, 'XXX', ['1', '2', '4'])
    recipe_list = [test_recipe_1, test_recipe_2, test_recipe_3, test_recipe_4, test_recipe_5, test_recipe_6]
    #Цей типу я захардокив, тут насправді має бути метод який считує з файлу і повертаю массив обєктів
  end
end

class Search
  def menu
    while true
      puts '1. Search by friedge'
      puts '2. Search by ingredients'
      puts ''
      puts 'Enter a number '
      user_input = gets.chomp
      case user_input
      when '1'
        SEARCH.by(SEARCH.ingredients_input)
        puts ''
        puts 'Puts Needed Recipe ID:'
        recipe_id_input = gets.chomp
        ACT.with_recipe(recipe_id_input)
      when '2'
        SEARCH.by(SEARCH.ingredients_input)
        puts ''
        puts 'Puts Needed Recipe ID:'
        recipe_id_input = gets.chomp
        ACT.with_recipe(recipe_id_input)
      end
    end
  end

  def ingredients_input
    puts('Set a ingredients, using comma betweуn')
    user_ingredients = gets.chomp
    user_ingredients = user_ingredients.split(/,/)
  end

  def name_input
    puts('Set a name')
    recipe_name = gets.chomp
  end

  def by(user_ing_list)
    recipe_data = DATA.all_recipes
    searched_recipe = recipe_data.find_all { |recipe| recipe.ingredients & user_ing_list != [] }
    searched_recipe.each { |recipe| puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}" }
  end

  def by_name()
    recipe_data = DATA.all_recipes
    recipe_name = name_input
    searched_recipe = recipe_data.find_all { |recipe| recipe.name == recipe_name }
    searched_recipe.each { |recipe| puts "Recipe Name: #{recipe.name}, ID:#{recipe.id}" }
  end

end

DATA = RecipeStore.new
ACT = RecipeAct.new
SEARCH = Search.new
SEARCH.menu