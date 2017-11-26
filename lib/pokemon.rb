class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(id, name, type, db=SQLite3::Database.new('db/pokemon.db'))
    @id = id
    @name = name
    @type = type
    @db = db
end

def self.all
  @@all
end

def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
end

pokemon = Pokemon.new("Pikachu", "electric")

Pokemon.all.each do |pokemon|
  Pokemon.save(pokemon.id, pokemon.name, pokemon.type, db)
end
binding.pry
def self.find(id, db)
  pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  Pokemon.new(pokemon[0], pokemon[1], pokemon[2], db)
end
end
