class Pokemon
  attr_accessor :id, :name, :type, :db
  
 def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id_number, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id=? 
    SQL
    
    poke_details = db.execute(sql, id_number).flatten
    return Pokemon.new(id: poke_details[0], name: poke_details[1], type: poke_details[2], db: db)
  end

end
