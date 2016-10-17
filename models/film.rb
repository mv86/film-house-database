require_relative('../db/sql_runner')

class Film

  attr_reader :id
  attr_accessor :title, :price, :show_time, :seats_unoccupied

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_f
    @show_time = options['show_time'].to_f
    @seats_unoccupied = options['seats_unoccupied'].to_i
  end

  def save()
    sql = "INSERT INTO films
      (title, price, show_time, seats_unoccupied)
      VALUES ('#{@title}', #{@price}, #{@show_time}, #{@seats_unoccupied})
      RETURNING *"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def update
    sql = "UPDATE films SET
    title = '#{@title}',
    price = #{@price},
    show_time = #{@show_time},
    seats_unoccupied = #{@seats_unoccupied}
    WHERE id = #{@id}"
    SqlRunner.run(sql)
    return nil
  end

  def tickets_sold
    sql = "SELECT * FROM films
    INNER JOIN tickets ON 
    films.id = tickets.film_id WHERE
    films.id = #{@id}"
    num_of_tickets_sold = SqlRunner.run(sql)
    total = num_of_tickets_sold.count
    return total
  end

  def self.all
    sql = "SELECT * FROM films"
    films = SqlRunner.run(sql)
    result = films.map { |film| Film.new(film) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
    return nil
  end
  
end