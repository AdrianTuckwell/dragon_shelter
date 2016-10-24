require_relative('../db/sql_runner')

class Dragon

  attr_reader :id, :name,

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO dragons (name) VALUES ('#{@name}') RETURNING *"
    dragon = SqlRunner.run(sql).first
    @id = dragon['id'].to_i
  end
end #--- Dragon Class end ---------------------------------