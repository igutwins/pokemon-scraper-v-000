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

def self.save(name, id, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL
@db.execute(sql, name, type)
@id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.delete
  sql = <<-SQL
    DROP TABLE pokemon
  SQL
@db.execute(sql)
end

end
