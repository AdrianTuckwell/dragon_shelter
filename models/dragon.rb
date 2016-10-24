require_relative('../db/sql_runner')

class Dragon

  attr_reader :id, :name, :type

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO dragons (name, type) VALUES ('#{@name}', '#{@type}') RETURNING *"
    dragon = SqlRunner.run(sql).first
    @id = dragon['id'].to_i
  end

# ---------------------------------------------------------
  def self.all()
    sql = "SELECT * FROM dragons"
    return Dragon.map_items(sql)
  end

# ---------------------------------------------------------
  def self.find(id)
    sql = "SELECT * FROM dragons WHERE id = #{id}"
    return Dragon.map_item(sql)
  end

# ---------------------------------------------------------
  def self.delete_all()
    sql = "DELETE FROM dragons"
    SqlRunner.run(sql)
  end

# ---------------------------------------------------------
  def self.map_items(sql)
    dragons = SqlRunner.run(sql)
    result = dragons.map { |dragon| Dragon.new( dragon ) }
    return result
  end

# ---------------------------------------------------------
  def self.map_item(sql)
    result = Dragon.map_items(sql)
    return result.first
  end

# ---------------------------------------------------------
  def self.update( options )
    sql = "UPDATE dragons SET
          name='#{options['name']}'
          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

# ---------------------------------------------------------
  def self.destroy(id)
    sql = "DELETE FROM dragons WHERE id=#{id}"
    SqlRunner.run( sql )
  end
end # --- Dragon Class end --------------------------------