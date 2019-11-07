class Pokemon

	 attr_accessor :id, :name, :type, :db


	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end 


	def self.save(name, type, db)
			db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
			#@id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
	end

	def self.find(id, db) 
		sql = <<-SQL 
			SELECT * FROM pokemon
			WHERE id = ?
			SQL

		pokemon_found = db.execute(sql, id).flatten
		Pokemon.new(id: pokemon_found[0], name: pokemon_found[1], type: pokemon_found[2], db: db)
	end

end
			
	