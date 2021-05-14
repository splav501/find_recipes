require './db'

class Fridge
    attr_accessor :ingredients
    def initialize
      @db = Db.new('fridge.json')

      @ingredients = {}
    end

    def create (ingredients)
        @id = @db.generate_id
        @ingredients = ingredients
        @db.create({ "id": @id, "ingredients": ingredients })
    end
  
    def show_ingredients
      puts @ingredients
    end
  
    def appendIngredient(name, quantity)
      if @ingredients.has_key?(name)
        @ingredients[name] += quantity
      elsif
        @ingredients[name] = quantity
      end
    end

    def save
        @db.edit(@id, self)
    end

    def get_self (query)
        fromDb = @db.find_one(query)
        @id = fromDb.id
        @ingredients = fromDb.ingredients
    end
end