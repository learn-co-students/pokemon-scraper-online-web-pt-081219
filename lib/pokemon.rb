class Pokemon
  attr_accessor(:name, :type, :db)
  attr_reader(:id)
  
  def initialize(
    id:,
    name: "Pikachu",
    type: "Electric",
    db:"pokemon"
    )
    
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save
    sql = <<-SQL
      INSERT INTO pokemon (name, type, db)
      VALUES (?,?,?,)
    SQL
    
    DB[:conn].execute(sql, self.name, self.type, self.db)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM students")[0][0][0]
  end
end