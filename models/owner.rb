require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO owners (name) VALUES ('#{@name}') RETURNING *"
    owner = SqlRunner.run(sql).first 
    @id = owner['id'].to_i
  end
end # --- Owner class end ----------------------------------