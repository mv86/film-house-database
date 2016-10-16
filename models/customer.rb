require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options.fetch('name')
    @funds = options.fetch('funds').to_f
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