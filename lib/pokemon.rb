class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(keywords)
    
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
      SQL
      
      db.execute(sql, name, type)
    end
  
  def self.find(index, db)
    sql = <<-SQL
    SELECT * FROM pokemon
    WHERE id = ?
    SQL
    
    pokemon = db.execute(sql, index)
    new_pokemon = Pokemon.new(pokemon)
    new_pokemon.id = pokemon[0][0]
    new_pokemon.name = pokemon[0][1]
    new_pokemon.type = pokemon[0][2]
    return new_pokemon
    
  end
  
end
