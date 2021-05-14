require './db'

class Ingridiet
    attr_accessor :id, :name
    def initialize
        @db = Db.new('ingridients.json')
    end

    def create (name)
        @name = name
        @id = @db.generate_id
        @db.create({ "name": name, "id": @id })
    end

    def save
        @db.edit(@id, self)
    end

    def get_by_id (id)
        @db.find_by_id(id)
    end

    def get_self (query)
        fromDb = @db.find_one(query)
        @id = fromDb.id
        @name = fromDb.name
    end
end