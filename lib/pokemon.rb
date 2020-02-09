class Pokemon
attr_accessor :name, :type, :db, :id

def initialize(id:nil, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end

def self.create
  sql = <<-SQL
    CREATE TABLE IF NOT EXISTS pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT
    )
  SQL
@db.execute(sql)
end

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL
db.execute(sql, name, type)
@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.delete
  sql = <<-SQL
    DROP TABLE pokemon
  SQL
@db.execute(sql)
end

def self.find(id, db) #finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 1)
  sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = id
  SQL
  row = db.execute(sql)
  new_poke = self.new(id, name, type, db)
  self.id = row[0]
  self.name = row[1]
  self.type = row[2]
  new_poke
end

end
