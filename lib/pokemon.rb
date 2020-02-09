class Pokemon
attr_accessor :name, :type, :db, :id

def initialize(name, type, db, id=nil)
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
    );
  SQL
@db.execute(sql)
end

def self.save
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL

end
  #create
  #remove

end
