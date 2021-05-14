require './db'

class Recipe
    attr_accessor :id, :name, :description, :is_favorite, :ingredients
  
    def initialize
      @db = Db.new('recipes.json')
    
      @ingredients = {}
    end

    def create (name, description, is_favorite, ingredients)
        @id = @db.generate_id
        @name = name
        @description = description
        @is_favorite = is_favorite
        @ingredients = ingredient       
        @db.create({ "id": @id, "name": name, "description": description, "is_favorite": is_favorite, "ingredients": ingredients })
    end

    def show_recipe
        puts "Recipe name: #{@name}, description: #{@description}, is favorite: #{@is_favorite}, ingredients: #{@ingredients}"
    end

    def appendIngredient(id, quantity)
        if @ingredients.has_key?("#{id}")
          @ingredients["#{id}"] += quantity
        else 
          @ingredients["#{id}"] = quantity
        end
    end

    def show_favorites
        @db.find({ "is_favorite": true })
    end

    def get_by_id (id)
        @db.find_by_id(id)
    end

    def save
        @db.edit(self)
    end

    def get_self (query)
        fromDb = @db.find_one(query)
        @id = fromDb.id
        @name = fromDb.name
        @description = fromDb.description
        @is_favorite = fromDb.is_favorite
        @ingredients = fromDb.ingredient 
    end
end