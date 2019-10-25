class Pokemon

    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end
    
    def self.save(name, type, db)
        sql = db.prepare("INSERT INTO pokemon(name, type) VALUES (?, ?)")
        sql.execute(name, type)
    end

    def self.find(id, db)
        sql = db.prepare("SELECT * FROM pokemon WHERE id = ?")
        result_set = sql.execute(id)

        results = result_set.collect do |row|
            pokemon = Pokemon.new(id: id, name: row[1], type: row [2], db: db)
            pokemon
        end
        results[0]
    end

end