require_relative('./models/customer')
require_relative('./models/film')
require_relative('./models/ticket')
require('pry-byebug')

customer1 = Customer.new( {'name' => 'Max', 'funds' => 3.20} )
customer2 = Customer.new( {'name' => 'Carlos', 'funds' => 25.80} )
customer3 = Customer.new( {'name' => 'Cookie', 'funds' => 9.00} )
customer4 = Customer.new( {'name' => 'Cyrus', 'funds' => 44.20} )


film1 = Film.new( {'title' => 'Terminator', 'price' => 10.0} )
film2 = Film.new( {'title' => 'Titanic', 'price' => 2.0} )
film3 = Film.new( {'title' => 'Seven', 'price' => 12.50} )
film4 = Film.new( {'title' => 'Bad Boys 2', 'price' => 6.40} )
film5 = Film.new( {'title' => 'Cars', 'price' => 3.50} )


ticket1 = Ticket.new( {'customer_id' => @customer1_id, 'film_id' => @film1_id} )
ticket2 = Ticket.new( {'customer_id' => @customer3_id, 'film_id' => @film4_id} )
ticket3 = Ticket.new( {'customer_id' => @customer2_id, 'film_id' => @film5_id} )
ticket4 = Ticket.new( {'customer_id' => @customer4_id, 'film_id' => @film1_id} )
ticket5 = Ticket.new( {'customer_id' => @customer2_id, 'film_id' => @film3_id} )
ticket6 = Ticket.new( {'customer_id' => @customer3_id, 'film_id' => @film1_id} )
ticket7 = Ticket.new( {'customer_id' => @customer1_id, 'film_id' => @film4_id} )









binding.pry
nil