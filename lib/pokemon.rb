require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  
  def initialize(id:,name:,type:,db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  def self.save(name,type,db)
    sql = <<-SQL 
    INSERT INTO pokemon(name,type)
    VALUES (?,?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id,db)
    sql = <<-SQL 
          SELECT * FROM pokemon 
          WHERE id = ? 
          SQL
    found_pokemon = db.execute(sql, id).flatten
    #returns [[1,"Pikachu","electric"]] if we use flatten it takes away the nested array 
    #and it becomes a one dementional array [1, "Pikachu", "electric"]
  # binding.pry
  Pokemon.new(id: found_pokemon[0],name: found_pokemon[1],type: found_pokemon[2],db: db)
  #now that it is in a nested array you add the attributes by their index numbers
  end
end
