require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id
  #step3: needs to be able to red and write keys
  def initialize(id:,name:,type:,db:) 
    #step 2:making sure it needs to be initilized and needs a pokemon class
    @id = id 
    @name = name 
    @type = type 
    @db = db
  end
  def self.save(name,type,db) #variables and db
    #saves instance pokemon with right id
    #look at error method and how it is being called
    #whats the method I need to call in my database to get into sql
    #the execute method and the argument would be the sql query
    sql = <<-SQL 
    INSERT INTO pokemon(name,type) 
    VALUES (?,?)
    SQL
    db.execute(sql, name, type)
  end
  #another way to enter it:
  # def db.execute("INSERT INTO pokemon(name,type) VALUES(?,?);", name, type)
  #insert into is what we use to add into the db
  #enter in ? instead of values because it starilize it
  def self.find(id,db)
    sql = <<-SQL 
          SELECT * FROM pokemon 
          WHERE id = ? 
          SQL
    found_pokemon = db.execute(sql, id).flatten
    #in pry what does found_pokemon equal? a nested array
    #returns [[1,"Pikachu","electric"]] if we use flatten it takes away the nested array 
    #and it becomes a one dementional array [1, "Pikachu", "electric"]
  # binding.pry
  Pokemon.new(id: found_pokemon[0],name: found_pokemon[1],type: found_pokemon[2],db: db)
  #now that it is in a nested array you add the attributes by their index numbers
  end
end
