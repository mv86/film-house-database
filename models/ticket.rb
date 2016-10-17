require_relative('../db/sql_runner')

class Ticket

  attr_reader :id, :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets
      (customer_id, film_id)
      VALUES (#{@customer_id}, #{@film_id})
      RETURNING *"
    ticket = SqlRunner.run(sql).first
    @customer_id = ticket['customer_id'].to_i
    @film_id = ticket['film_id'].to_i
    @id = ticket['id'].to_i
  end

  # def charge_for_ticket
  #   sql = "SELECT funds FROM customers
  #   INNER JOIN tickets ON 
  #   customers.id = tickets.customer_id
  #   WHERE customers.id = #{@id}"
  #   sql2 = "SELECT price FROM films
  #   INNER JOIN tickets ON 
  #   films.id = tickets.film_id
  #   WHERE films.id = #{@id}"
  #   customer_funds = SqlRunner.run(sql)
  #   ticket_price = SqlRunner.run(sql2)
  #   charge_for_ticket = customer_funds[0].to_i - ticket_price[0].to_i
  #   sql3 = "UPDATE customers SET
  #   name = '#{@name}',
  #   funds = #{charge_for_ticket}
  #   WHERE id = #{@id}"
  #   SqlRunner.run(sql3)
  # end

  def self.all
    sql = "SELECT * FROM tickets"
    tickets = SqlRunner.run(sql)
    result = tickets.map { |ticket| Ticket.new(ticket) }
    return result
  end

  def self.delete_all
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
    return nil
  end

end