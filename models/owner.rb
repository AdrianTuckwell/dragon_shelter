require_relative('../db/sql_runner')

class Owner

  attr_reader :id, :name, :address, :total

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @address = options['address']
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO owners (name, address) VALUES ('#{@name}', '#{@address}') RETURNING *"
    owner = SqlRunner.run(sql).first 
    @id = owner['id'].to_i
  end

# ---------------------------------------------------------
  def self.all()
    sql = "SELECT * FROM owners"
    return Owner.map_items(sql)
  end

# ---------------------------------------------------------
  def self.total()
    return Owner.all.count
  end

# ---------------------------------------------------------
  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = #{id}"
    return Owner.map_item(sql)
  end

# ---------------------------------------------------------
  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

# ---------------------------------------------------------
  def self.map_items(sql)
    owners = SqlRunner.run(sql)
    result = owners.map { |owner| Owner.new( owner ) }
    return result
  end

# ---------------------------------------------------------
  def self.map_item(sql)
    result = Owner.map_items(sql)
    return result.first
  end

# ---------------------------------------------------------
  def self.update( options )
    sql = "UPDATE owners SET
          name='#{options['name']}',
          address='#{options['address']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

# ---------------------------------------------------------
  def self.destroy(id)
    sql = "DELETE FROM owners WHERE id=#{id}"
    SqlRunner.run( sql )
  end
end # --- Owner class end ---------------------------------