require 'json'
require './file'

class Db
    attr_accessor :file_name

    def initialize (file_name)
        @file_name = file_name
    end
    
    # Find section

    def parse_file
        data = JSON.parse(MyFile::File_.read(@file_name))
        if data.class != Array
            raise "Incorrect type of data in db file"
        end
        data
    end
    
    def comp (query, item)
        query.each do |key, value|
            if !(item.has_key?(key) && item[key] == value)
                return false
            end
        end
        true
    end

    def find_one (query)
        data = self.parse_file
        data.find { |item| self.comp(query, item) }
    end

    def find_by_id (id)
        self.find_one({ id: id })
    end

    def find (query)
        data = self.parse_file
        data.find_all { |item| self.comp(query, item) }
    end

    # Delete

    def delete (query)
        data = self.parse_file
        updated_data = data.map do |item|
            if self.comp(query, item)
                return { **item, **update_query }
            end
        end
    end

    # Create and edit

    def parse_and_write (data_item, rewrite)
        data = self.parse_file
        if rewrite
            MyFile::File_.write(@file_name, JSON.generate(data_item))
            return true
        end
        data.push(data_item)
        MyFile::File_.write(@file_name, JSON.generate(data))
        true
    end
    
    def create (item)
        self.parse_and_write(item, false)
        true
    end

    def edit (query, update_query)
        data = self.parse_file
        updated_data = data.map do |item|
            if self.comp(query, item)
                return { **item, **update_query }
            else
                return item
            end
            self.parse_and_write(updated_data, true)
        end
    end
end

def start
    db = Db.new('fridge.json')

    db.create({ a: 1, b: 2 })

    puts "#{ JSON.generate(db.find_one({ a: 1 })) }"
end

start
