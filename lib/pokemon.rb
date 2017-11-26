require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db


  def initialize(name, type, db= SQLite3::Database.new('db/pokemon.db'))
    @id = id
    @name = name
    @type = type
    @db = db

end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end


self.new("Pikachu", "electric", @db)

def self.find(id, db)
  @db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  pokemon = Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
  # pokemon = Pokemon.new(where_pokemon[0], where_pokemon[1], where_pokemon[2], db)

binding.pry
end

end
