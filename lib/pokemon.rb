class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(name, type, db)

    @name = name
    @type = type
    @db = SQLite3::Database.new('db/pokemon.db')
end

def self.all
  @@all
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end

pokemon = Pokemon.new("Pikachu", "electric", @db)

Pokemon.all.each do |pokemons|
  Pokemon.save(id = pokemons.id, name = pokemon.name, type = pokemons.type)
end

def self.find(id, db)
  where_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  Pokemon.new(where_pokemon[0], where_pokemon[1], where_pokemon[2], db)
  binding.pry
end

end
