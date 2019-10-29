class Pokemon
  attr_accessor :name, :type, :id, :db
  def initialize(name:, type:, id:, db:)
    @name = name
    @type = type
    @id = id
    @db = db
  end
  
 def self.save(name, type, db)
    
    sql = <<-SQL
      INSERT INTO pokemon (name, type) 
      VALUES (?, ?)
    SQL
 
    db.execute(sql, name, type)
 
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    
    row = db.execute(sql, id)[0]
    
   # binding.pry
    
    pokemon = Pokemon.new(name: row[1],type: row[2], id: id, db: db)
    pokemon
  end
end
