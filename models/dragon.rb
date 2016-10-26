require_relative('../db/sql_runner')

class Dragon

  attr_reader :id, :name, :type, :trained, :admission_date, :trained_date, 
              :adopted, :adoption_date, :total, :total_adoptable, :total_adopted

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @type = options['type']
    @trained = options['trained']
    @adopted = options['adopted']
    @admission_date = options['admission_date']
    @trained_date = options['trained_date']
    @adoption_date = options['adoption_date']
  end

# ---------------------------------------------------------
  def save()
    sql = "INSERT INTO dragons ( name, 
                                 type, 
                                 trained,
                                 adopted,
                                 admission_date,
                                 trained_date,
                                 adoption_date) VALUES

                                ('#{@name}',
                                 '#{@type}',
                                 '#{@trained}', 
                                 '#{@adopted}', 
                                 '#{admission_date}',
                                 '#{trained_date}',
                                 '#{adoption_date}') RETURNING *"

    dragon = SqlRunner.run(sql).first
    @id = dragon['id'].to_i
  end

# ---------------------------------------------------------
  def self.all()
    sql = "SELECT * FROM dragons"
    return Dragon.map_items(sql)
  end

# ---------------------------------------------------------
  def self.total()
    return Dragon.all.count
  end

# ---------------------------------------------------------
  def self.adoptable()
    sql = "SELECT * FROM dragons WHERE trained = TRUE"
    return Dragon.map_items(sql)
  end

# ---------------------------------------------------------
  def self.total_adoptable()
    return Dragon.adoptable.count
  end

# ---------------------------------------------------------
  def self.adopted()
    sql = "SELECT * FROM dragons WHERE adopted = TRUE"
    return Dragon.map_items(sql)
  end

# ---------------------------------------------------------
  def self.total_adopted()
    return Dragon.adopted.count
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

          name    =  '#{options['name']}',
          type    =  '#{options['type']}',
          trained =  '#{options['trained']}',
          adopted =  '#{options['adopted']}',
          admission_date =  '#{options['admission_date']}',
          trained_date =    '#{options['trained_date']}',
          adoption_date =   '#{options['adoption_date']}'

          WHERE id='#{options['id']}'"
    SqlRunner.run( sql )
  end

# ---------------------------------------------------------
  def self.destroy(id)
    sql = "DELETE FROM dragons WHERE id=#{id}"
    SqlRunner.run( sql )
  end
end # --- Dragon Class end --------------------------------