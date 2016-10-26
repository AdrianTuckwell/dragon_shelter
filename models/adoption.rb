require_relative('../db/sql_runner')

class Adoption

  attr_reader :id, :dragon_id, :owner_id, :total

  def initialize( options )
    @id = options['id'].to_i
    @dragon_id = options['dragon_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO adoptions (dragon_id, owner_id) VALUES (#{@dragon_id}, #{@owner_id}) RETURNING *"
    owner = SqlRunner.run(sql).first
    @id = owner['id']
  end

# ---------------------------------------------------------
  def dragon()
    sql = "SELECT * FROM dragons WHERE id = #{@dragon_id}"
    return Dragon.map_item(sql)
  end

# ---------------------------------------------------------
  def owner()
    sql = "SELECT * FROM owners WHERE id = #{@owner_id}"
    return Owner.map_item(sql)
  end

# ---------------------------------------------------------
  def self.all()
    sql = "SELECT * FROM adoptions"
    return Adoption.map_items(sql)
  end

# ---------------------------------------------------------
  def self.total()
    return Adoption.all.count
  end

# ---------------------------------------------------------
  def self.delete_all()
    sql = "DELETE FROM adoptions"
    SqlRunner.run(sql)
  end

# ---------------------------------------------------------
  def self.map_items(sql)
    adoptions = SqlRunner.run(sql)
    result = adoptions.map { |adoption| Adoption.new( adoption ) }
    return result
  end

# ---------------------------------------------------------
  def self.map_item(sql)
    result = Adoption.map_items(sql)
    return result.first
  end

end # --- Adoption class end -------------------------------