class Pokemon
attr_accessor :name, :type, :db

def initialize(name, type, db)

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
  #create
  #remove

end
