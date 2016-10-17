require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_f
  end

  def save()
    sql = "INSERT INTO customers 
      (name, funds)
      VALUES ('#{@name}', #{@funds}) 
      RETURNING *"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  def update
    sql = "UPDATE customers SET
    name = '#{@name}',
    funds = #{@funds}
    WHERE id = #{@id}"
    SqlRunner.run(sql)
    return nil
  end

  def ticket_purchase(film)
    purchase = 0
    if @funds >= film.price
      purchase += (@funds - film.price)
      purchase.round(2)
    end
    sql = "UPDATE customers SET
    name = '#{@name}',
    funds = #{purchase}
    WHERE id = #{@id}"
    SqlRunner.run(sql)
    return nil
  end

  # def ticket_purchase(no_of_tickets, film)
  #   purchase = 0
  #   if @funds >= film.price && no_of_tickets <= film.seats_unoccupied
  #     total_cost = (film.price * no_of_tickets)
  #     seats_left = (film.seats_unoccupied -= no_of_tickets)
  #     purchase += (@funds - total_cost)
  #     purchase.round(2)
  #   end
  #   sql = "UPDATE customers SET
  #   name = '#{@name}',
  #   funds = #{purchase}
  #   WHERE id = #{@id}"
  #   SqlRunner.run(sql)
  #   sql2 = "UPDATE films SET
  #   title = '#{@title}',
  #   price = #{@price},
  #   show_time = #{@show_time},
  #   seats_unoccupied = #{seats_left}
  #   WHERE id = #{@id}"
  #   SqlRunner.run(sql2)
  #   return nil
  # end

  def num_of_tickets
    sql = "SELECT * FROM customers
    INNER JOIN tickets ON 
    customers.id = tickets.customer_id
    WHERE customers.id = #{@id}"
    tickets_bought = SqlRunner.run(sql)
    total = tickets_bought.count
    return total
  end

  def self.all
    sql = "SELECT * FROM customers"
    customers = SqlRunner.run(sql)
    result = customers.map { |customer| Customer.new(customer)}
    return result
  end

  def self.delete_all
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
    return nil
  end

end