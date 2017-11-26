require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db


  def initialize(name, type, db)
    @id = id
    @name = name
    @type = type
    @db = SQLite3::Database.new('db/pokemon.db')

end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end


self.new("Pikachu", "electric", @db)

def self.find(id, db)
  where_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  # pokemon = Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
  Pokemon.new(id = where_pokemon[0], name = where_pokemon[1], type= where_pokemon[2], @db)

binding.pry
end

end
