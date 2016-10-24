require_relative('../db/sql_runner')

class Adoption

  attr_reader :id, :dragon_id, :owner_id

  def initialize( options )
    @id = options['id'].to_i
    @dragon_id = options['dragon_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO adoptions (dragon_id, owner_id) VALUES (#{@dragon_id}, #{@owner_id}) RETURNING *"
    rental = SqlRunner.run(sql).first
    @id = owner['id']
  end
end # --- Adoption class end -------------------------------