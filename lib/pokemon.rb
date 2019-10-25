require 'pry'

class Pokemon
  attr_accessor(:name, :type, :db)
  attr_reader(:id)
  
  def initialize(
    id:,
    name: "Pikachu",
    type: "Electric",
    hp: nil,
    db:"pokemon"
    )
    
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?,?)
    SQL
    
    db.execute(sql, name, type)
    # binding.pry
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0][0]
  end
  
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ? LIMIT 1"
    result = db.execute(sql, id)[0]
    Pokemon.new(result[0], result[1], result[2], result[3])
  end
end