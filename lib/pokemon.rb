require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type) 
  end
  
  def self.find(id, db)
    # find pokemon by id
    # return a new pokemon object
    #.flatten is the same as putting .first tro get array out of nested array
    
  found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
  Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], db: db)
  # above we've created a new instance of pokemon & used the attributes as keys and the index # in array as values

end
  
end
