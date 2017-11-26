require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = SQLite3::Database.new('db/pokemon.db')

end



def self.all
  @@all << self
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end


self.new(@id, "Pikachu", "electric", @db)

def self.find(id, db)
  where_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  pokemon = Pokemon.new(where_pokemon[0], where_pokemon[1], where_pokemon[2], db)

binding.pry
end

end
